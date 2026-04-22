abstract class StorageService {
  Future<void> init();
  Future<void> setString(String key, String value);
  Future<void> setBool(String key, bool value);
  String? getString(String key);
  bool? getBool(String key);
  Future<void> remove(String key);
}
