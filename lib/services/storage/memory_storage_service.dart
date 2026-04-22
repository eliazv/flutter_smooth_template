import 'package:flutter_smooth_template/services/storage/storage_service.dart';

class MemoryStorageService implements StorageService {
  final Map<String, Object> _memory = <String, Object>{};

  @override
  Future<void> init() async {}

  @override
  String? getString(String key) => _memory[key] as String?;

  @override
  bool? getBool(String key) => _memory[key] as bool?;

  @override
  Future<void> remove(String key) async {
    _memory.remove(key);
  }

  @override
  Future<void> setBool(String key, bool value) async {
    _memory[key] = value;
  }

  @override
  Future<void> setString(String key, String value) async {
    _memory[key] = value;
  }
}
