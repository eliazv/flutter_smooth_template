#!/usr/bin/env bash
set -euo pipefail

APP_NAME=${1:-}
BUNDLE_ID=${2:-}
SUPPORT_EMAIL=${3:-}

if [[ -z "$APP_NAME" || -z "$BUNDLE_ID" ]]; then
  echo "Uso: ./scripts/new_app.sh \"Nome App\" \"com.company.nomeapp\" \"info+nomeapp@eliazavatta.it\""
  exit 1
fi

if [[ -z "$SUPPORT_EMAIL" ]]; then
  slug=$(echo "$APP_NAME" | tr '[:upper:]' '[:lower:]' | tr -d ' ')
  SUPPORT_EMAIL="info+${slug}@eliazavatta.it"
fi

echo "== Flutter Template New App =="
echo "AppName: $APP_NAME"
echo "BundleId: $BUNDLE_ID"
echo "SupportEmail: $SUPPORT_EMAIL"

if [[ ! -f "./scripts/bootstrap.sh" ]]; then
  echo "Errore: scripts/bootstrap.sh non trovato"
  exit 1
fi

./scripts/bootstrap.sh "$APP_NAME" "$BUNDLE_ID" "$SUPPORT_EMAIL"

echo "Completato. Prossimi step:"
echo "1) configura Firebase e RevenueCat"
echo "2) imposta ADS_PROVIDER e feature flags"
echo "3) esegui flutter analyze e flutter test"
