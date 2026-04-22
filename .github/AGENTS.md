# AGENTS.md

Istruzioni base per agent che lavorano su questo repository.

## Missione

Mantenere il template Flutter stabile, moderno e facilmente clonabile.

## Priorità

1. preservare architettura feature-first
2. evitare coupling tra feature e provider esterni
3. mantenere tutto disattivabile tramite flag
4. aggiornare docs insieme alle modifiche di codice

## Percorsi importanti

- lib/core: configurazione globale
- lib/services: contratti + implementazioni
- lib/features: moduli applicativi
- docs: documentazione operativa
- scripts: automazioni bootstrap/sostituzione

## Regole operative

- non introdurre credenziali reali
- usare placeholder APP_NAME_PLACEHOLDER, BUNDLE_ID_PLACEHOLDER, SUPPORT_EMAIL_PLACEHOLDER
- mantenere script Windows e macOS/Linux allineati
- validare sempre con flutter analyze

## Quality gate minimo

- flutter pub get
- flutter analyze
- flutter test
