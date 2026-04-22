param(
  [Parameter(Mandatory=$true)]
  [string]$AppName,

  [Parameter(Mandatory=$true)]
  [string]$BundleId,

  [Parameter(Mandatory=$false)]
  [string]$SupportEmail = ''
)

Write-Host "Bootstrap progetto Flutter template"
Write-Host "AppName: $AppName"
Write-Host "BundleId: $BundleId"

if ([string]::IsNullOrWhiteSpace($SupportEmail)) {
  $slug = $AppName.ToLower().Replace(' ', '')
  $SupportEmail = "info+$slug@eliazavatta.it"
}
Write-Host "SupportEmail: $SupportEmail"

$ErrorActionPreference = 'Stop'

if (-not (Get-Command flutter -ErrorAction SilentlyContinue)) {
  throw "Flutter non trovato nel PATH."
}

flutter pub get

$replaceScript = Join-Path $PSScriptRoot 'replace_placeholders.ps1'
if (Test-Path $replaceScript) {
  & $replaceScript -AppName $AppName -BundleId $BundleId -SupportEmail $SupportEmail
}

if (Get-Command dart -ErrorAction SilentlyContinue) {
  Write-Host "Suggerimento: installa e usa package rename per aggiornare nome app e bundle id automaticamente."
  Write-Host "dart pub global activate rename"
  Write-Host "dart pub global run rename --appname '$AppName'"
  Write-Host "dart pub global run rename --bundleId '$BundleId'"
}

Write-Host "Bootstrap completato. Aggiorna file piattaforma se necessario (Android/iOS)."
