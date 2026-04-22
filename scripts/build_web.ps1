param(
    [switch]$Release = $true
)

Write-Host "🌐 Building Flutter web app..." -ForegroundColor Cyan

# Web doesn't support mobile-only packages
# Disable mobile-specific features via dart-define
$buildMode = if ($Release) { "--release" } else { "" }

flutter build web `
  --dart-define=enableAds=false `
  --dart-define=enableBannerAds=false `
  --dart-define=enableInterstitialAds=false `
  --dart-define=enableRewardedAds=false `
  $buildMode

if ($?) {
    Write-Host "✅ Web build complete!" -ForegroundColor Green
    Write-Host "📦 Output: build/web/" -ForegroundColor Yellow
} else {
    Write-Host "❌ Build failed" -ForegroundColor Red
    exit 1
}
