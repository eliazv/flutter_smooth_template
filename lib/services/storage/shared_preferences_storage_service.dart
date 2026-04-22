import 'package:flutter_smooth_template/services/storage/storage_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesStorageService implements StorageService {
  SharedPreferencesStorageService();

  SharedPreferences? _prefs;

  @override
  Future<void> init() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  @override
  String? getString(String key) => _prefs?.getString(key);

  @override
  bool? getBool(String key) => _prefs?.getBool(key);

  @override
  Future<void> remove(String key) async {
    await _prefs?.remove(key);
  }

  @override
  Future<void> setBool(String key, bool value) async {
    await _prefs?.setBool(key, value);
  }

  @override
  Future<void> setString(String key, String value) async {
    await _prefs?.setString(key, value);
  }
}
