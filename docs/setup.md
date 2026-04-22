# Setup nuovo progetto

## 1. Clona da template

- Usa Use this template su GitHub
- Oppure clona localmente

## 2. Bootstrap progetto

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

## 6. Verifica

- flutter pub get
- flutter analyze
- flutter test
