# Architettura del template

## Obiettivo

Standardizzare la base tecnica tra piu app Flutter mantenendo ogni modulo disaccoppiato e disattivabile.

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

## Anti-pattern da evitare

- cartelle globali per tipo (screens/widgets/models)
- setState diffuso per logica applicativa
- singleton statici come dipendenza implicita
- chiamate SDK AdMob/RevenueCat direttamente nei widget
