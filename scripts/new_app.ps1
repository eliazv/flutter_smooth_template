param(
  [Parameter(Mandatory=$true)]
  [string]$AppName,

  [Parameter(Mandatory=$true)]
  [string]$BundleId,

  [Parameter(Mandatory=$false)]
  [string]$SupportEmail = ''
)

$ErrorActionPreference = 'Stop'

if ([string]::IsNullOrWhiteSpace($SupportEmail)) {
  $slug = $AppName.ToLower().Replace(' ', '')
  $SupportEmail = "info+$slug@eliazavatta.it"
}

Write-Host "== Flutter Template New App =="
Write-Host "AppName: $AppName"
Write-Host "BundleId: $BundleId"
Write-Host "SupportEmail: $SupportEmail"

$bootstrap = Join-Path $PSScriptRoot 'bootstrap.ps1'
if (-not (Test-Path $bootstrap)) {
  throw 'bootstrap.ps1 non trovato in scripts/.'
}

& $bootstrap -AppName $AppName -BundleId $BundleId -SupportEmail $SupportEmail

Write-Host "Completato. Prossimi step:"
Write-Host "1) configura Firebase e RevenueCat"
Write-Host "2) imposta ADS_PROVIDER e feature flags"
Write-Host "3) esegui flutter analyze e flutter test"
