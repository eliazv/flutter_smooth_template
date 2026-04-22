#!/bin/bash

# Build Flutter web app for production
# Usage: ./scripts/build_web.sh

set -e

echo "🌐 Building Flutter web app..."

# Web doesn't support mobile-only packages
# Disable mobile-specific features via dart-define
flutter build web \
  --dart-define=enableAds=false \
  --dart-define=enableBannerAds=false \
  --dart-define=enableInterstitialAds=false \
  --dart-define=enableRewardedAds=false \
  --release

echo "✅ Web build complete!"
echo "📦 Output: build/web/"
