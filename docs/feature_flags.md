# Feature flags

## Filosofia

Ogni funzionalita opzionale deve potersi disattivare con una singola modifica config.

## Flag previste

- enableOnboarding
- enablePaywall
- enableAds
- enableBanner
- enableInterstitial
- enableRewarded
- enableUnityMediation
- enableAnalytics
- enableRemoteConfig
- enableAuth
- enableBackendSync

## Fonti valori

- default nel codice template
- override con dart-define
- override per flavor dev/prod

## Provider ads

Usa ADS_PROVIDER via dart-define:

- admob
- unity_mediation
- hybrid
- disabled

## Requisito di robustezza

Quando una feature e disattivata:

- nessun crash
- nessun import obbligatorio di SDK non necessari
- fallback a implementazione DisabledService
