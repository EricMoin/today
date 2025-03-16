import 'package:flutter/widgets.dart';
import 'package:hive_ce/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:today/local/adapter/hive_registrar.g.dart';
import 'package:today/local/storage/local_storage.dart';
import 'package:today/utils/notification_solver.dart';

class InitApp{
  static late String temporaryPath;
  InitApp._();
  static Future<void> init () async {
    WidgetsFlutterBinding.ensureInitialized();
    temporaryPath =(await getTemporaryDirectory()).path;
    Hive..init(temporaryPath)..registerAdapters();
    await LocalStorage.init();
    await NotificationSolver.init();
  }
}