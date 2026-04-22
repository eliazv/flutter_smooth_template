# Monetizzazione

## Principio

La UI non conosce il provider ads o purchase. Dipende solo da interfacce.

## Contratti

- AdsService
- PurchaseService

## Formati ads supportati

- Banner
- Interstitial
- Rewarded

## Strategie possibili

- AdMob solo
- AdMob con mediazione Unity
- Ibrida: AdMob base + Unity per rewarded/fallback

Selettore runtime/template:

- ADS_PROVIDER=admob
- ADS_PROVIDER=unity_mediation
- ADS_PROVIDER=hybrid
- ADS_PROVIDER=disabled

## Mediazione Unity

Android:

- aggiungi adapter Unity in build.gradle

iOS:

- aggiungi pod GoogleMobileAdsMediationUnity in Podfile

Dashboard:

- crea mediation group su AdMob
- aggiungi Unity Ads come ad source

## Premium handling

- quando utente premium: blocca caricamento ads
- stato premium centralizzato nel PurchaseService
- nessun controllo premium sparso nella UI

## Eventi consigliati

- ad_impression
- ad_click
- interstitial_shown
- rewarded_shown
- rewarded_earned
- purchase_started
- purchase_success
- purchase_cancelled
- purchase_error
