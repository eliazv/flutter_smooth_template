# Flutter Smooth Template

Template Flutter riutilizzabile per avviare nuove app con setup rapido, struttura coerente e moduli disattivabili.

## Avvio rapido

1. Installa dipendenze:
   - flutter pub get
2. Esegui bootstrap:
   - Windows: scripts/bootstrap.ps1 -AppName "Nome App" -BundleId "com.company.nomeapp"
   - macOS/Linux: scripts/bootstrap.sh "Nome App" "com.company.nomeapp"
3. Verifica qualità:
   - flutter analyze
   - flutter test

## Comandi utili

### Bootstrap completo

- scripts/bootstrap.ps1 -AppName "Nome App" -BundleId "com.company.nomeapp" -SupportEmail "info+nomeapp@eliazavatta.it"
- scripts/bootstrap.sh "Nome App" "com.company.nomeapp" "info+nomeapp@eliazavatta.it"

### Sostituzione placeholder manuale

- scripts/replace_placeholders.ps1 -AppName "Nome App" -BundleId "com.company.nomeapp" -SupportEmail "info+nomeapp@eliazavatta.it"
- scripts/replace_placeholders.sh "Nome App" "com.company.nomeapp" "info+nomeapp@eliazavatta.it"

### Creazione nuova app da template (helper)

- scripts/new_app.ps1 -AppName "Nome App" -BundleId "com.company.nomeapp"
- scripts/new_app.sh "Nome App" "com.company.nomeapp"

## Variabili e flag principali

### Feature flags

- ENABLE_ONBOARDING
- ENABLE_PAYWALL
- ENABLE_ADS
- ENABLE_BANNER_ADS
- ENABLE_INTERSTITIAL_ADS
- ENABLE_REWARDED_ADS
- ENABLE_UNITY_MEDIATION
- ENABLE_ANALYTICS
- ENABLE_REMOTE_CONFIG
- ENABLE_AUTH
- ENABLE_BACKEND_SYNC

### Provider ads

- ADS_PROVIDER=admob
- ADS_PROVIDER=unity_mediation
- ADS_PROVIDER=hybrid
- ADS_PROVIDER=disabled

### Dati app

- APP_NAME
- APP_FLAVOR
- ADMOB_BANNER_ID
- ADMOB_INTERSTITIAL_ID
- ADMOB_REWARDED_ID

## Contatto supporto

Formato standard consigliato per ogni app:

- info+nomeapp@eliazavatta.it

## Struttura progetto

- lib/core: config, theme, router, utilità
- lib/services: ads, analytics, purchases, storage
- lib/shared: widget riutilizzabili
- lib/features: feature-first architecture
- docs: guida completa
- scripts: automazioni bootstrap
- assets: struttura media pronta
- store: materiale ASO e listing

## Documentazione completa

- docs/setup.md
- docs/architettura_funzionalita.md
- docs/architettura.md
- docs/feature_flags.md
- docs/monetizzazione.md
- docs/database_strategy.md
- docs/checklist_release.md
- docs/smooth_package_alternative.md

## Stato qualità attuale

- Flutter analyze: pulito
- Flutter test: baseline presente
- CI GitHub Actions: inclusa
