import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:hive_ce/hive.dart';
import 'package:tiny_weather/local/adapter/hive_registrar.g.dart';

class InitApp{
  InitApp._();
  static Future<void> init () async {
    WidgetsFlutterBinding.ensureInitialized();
    Hive..init(Directory.current.path)..registerAdapters();
  }
}