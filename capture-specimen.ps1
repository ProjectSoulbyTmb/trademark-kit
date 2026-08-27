<#
.SYNOPSIS
  Auto-capture a trademark specimen for THOTH and log it.
.DESCRIPTION
  Saves a dated copy of the mark-in-use into ./specimens and appends a row to
  TRADEMARK_EVIDENCE_LOG.md (right after the table header). Resolution order:
    1) -Source local file  -> copy it (fully offline)
    2) -Source URL         -> download it
    3) -Repo (default)     -> authenticated `gh api` (works for PRIVATE repos),
                              then public web fallback
  Dependency-free (PowerShell). `gh` is only used as a fallback for private repos.
  General info, not legal advice.
.PARAMETER Repo
  GitHub repo "owner/name" to capture the README from. Default: ProjectSoulbyTmb/olympos
.PARAMETER Source
  Override: a local file path or any URL to capture instead of a GitHub README.
.PARAMETER OutDir
  Folder for specimens. Default: ./specimens
.PARAMETER LogFile
  Evidence log to update. Default: ./TRADEMARK_EVIDENCE_LOG.md
.PARAMETER Commit
  If set, git-add + commit the new specimen (run inside the trademark-kit repo).
.EXAMPLE
  .\capture-specimen.ps1 -Commit
  .\capture-specimen.ps1 -Source D:\THOTH\README.md -Commit
#>

[CmdletBinding()]
param(
  [string]$Repo = 'ProjectSoulbyTmb/olympos',
  [string]$Source = '',
  [string]$OutDir = './specimens',
  [string]$LogFile = './TRADEMARK_EVIDENCE_LOG.md',
  [switch]$Commit
)

$ErrorActionPreference = 'Stop'
$today = Get-Date -Format 'yyyy-MM-dd'
if (-not (Test-Path $OutDir)) { New-Item -ItemType Directory -Path $OutDir | Out-Null }

$dest = $null
$where = ''
$saved = $false

if ($Source) {
  if (Test-Path $Source) {
    $dest = Join-Path $OutDir "${today}_$([System.IO.Path]::GetFileNameWithoutExtension($Source)).md"
    Copy-Item -Path $Source -Destination $dest -Force
    $where = "Local file: $Source"
    $saved = $true
    Write-Host "Saved specimen (local copy) -> $dest" -ForegroundColor Green
  } else {
    $dest = Join-Path $OutDir "${today}_$([System.IO.Path]::GetFileNameWithoutExtension($Source)).html"
    Write-Host "Capturing: $Source" -ForegroundColor Cyan
    Invoke-WebRequest -Uri $Source -OutFile $dest -Headers @{ 'User-Agent' = 'trademark-kit' }
    $where = $Source
    $saved = $true
    Write-Host "Saved specimen -> $dest" -ForegroundColor Green
  }
} else {
  # 1) Authenticated gh api (handles private repos)
  try {
    $b64 = & gh api "repos/$Repo/readme" --jq '.content' 2>$null
    if ($b64) {
      $bytes = [System.Convert]::FromBase64String($b64)
      $text  = [System.Text.Encoding]::UTF8.GetString($bytes)
      $dest  = Join-Path $OutDir "${today}_$(($Repo -replace '/','_'))_README.md"
      Set-Content -Path $dest -Value $text -Encoding UTF8
      $where = "GitHub README of $Repo (via gh api)"
      $saved = $true
      Write-Host "Saved specimen (via gh api) -> $dest" -ForegroundColor Green
    }
  } catch { Write-Host "gh api unavailable, trying web fallback..." -ForegroundColor Yellow }

  # 2) Public web fallback
  if (-not $saved) {
    $targetUrl = $null
    try {
      $meta = Invoke-RestMethod -Uri "https://api.github.com/repos/$Repo/readme" -Headers @{ 'User-Agent' = 'trademark-kit' }
      $targetUrl = $meta.download_url; $where = "GitHub README of $Repo (raw)"
    } catch {
      foreach ($b in @('main', 'master')) {
        $u = "https://raw.githubusercontent.com/$Repo/$b/README.md"
        try { Invoke-WebRequest -Uri $u -Method Head -ErrorAction Stop | Out-Null; $targetUrl = $u; $where = "GitHub README of $Repo (raw, $b)"; break } catch {}
      }
    }
    if (-not $targetUrl) { Write-Error "Could not resolve a README for $Repo (and -Source not given)."; exit 1 }
    $dest = Join-Path $OutDir "${today}_$(($Repo -replace '/','_'))_README.md"
    Write-Host "Capturing: $targetUrl" -ForegroundColor Cyan
    Invoke-WebRequest -Uri $targetUrl -OutFile $dest -Headers @{ 'User-Agent' = 'trademark-kit' }
    $saved = $true
    Write-Host "Saved specimen -> $dest" -ForegroundColor Green
  }
}

# Append a row to the evidence log, right after the table separator.
$fileName = Split-Path $dest -Leaf
$row = "| $today | $where | $fileName |"
if (Test-Path $LogFile) {
  $lines = Get-Content $LogFile
  if ($lines -contains $row) {
    Write-Host "Row already present; skipped." -ForegroundColor Yellow
  } else {
    $out = @(); $inserted = $false
    for ($i = 0; $i -lt $lines.Count; $i++) {
      $out += $lines[$i]
      if (-not $inserted -and $lines[$i] -match '^\|[-\s|]+\|$') {
        $out += $row; $inserted = $true
      }
    }
    if (-not $inserted) { $out += $row }
    Set-Content $LogFile -Value $out
    Write-Host "Logged row in $LogFile" -ForegroundColor Green
  }
}

if ($Commit) {
  git add -A
  git commit -q -m "trademark-kit: auto-capture THOTH specimen $today"
  Write-Host "Committed." -ForegroundColor Green
}

<#
SCHEDULE (optional, Windows, run as admin):
  $action = New-ScheduledTaskAction -Execute 'pwsh' -Argument '-ExecutionPolicy Bypass -File "<ABS>/capture-specimen.ps1" -Commit'
  $trigger = New-ScheduledTaskTrigger -Weekly -DaysOfWeek Monday -At 9am
  Register-ScheduledTask -TaskName 'THOTH-Trademark-Specimen' -Action $action -Trigger $trigger -Force
#>
