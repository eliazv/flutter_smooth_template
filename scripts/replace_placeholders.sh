#!/usr/bin/env bash
set -euo pipefail

APP_NAME=${1:-}
BUNDLE_ID=${2:-}
SUPPORT_EMAIL=${3:-}

if [[ -z "$APP_NAME" || -z "$BUNDLE_ID" || -z "$SUPPORT_EMAIL" ]]; then
  echo "Uso: ./scripts/replace_placeholders.sh \"Nome App\" \"com.eliazavatta.nomeapp\" \"info+nomeapp@eliazavatta.it\""
  exit 1
fi

find . -type f \
  ! -path './.git/*' \
  ! -path './.dart_tool/*' \
  ! -path './build/*' \
  \( -name '*.md' -o -name '*.yaml' -o -name '*.yml' -o -name '*.dart' -o -name '*.txt' -o -name '*.json' -o -name '*.plist' -o -name '*.gradle' -o -name '*.kts' -o -name '*.xml' \) \
  -print0 |
while IFS= read -r -d '' file; do
  perl -i -pe "s/APP_NAME_PLACEHOLDER/$APP_NAME/g; s/BUNDLE_ID_PLACEHOLDER/$BUNDLE_ID/g; s/SUPPORT_EMAIL_PLACEHOLDER/$SUPPORT_EMAIL/g" "$file"
done

echo "Sostituzione placeholder completata."
