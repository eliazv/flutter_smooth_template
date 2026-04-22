# Architettura e funzionalità complete

Documento completo su architettura, standard moderni, conformità al playbook e miglioramenti consigliati.

## 1. Valutazione architettura attuale

### Esito

Architettura buona, moderna e corretta per app Flutter 2026 con focus monetizzazione + clonabilità.

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
- Mancano ancora flavor completi dev/prod per piattaforme
- Mancano test specifici di servizi monetizzazione

## 2. Conformità rispetto ad avvio.md

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

## 3. Pattern tecnici raccomandati

- Repository pattern per data/domain/presentation
- Nessun SDK esterno direttamente in widget
- Nessun singleton globale hardcoded
- Config feature-first, non folder-by-type globale
- Error handling centralizzato con toast/bottom sheet

## 4. Componenti moderni da aggiungere (priorità alta)

1. Flavor dev/prod completi Android/iOS
2. Remote config provider reale
3. Crash reporting (Sentry o Firebase Crashlytics)
4. Telemetry performance (startup time, frame drops)
5. Localizzazione completa con ARB
6. Test golden per design system

## 5. Componenti moderni opzionali (priorità media)

1. Offline sync strategy e retry queue
2. Dependency graph checks in CI
3. Bundle size guard in CI
4. Feature rollout con percentuali
5. Script generator feature da template

## 6. Decisioni per-app (non da fissare nel template)

- Database concreto (SharedPreferences/Hive/Isar/Drift)
- Strategia monetizzazione finale
- Frequenza e placement ads
- Ordine onboarding/paywall
- Backend e auth provider

## 7. Regole operative

- Tutto disattivabile via flag
- Tutto sostituibile via interfaccia
- Nessuna dipendenza vendor diretta in feature
- Nessuna chiave sensibile nel repository

## 8. Checklist tecnica per ogni nuova app

- Esegui bootstrap script
- Applica placeholders nome/bundle/email
- Imposta flags iniziali
- Configura provider ads/purchase
- Esegui analyze/test
- Completa store-description manualmente
