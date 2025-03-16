import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:logger/logger.dart';
import 'package:today/local/model/plan.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;
@pragma('vm:entry-point')
void notificationTapBackground(NotificationResponse notificationResponse) {
  Logger().i('[NOTIFICATION]: ${notificationResponse.id} ${notificationResponse.actionId} ${notificationResponse.notificationResponseType.name} ${notificationResponse.payload}');
  switch( notificationResponse.payload ){
    case NotificationPayload.message:
    break;
  }
}
@pragma('vm:entry-point')
void notificationTap(NotificationResponse notificationResponse) {
  Logger().i('[NOTIFICATION BACKGROUND]: ${notificationResponse.id} ${notificationResponse.actionId} ${notificationResponse.notificationResponseType.name} ${notificationResponse.payload}');
  switch( notificationResponse.payload ){
    case NotificationPayload.message:
      break;
  }
}
class NotificationPayload{
  static const message = 'message';
}
class NotificationAction{
  String id;
  String actionId;
  NotificationAction({
    required this.id,
    required this.actionId,
  });
  static const androidTodoAction = AndroidNotificationAction(
    'Todo',
    'Todo',
  );
  static const androidFlowAction = AndroidNotificationAction('flow', 'Flow');
  static const androidPlanAction = AndroidNotificationAction('plan', 'Plan');
}
class NotificationChannel{
  static final todoChannel = NotificationChannel(id: 0, name: 'Todo');
  static final flowChannel = NotificationChannel(id: 1, name: 'Flow');
  static final planChannel = NotificationChannel(id: 2, name: 'Plan');
  int id;
  String name;
  String? description;
  NotificationChannel({
    required this.id,
    required this.name,
    this.description,
  });
}
class NotificationStyle{

}
class NotificationSolver{
  NotificationSolver._();
  static late FlutterLocalNotificationsPlugin _client;
  static const _androidIcon = '@mipmap/ic_launcher';
  static const _androidInitSettings =  AndroidInitializationSettings(_androidIcon,);
  static const _darwinInitSettings =  DarwinInitializationSettings(
    requestAlertPermission: true,
    requestBadgePermission: true,
    requestSoundPermission: true,
  );
  static const String darwinNotificationCategoryPlain = 'plainCategory';


  static Future<void> init() async{
    // 初始化时区数据
    tz.initializeTimeZones();
    
    _client = FlutterLocalNotificationsPlugin();
    await _client.initialize(
      const InitializationSettings(android: _androidInitSettings, iOS: _darwinInitSettings,),
      onDidReceiveNotificationResponse: notificationTap,
      onDidReceiveBackgroundNotificationResponse: notificationTapBackground,
    );
  }

   static Future<void> showMessage({
    required String title,
    required String content,
    String channelDescription = 'Todo',
    NotificationChannel? channel,
    Priority priority = Priority.high,
    Importance importance = Importance.high,
  }) async {
     channel ??= NotificationChannel.todoChannel;
     var androidDetails = AndroidNotificationDetails(
       channel.id.toString(),
       channel.name.toString(),
       channelDescription: channelDescription,
       priority: priority,
       importance: importance,
     );
     var darwinDetails = DarwinNotificationDetails(
       categoryIdentifier: darwinNotificationCategoryPlain,
     );
     _client.show(
       channel.id,
       title,
       content,
       NotificationDetails(android: androidDetails,iOS: darwinDetails),
       payload: 'message',
     );
   }

  // 添加计划任务的通知方法
  static Future<void> schedulePlanNotification(Plan plan) async {
    final androidDetails = AndroidNotificationDetails(
      NotificationChannel.planChannel.id.toString(),
      NotificationChannel.planChannel.name,
      channelDescription: 'Plan Reminder',
      priority: Priority.high,
      importance: Importance.high,
    );

    final darwinDetails = DarwinNotificationDetails(
      categoryIdentifier: darwinNotificationCategoryPlain,
    );

    // 检查计划是否在有效期内
    final now = DateTime.now().millisecondsSinceEpoch;
    if (now < plan.startAt || now > plan.endAt) {
      Logger().i('Plan ${plan.title} is not active yet or has expired');
      return;
    }

    // 转换为 TZDateTime
    final scheduledDate = DateTime.fromMillisecondsSinceEpoch(plan.triggerTime);
    final zonedScheduleTime = tz.TZDateTime.from(scheduledDate, tz.local);

    // 如果触发时间已经过去，计算下一个触发时间
    var nextTriggerTime = zonedScheduleTime;
    if (nextTriggerTime.isBefore(tz.TZDateTime.now(tz.local))) {
      // 计算今天的这个时间
      nextTriggerTime = tz.TZDateTime(
        tz.local,
        tz.TZDateTime.now(tz.local).year,
        tz.TZDateTime.now(tz.local).month,
        tz.TZDateTime.now(tz.local).day,
        zonedScheduleTime.hour,
        zonedScheduleTime.minute,
        zonedScheduleTime.second,
      );
      
      // 如果今天的时间已过，设置为明天
      if (nextTriggerTime.isBefore(tz.TZDateTime.now(tz.local))) {
        nextTriggerTime = nextTriggerTime.add(const Duration(days: 1));
      }

      // 检查下一次触发时间是否超出计划结束时间
      if (nextTriggerTime.millisecondsSinceEpoch > plan.endAt) {
        Logger().i('Next trigger time would be after plan end time, skipping notification');
        return;
      }
    }

    await _client.zonedSchedule(
      plan.uuid.hashCode,
      plan.title,
      plan.content,
      nextTriggerTime,
      NotificationDetails(
        android: androidDetails,
        iOS: darwinDetails,
      ),
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,  // 使用精确的定时模式
      matchDateTimeComponents: DateTimeComponents.time,  // 每天同一时间重复
      payload: NotificationPayload.message,
    );
    
    Logger().i('Scheduled notification for ${plan.title} at $nextTriggerTime (valid until ${DateTime.fromMillisecondsSinceEpoch(plan.endAt)})');
  }

  // 取消特定计划的通知
  static Future<void> cancelPlanNotification(String planUuid) async {
    await _client.cancel(planUuid.hashCode);
  }

  // 添加测试方法
  static Future<void> testNotification() async {
    final now = tz.TZDateTime.now(tz.local).add(const Duration(seconds: 1));
    
    final androidDetails = AndroidNotificationDetails(
      NotificationChannel.planChannel.id.toString(),
      NotificationChannel.planChannel.name,
      channelDescription: 'Test Notification',
      priority: Priority.high,
      importance: Importance.high,
    );

    final darwinDetails = DarwinNotificationDetails(
      categoryIdentifier: darwinNotificationCategoryPlain,
    );

    await _client.zonedSchedule(
      -1,  // 使用特殊的ID避免与其他通知冲突
      '测试通知',
      '这是一个测试通知，将在设置后1秒显示',
      now,
      NotificationDetails(android: androidDetails, iOS: darwinDetails),
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      payload: NotificationPayload.message,
    );
    
    Logger().i('Test notification scheduled for $now');
  }
}