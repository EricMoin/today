import 'package:hive_ce/hive.dart';

class LocalStorage {
  LocalStorage._();
  late Box _box;
  static Future<void> init() async {
    _box = Hive.box('hive_box');

  } 
}