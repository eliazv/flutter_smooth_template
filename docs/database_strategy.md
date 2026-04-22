# Strategia database

## Obiettivo

Rendere la scelta DB rinviabile dopo il clone senza cambiare il codice UI.

## Contratto unico

Usa StorageService come interfaccia unica verso persistenza locale.

## Implementazioni consigliate

- MemoryStorageService: default del template
- SharedPreferencesStorageService: impostazioni leggere
- HiveStorageService: cache/offline semplice
- IsarStorageService: performance locale elevata
- DriftStorageService: relazioni SQL complesse

## Decision matrix

- Shared Preferences: setup minimo, key-value
- Hive: app leggere e giochi offline
- Isar: dataset locale medio-grande
- Drift: query relazionali avanzate

## Regola

Controller e provider non usano mai direttamente il DB concreto. Usano solo StorageService.
