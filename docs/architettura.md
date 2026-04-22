# Architettura del template

Documento unico di riferimento su architettura, conformita al playbook e linee evolutive.

## Obiettivo

Standardizzare la base tecnica tra piu app Flutter mantenendo ogni modulo disaccoppiato e disattivabile.

## Valutazione stato attuale

### Esito

Architettura buona, moderna e corretta per app Flutter 2026 con focus monetizzazione e clonabilita.

### Punti forti

- Feature-first architecture
- Riverpod + go_router
- Servizi astratti con implementazioni sostituibili
- Feature flags centralizzate
- Layer ads con supporto AdMob/Unity mediation
- Storage plug-and-play
- Design system centralizzato

### Gap non bloccanti

- Integrazione runtime completa smooth_onboarding/smooth_paywall da finalizzare per singola app
- Flavor completi dev/prod per piattaforme da completare
- Test specifici su servizi monetizzazione da estendere

## Struttura principale

- core: configurazione globale, tema, router, logging, utility
- services: contratti e implementazioni dei servizi esterni
- shared: componenti UI riutilizzabili e adapter UI
- features: moduli verticali per dominio funzionale

## Regole tecniche

- Nessuna logica di business dentro i widget
- UI dipende solo da provider/controller
- I controller dipendono da interfacce, non da SDK esterni
- Ogni integrazione esterna vive in services
- Ogni feature puo essere disattivata da feature flags

## Decisione importante

Il template definisce contratti e fallback disabled. Le implementazioni concrete (DB, backend, ads strategy) si possono scegliere dopo il clone.

## Feature-first schema

- features/home
- features/onboarding
- features/paywall
- features/settings

Ogni feature usa:

- data
- domain
- presentation

## Conformita rispetto al playbook

### Coperto

- Repo template base
- Struttura core/features/shared/services
- Routing + state management
- Design system base
- Monetizzazione pluggabile
- Analytics layer
- Feature template duplicabile
- Documentazione docs
- Script bootstrap
- Cartella store
- CI base
- Feature flags
- Supporto ads banner/interstitial/rewarded
- Supporto mediazione Unity
- Scelta DB rimandabile

### Da completare nel clone specifico

- Integrazione SDK RevenueCat effettiva
- Config native Unity mediation Android/iOS
- Firebase project reale
- Icone/splash/firme store reali

## Pattern tecnici raccomandati

- Repository pattern per data/domain/presentation
- Nessun SDK esterno direttamente in widget
- Nessun singleton globale hardcoded
- Config feature-first, non folder-by-type globale
- Error handling centralizzato con toast/bottom sheet

## Evoluzioni moderne consigliate

### Priorita alta

1. Flavor dev/prod completi Android/iOS
2. Remote config provider reale
3. Crash reporting (Sentry o Firebase Crashlytics)
4. Telemetry performance (startup time, frame drops)
5. Localizzazione completa con ARB
6. Test golden per design system

### Priorita media

1. Offline sync strategy e retry queue
2. Dependency graph checks in CI
3. Bundle size guard in CI
4. Feature rollout con percentuali
5. Script generator feature da template

## Decisioni per-app (non da fissare nel template)

- Database concreto (SharedPreferences/Hive/Isar/Drift)
- Strategia monetizzazione finale
- Frequenza e placement ads
- Ordine onboarding/paywall
- Backend e auth provider

## Regole operative

- Tutto disattivabile via flag
- Tutto sostituibile via interfaccia
- Nessuna dipendenza vendor diretta in feature
- Nessuna chiave sensibile nel repository

## Anti-pattern da evitare

- cartelle globali per tipo (screens/widgets/models)
- setState diffuso per logica applicativa
- singleton statici come dipendenza implicita
- chiamate SDK AdMob/RevenueCat direttamente nei widget

## Checklist tecnica per nuova app

- Esegui bootstrap script
- Applica placeholders nome/bundle/email
- Imposta flags iniziali
- Configura provider ads/purchase
- Esegui analyze/test
- Completa store-description manualmente
