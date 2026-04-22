# CLAUDE.md

Informazioni essenziali del progetto per agent e automazioni.

## Obiettivo progetto

Template Flutter moderno, feature-first, orientato a clonazione rapida e monetizzazione.

## Stack standard

- flutter_riverpod
- go_router
- dio
- logger
- google_mobile_ads
- firebase_analytics

## Regole architetturali

- non usare singleton globali diretti nelle feature
- usare interfacce in lib/services
- configurare tutto via feature flags
- non hardcodare chiavi/segreti

## UX conventions

- usare bottom sheet per azioni contestuali
- wrapper UI condivisi in lib/shared/widgets
- design tokens in lib/core/theme

## Setup rapido

- flutter pub get
- flutter analyze
- flutter test

## Automazioni disponibili

- scripts/bootstrap.ps1|.sh
- scripts/new_app.ps1|.sh
- scripts/replace_placeholders.ps1|.sh

## Contatto supporto

- formato standard: info+nomeapp@eliazavatta.it
