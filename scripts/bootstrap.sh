#!/usr/bin/env bash
set -euo pipefail

APP_NAME=${1:-}
BUNDLE_ID=${2:-}
SUPPORT_EMAIL=${3:-}

if [[ -z "$APP_NAME" || -z "$BUNDLE_ID" ]]; then
  echo "Uso: ./scripts/bootstrap.sh \"Nome App\" \"com.eliazavatta.nomeapp\" \"info+nomeapp@eliazavatta.it\""
  exit 1
fi

if [[ -z "$SUPPORT_EMAIL" ]]; then
  slug=$(echo "$APP_NAME" | tr '[:upper:]' '[:lower:]' | tr -d ' ')
  SUPPORT_EMAIL="info+${slug}@eliazavatta.it"
fi

echo "Bootstrap progetto Flutter template"
echo "AppName: $APP_NAME"
echo "BundleId: $BUNDLE_ID"
echo "SupportEmail: $SUPPORT_EMAIL"

flutter pub get

if [[ -f "./scripts/replace_placeholders.sh" ]]; then
  ./scripts/replace_placeholders.sh "$APP_NAME" "$BUNDLE_ID" "$SUPPORT_EMAIL"
fi

echo "Suggerimento: usa package rename per aggiornare nome app e bundle id"
echo "dart pub global activate rename"
echo "dart pub global run rename --appname \"$APP_NAME\""
echo "dart pub global run rename --bundleId \"$BUNDLE_ID\""

echo "Bootstrap completato"
