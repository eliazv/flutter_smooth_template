# Alternative ai pacchetti Smooth

Documento con alternative moderne ai pacchetti attuali, con pro/contro e quando usarle.

## 1. smooth_onboarding

Pacchetto attuale: smooth_onboarding ^0.2.3

Alternative valide:

1. onboarding

- Pro: semplice, leggero, rapido da integrare
- Contro: meno opinionated sul design

2. introduction_screen

- Pro: molto usato, setup veloce, supporto skip/done
- Contro: UI più standard, meno custom out-of-box

3. flutter_app_intro_screen

- Pro: personalizzazione buona, animazioni integrate
- Contro: ecosistema più piccolo

Scelta consigliata:

- Se vuoi massima velocità: introduction_screen
- Se vuoi controllo UI personalizzato: onboarding + widget custom

## 2. smooth_paywall

Pacchetto attuale: smooth_paywall ^0.0.4

Alternative valide:

1. purchases_ui_flutter

- Pro: ufficiale RevenueCat, riduce lavoro custom
- Contro: personalizzazione limitata rispetto a paywall custom

2. superwallkit_flutter

- Pro: A/B test paywall, gestione remota avanzata
- Contro: stack più complesso, dipendenza forte dal provider

3. Paywall custom + purchases_flutter

- Pro: massimo controllo UX e branding
- Contro: più effort iniziale

Scelta consigliata:

- Per velocità business: purchases_ui_flutter
- Per controllo totale: paywall custom con purchases_flutter

## 3. smooth_bottom_sheet

Pacchetto attuale: smooth_bottom_sheet ^0.0.4

Alternative valide:

1. ModalBottomSheet nativo Flutter

- Pro: stabile, zero dipendenze extra, supporto ufficiale
- Contro: meno effetti avanzati preconfigurati

2. modal_bottom_sheet

- Pro: transizioni migliori, controllo avanzato iOS-style
- Contro: dipendenza esterna in più

3. draggable_bottom_sheet

- Pro: ottimo per pannelli dinamici
- Contro: richiede gestione UX più attenta

Scelta consigliata:

- Per robustezza: nativo Flutter
- Per UX avanzata: modal_bottom_sheet

## 4. smooth_toast

Pacchetto attuale: smooth_toast ^0.1.1

Alternative valide:

1. ScaffoldMessenger (SnackBar)

- Pro: ufficiale, stabile, già in framework
- Contro: meno varianti predefinite

2. fluttertoast

- Pro: semplice per toast rapidi
- Contro: meno controllo design Material 3

3. another_flushbar

- Pro: feedback altamente personalizzabile
- Contro: API più articolata

Scelta consigliata:

- Per coerenza Material: ScaffoldMessenger
- Per toast custom spinti: another_flushbar

## Strategia pratica per template

Mantieni wrapper interni:

- AppOnboardingService
- AppPaywallService
- AppBottomSheet
- AppToast

In questo modo puoi sostituire libreria in futuro senza toccare le feature.
