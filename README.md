# Flutter Smooth Template

Template riutilizzabile per creare app Flutter con setup rapido, architettura coerente e moduli facilmente attivabili o disattivabili.

## Obiettivo

Ridurre al minimo il lavoro ripetitivo:

- clone template
- bootstrap
- attiva solo i moduli necessari
- inizia sviluppo feature

## Principi fondamentali

- Architettura feature-first
- Core stabile e condiviso
- Servizi astratti con implementazioni intercambiabili
- Config centralizzata con feature flags
- Nessun lock-in precoce su DB o provider esterni

## Stack standard

- State management: Riverpod
- Routing: go_router
- Networking: dio
- Data model: freezed + json_serializable
- Logging: logger
- Storage: contratto unico + implementazioni plug and play

## Librerie richieste

- smooth_onboarding
- smooth_paywall
- smooth_bottom_sheet
- smooth_toast

Regola UI: usa bottom sheet e wrapper condivisi, evita modal custom sparse.

## Cosa decidere subito nel template

- struttura cartelle
- contratti servizi (StorageService, AdsService, AnalyticsService, PurchaseService)
- design system (colors, typography, spacing, radius, theme)
- eventi analytics base
- entry-point con moduli togglable

## Cosa decidere dopo il clone

- DB locale: SharedPreferences, Hive, Isar, Drift
- strategia monetizzazione: ads, freemium, subscription
- provider ads: AdMob, Unity mediation, hybrid
- onboarding flow
- backend (Firebase, Supabase, API custom)
- feature opzionali (leaderboard, cloud sync, social login)

## Struttura repository

```text
flutter_smooth_template/
├── README.md
├── pubspec.yaml
├── analysis_options.yaml
├── .gitignore
├── .github/workflows/flutter_ci.yml
├── docs/
│   ├── architettura.md
│   ├── setup.md
│   ├── stile.md
│   ├── monetizzazione.md
│   ├── aso.md
│   ├── checklist_release.md
│   ├── database_strategy.md
│   └── feature_flags.md
├── scripts/
│   ├── bootstrap.ps1
│   └── bootstrap.sh
├── store/
│   ├── description.txt
│   ├── keywords.txt
│   ├── privacy_policy_template.md
│   └── screenshots/
└── lib/
    ├── main.dart
    ├── app.dart
    ├── core/
    │   ├── config/
    │   ├── logging/
    │   ├── router/
    │   ├── theme/
    │   └── utils/
    ├── services/
    │   ├── ads/
    │   ├── analytics/
    │   ├── purchases/
    │   ├── storage/
    │   └── services.dart
    ├── shared/
    │   └── widgets/
    │       ├── ads/
    │       └── ui/
    └── features/
        ├── feature_template/
        ├── home/
        ├── onboarding/
        └── paywall/
```

## Moduli disattivabili

Feature flags disponibili:

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

Configurazione consigliata:

- default nel template
- override con dart-define
- override per flavor dev/prod

Esempi:

- --dart-define=ENABLE_ADS=false
- --dart-define=ENABLE_PAYWALL=false

## Provider ads selezionabile

Imposta ADS_PROVIDER:

- admob
- unity_mediation
- hybrid
- disabled

Nota: la mediazione Unity con AdMob richiede setup nativo e dashboard oltre al codice Dart.

## Ads e monetizzazione

Supporto template:

- Banner
- Interstitial
- Rewarded

Pattern corretto:

- UI dipende da AdsService e PurchaseService
- provider concreto scelto in services.dart
- quando premium attivo, ads disattivate centralmente

## Storage plug and play

Il template espone StorageService.

Implementazioni attuali:

- MemoryStorageService (default template)
- SharedPreferencesStorageService

Implementazioni previste per app specifiche:

- HiveStorageService
- IsarStorageService
- DriftStorageService

## Design system

Componenti base nel core:

- AppColors
- AppTypography
- AppSpacing
- AppRadius
- AppTheme

Widget shared:

- AppBottomSheet
- AppToast
- SmartBanner
- RewardedButton

## Workflow operativo

1. Crea nuovo repo da template
2. Esegui bootstrap
3. Aggiorna nome app e bundle id
4. Configura Firebase, AdMob, RevenueCat
5. Imposta flags e provider
6. Implementa feature reali partendo da feature_template
7. Esegui checklist release

## Checklist rapida

- rename app
- bundle id
- icone e splash
- setup firebase
- setup admob
- setup revenuecat
- ATT iOS
- privacy policy
- store listing

## CI e qualita

Workflow inclusa:

- flutter pub get
- flutter analyze
- flutter test

## Convenzioni

- package id: com.eliazavatta.appname
- support email consigliata: info+nomeapp@eliazavatta.it
- cartelle: snake_case
- file screen: \*\_screen.dart
- controller: \*\_controller.dart
- service: interfaccia + implementazione

## Sostituzione placeholder

Script inclusi:

- scripts/replace_placeholders.ps1
- scripts/replace_placeholders.sh

Placeholder supportati:

- APP_NAME_PLACEHOLDER
- BUNDLE_ID_PLACEHOLDER
- SUPPORT_EMAIL_PLACEHOLDER

## Prossimi step nel repository

- completare integrazione smooth_onboarding reale
- completare integrazione smooth_paywall reale con RevenueCat
- aggiungere strategy hybrid ads avanzata
- aggiungere generator per nuova feature
- aggiungere flavor dev/prod completi
