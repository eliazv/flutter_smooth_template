# Setup nuovo progetto

## 1. Clona da template

- Usa Use this template su GitHub
- Oppure clona localmente

## 2. Bootstrap progetto

Comando unico consigliato:

Windows:

- scripts/new_app.ps1 -AppName "Nome App" -BundleId "com.company.nomeapp"

macOS/Linux:

- scripts/new_app.sh "Nome App" "com.company.nomeapp"

Comandi bootstrap diretti:

Windows:

- esegui scripts/bootstrap.ps1 -AppName "Nome App" -BundleId "com.eliazavatta.nomeapp"
- opzionale: -SupportEmail "info+nomeapp@eliazavatta.it"

macOS/Linux:

- esegui scripts/bootstrap.sh "Nome App" "com.eliazavatta.nomeapp"
- opzionale terzo parametro email supporto

## Convenzione support email

- formato consigliato: info+nomeapp@eliazavatta.it
- se non la passi allo script, viene derivata automaticamente dal nome app

## Sostituzione placeholder manuale

Windows:

- scripts/replace_placeholders.ps1 -AppName "Nome App" -BundleId "com.eliazavatta.nomeapp" -SupportEmail "info+nomeapp@eliazavatta.it"

macOS/Linux:

- scripts/replace_placeholders.sh "Nome App" "com.eliazavatta.nomeapp" "info+nomeapp@eliazavatta.it"

## 3. Configurazioni minime

- aggiorna nome app
- aggiorna bundle id Android/iOS
- usa bundle id generico del tuo account reale (esempio: com.company.nomeapp)
- configura icona e splash
- collega Firebase
- imposta ID AdMob
- imposta chiavi RevenueCat

## 4. Sicurezza secrets

- non committare file con chiavi
- usa .env o secret manager CI
- mantieni key.properties fuori versione

## 5. iOS tracking

- configura NSUserTrackingUsageDescription
- configura SKAdNetworkItems
- mostra prompt ATT al momento corretto

## 6. Localizzazioni (i18n)

Lingue disponibili: italiano (default) e inglese.

Dopo clonare, genera stringhe localizzate:

```bash
flutter gen-l10n
```

Questo crea `lib/generated_l10n/app_localizations.dart` e i file di supporto.

Per aggiungere nuove stringhe:
- Modifica `lib/l10n/app_it.arb` (italiano)
- Modifica `lib/l10n/app_en.arb` (inglese)
- Riesegui `flutter gen-l10n`
- Usa `AppLocalizations.of(context)!.chiaveStringa` nei widget

## 7. Web support

Template include supporto web. Per buildare:

```bash
# Development
flutter run -d chrome

# Production web build
scripts/build_web.sh   # macOS/Linux
scripts/build_web.ps1  # Windows
```

**Nota:** Alcuni package non supportano web (google_mobile_ads, app_tracking_transparency). Vengono disabilitati automaticamente nel web build via feature flags.

## 8. Verifica

- flutter pub get
- flutter gen-l10n
- flutter analyze
- flutter test
