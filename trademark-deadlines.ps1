<#
.SYNOPSIS
  Free, offline trademark deadline tracker (US federal registration).
.DESCRIPTION
  Computes USPTO Section 8 / 9 / 15 deadlines from your registration issue date
  and prints a schedule with fee estimates. Flags anything due within -WarnDays.
  No external dependencies, no accounts, no paid docketing service.
  General info, not legal advice.
.PARAMETER RegistrationDate
  The date your federal registration issued (the "Date of Registration" on the certificate).
.PARAMETER Classes
  Number of classes covered (affects fee math). Default 1.
.PARAMETER WarnDays
  How many days ahead to flag upcoming deadlines. Default 90.
.PARAMETER FirstUseDate
  Optional: your common-law first-use date, for an annual self-check reminder.
.EXAMPLE
  pwsh ./trademark-deadlines.ps1 -RegistrationDate 2026-03-15 -Classes 1
#>

[CmdletBinding()]
param(
  [datetime]$RegistrationDate,
  [int]$Classes = 1,
  [int]$WarnDays = 90,
  [datetime]$FirstUseDate
)

# 2026 USPTO electronic filing fees (per class) — verify at uspto.gov/trademark-fee-information
$S8 = 325; $S9 = 325; $Combined = 650; $S15 = 250; $Grace = 100

function Money($perClass) { return ('${0} ({1}/class x{2})' -f ($perClass * $Classes), $perClass, $Classes) }

$today = Get-Date

if (-not $RegistrationDate) {
  Write-Host "`nNo -RegistrationDate supplied -> common-law (free TM) mode." -ForegroundColor Cyan
  Write-Host "You have NO federal deadlines. Keep using the mark with TM and update"
  Write-Host "TRADEMARK_EVIDENCE_LOG.md at least once a year. No government fees apply."
  if ($FirstUseDate) {
    $anniv = $FirstUseDate
    while ($anniv -lt $today) { $anniv = $anniv.AddYears(1) }
    Write-Host ("Next annual self-check: {0:yyyy-MM-dd} (1 yr after first use {1:yyyy-MM-dd})" -f $anniv, $FirstUseDate)
  }
  exit 0
}

Write-Host ("`n=== Trademark Deadline Schedule (registration {0:yyyy-MM-dd}) ===" -f $RegistrationDate) -ForegroundColor Yellow
Write-Host ("Classes: {0}   Today: {1:yyyy-MM-dd}   Warn window: {2} days" -f $Classes, $today, $WarnDays)

$rows = @()

# Section 8 + optional Section 15: years 5-6
$open56 = $RegistrationDate.AddYears(5)
$close56 = $RegistrationDate.AddYears(6)
$rows += [pscustomobject]@{Window='Years 5-6'; Open=$open56; Due=$close56; Files='Section 8 (Declaration of Use)'; Fee=$(Money $S8)}
$rows += [pscustomobject]@{Window='Years 5-6 (opt)'; Open=$open56; Due=$close56; Files='Section 15 (Incontestability)'; Fee=$(Money $S15)}

# Combined Section 8 + 9 renewal: years 9-10, then every 10 years
$y = 9
while ($true) {
  $open = $RegistrationDate.AddYears($y)
  $close = $RegistrationDate.AddYears($y + 1)
  $rows += [pscustomobject]@{Window=('Years {0}-{1}' -f $y, ($y + 1)); Open=$open; Due=$close; Files='Section 8 + 9 (Combined renewal)'; Fee=$(Money $Combined)}
  if ($close -gt $today.AddYears(40)) { break }
  $y += 10
}

foreach ($r in $rows) {
  $graceDate = $r.Due.AddMonths(6)
  $days = ($r.Due - $today).Days
  $status = ''
  if ($today -gt $graceDate) { $status = 'EXPIRED/LOST' }
  elseif ($today -ge $r.Open) { $status = 'WINDOW OPEN' }
  if ($days -le $WarnDays -and $days -ge 0) { $status = 'ACTION NEEDED' }
  $color = if ($status -eq 'ACTION NEEDED') { 'Red' }
           elseif ($status -eq 'WINDOW OPEN') { 'Green' }
           elseif ($status -eq 'EXPIRED/LOST') { 'DarkRed' }
           else { 'White' }
  Write-Host ('{0,-16} open {1:yyyy-MM-dd}  due {2:yyyy-MM-dd}  grace {3:yyyy-MM-dd}  [{4}]  {5}  fee {6}' -f $r.Window, $r.Open, $r.Due, $graceDate, $status, $r.Files, $r.Fee) -ForegroundColor $color
}

Write-Host "`nFile during the open window to avoid the +`$100/class grace surcharge." -ForegroundColor Cyan
Write-Host "Always verify current fees at uspto.gov/trademark-fee-information." -ForegroundColor Cyan
