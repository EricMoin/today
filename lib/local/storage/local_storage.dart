import 'package:hive_ce/hive.dart';
import 'package:today/local/key/local_key.dart';

class LocalStorage {
  LocalStorage._();
  static late Box _box;
  static Future<void> init() async {
    _box = await Hive.openBox('box');
  }
  static Future<void> put({required BoxKey key,required dynamic data}) async {
    await _box.put(key.name, data);
    return;
  }
  static T? get<T>({required BoxKey key}){
    return _box.get(key.name) as T?;
  }
  static Future<void> clear() async {
    await _box.clear();
    return;
  }
  static Future<void> delete({required BoxKey key}) async {
    await _box.delete(key.name);
    return;
  }
}