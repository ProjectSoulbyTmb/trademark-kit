<#
.SYNOPSIS
  Auto-capture VOLTAGE THOTH specimens from all watch targets, then commit once.
.DESCRIPTION
  Iterates a list of "where VOLTAGE THOTH may appear" targets (a public GitHub
  repo, your local THOTH docs, or any URL), runs capture-specimen.ps1 for each
  WITHOUT committing individually, then makes ONE git commit (and push, with
  -Push) if anything changed. Designed to be run on a schedule or right after you
  publish VOLTAGE THOTH somewhere new.

  Idempotent: re-running adds no duplicate log rows (capture-specimen dedupes by
  source) and commits nothing when nothing changed.
.PARAMETER KitDir
  Path to the trademark-kit repo. Default: the folder this script lives in.
.PARAMETER Branch
  Branch to push to. Default: master.
.PARAMETER Push
  If set, git-push the commit to origin after committing.
.EXAMPLE
  pwsh ./auto-capture.ps1 -Push
#>

[CmdletBinding()]
param(
  [string]$KitDir = $PSScriptRoot,
  [string]$Branch = 'master',
  [switch]$Push
)

$ErrorActionPreference = 'Stop'
$here = Resolve-Path $KitDir
Push-Location $here
try {
  $capture = Join-Path $here 'capture-specimen.ps1'
  $today = Get-Date -Format 'yyyy-MM-dd'

  # ---- Watch targets: add any new place you publish VOLTAGE THOTH ----
  $targets = @(
    @{ Repo   = 'ProjectSoulbyTmb/voltage-thoth' }   # public brand page (primary)
    @{ Source = 'D:\THOTH\DESIGN.md' }               # kernel design doc (names THOTH in VOLTAGE OS)
    @{ Source = 'D:\THOTH\STRATEGY.md' }             # strategy doc
    # @{ Source = 'https://your-public-site.example/voltage-thoth' }  # add new public pages here
  )

  foreach ($t in $targets) {
    $args = @('-ExecutionPolicy', 'Bypass', '-File', $capture)
    $label = ''
    if ($t.ContainsKey('Repo'))   { $args += '-Repo';   $args += $t.Repo;   $label = $t.Repo }
    if ($t.ContainsKey('Source')) { $args += '-Source'; $args += $t.Source; $label = $t.Source }
    Write-Host "--- target: $label ---" -ForegroundColor Cyan
    & pwsh @args 2>&1 | ForEach-Object { Write-Host "   $_" }
  }

  # Single commit for everything that changed this run.
  $changed = git status --porcelain
  if ($changed) {
    git add -A
    git commit -q -m "trademark-kit: auto-capture VOLTAGE THOTH specimens $today"
    Write-Host "Committed:" -ForegroundColor Green
    $changed | ForEach-Object { Write-Host "   $_" }
    if ($Push) {
      git push origin $Branch 2>&1 | ForEach-Object { Write-Host "   $_" }
    }
  } else {
    Write-Host "No new specimens; nothing to commit." -ForegroundColor Yellow
  }
} finally {
  Pop-Location
}

<#
SCHEDULE (Windows, run as admin) — weekly auto-capture + push:
  $kit = Resolve-Path "<ABS>/auto-capture.ps1"
  $action  = New-ScheduledTaskAction -Execute 'pwsh' -Argument "-ExecutionPolicy Bypass -File `"$kit`" -Push"
  $trigger = New-ScheduledTaskTrigger -Weekly -DaysOfWeek Monday -At 9am
  Register-ScheduledTask -TaskName 'VOLTAGE-THOTH-Specimen' -Action $action -Trigger $trigger -Force
#>
