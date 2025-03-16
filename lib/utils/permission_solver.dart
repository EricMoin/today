import 'package:permission_handler/permission_handler.dart';

class PermissionSolver{
  static void init() async {
    await Permission.storage.request();
    await Permission.notification.request();
    await Permission.systemAlertWindow.request();
  }
}