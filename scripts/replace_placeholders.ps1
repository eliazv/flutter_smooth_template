param(
  [Parameter(Mandatory=$true)]
  [string]$AppName,

  [Parameter(Mandatory=$true)]
  [string]$BundleId,

  [Parameter(Mandatory=$true)]
  [string]$SupportEmail
)

$ErrorActionPreference = 'Stop'

$root = Split-Path -Parent $PSScriptRoot
$targets = Get-ChildItem -Path $root -Recurse -File |
  Where-Object {
    $_.FullName -notmatch '\\(\.git|\.dart_tool|build)\\' -and
    $_.Extension -in '.md', '.yaml', '.yml', '.dart', '.txt', '.json', '.plist', '.gradle', '.kts', '.xml'
  }

foreach ($file in $targets) {
  $content = Get-Content -Path $file.FullName -Raw
  $updated = $content.Replace('APP_NAME_PLACEHOLDER', $AppName)
  $updated = $updated.Replace('BUNDLE_ID_PLACEHOLDER', $BundleId)
  $updated = $updated.Replace('SUPPORT_EMAIL_PLACEHOLDER', $SupportEmail)

  if ($updated -ne $content) {
    Set-Content -Path $file.FullName -Value $updated -NoNewline
    Write-Host "Aggiornato: $($file.FullName)"
  }
}

Write-Host 'Sostituzione placeholder completata.'
