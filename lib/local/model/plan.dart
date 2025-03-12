import 'package:hive_ce_flutter/adapters.dart';

/// 用于周期性进行的任务
/// 如每天的8:00提醒开始背单词
class Plan extends HiveObject {
  int firstCreateTime;
  int lastModifiedTime;
  int startAt;
  int endAt;
  String title;
  String content;
  PlanState state;
  Plan({
    required this.firstCreateTime,
    required this.lastModifiedTime,
    required this.startAt,
    required this.endAt,
    this.title = '',
    this.content = '',
    required this.state,
  });
}
class PlanState {
  final String state;
  PlanState({required this.state});
  /// Plan 刚开始创建
  PlanState.initial({this.state = 'initial'});
  /// Plan 开始工作
  PlanState.enabled({this.state = ''});
  /// Plan 到达结束时间,不再进行
  PlanState.finished({this.state = ''});
}