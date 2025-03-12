import 'package:hive_ce/hive.dart';
/// 正常的一个Todo
/// 主要用于在限定时间内完成某件单一的任务
class Todo extends HiveObject {
  int firstCreateTime;
  int lastModifiedTime;
  int startAt;
  int endAt;
  String title;
  String content;
  TodoState state;
  Todo({
    required this.firstCreateTime,
    required this.lastModifiedTime,
    required this.startAt,
    required this.endAt,
    required this.state,
    this.title = '',
    this.content = '',
  });
}
class TodoState extends HiveObject{
  final String state;
  TodoState({required this.state});
  /// Todo 刚创建
  TodoState.initial({this.state = 'initial'});
  /// Todo 生效，即在开始时间和结束时间内
  TodoState.enable({this.state = 'enabled'});
  /// Todo 生效时间已过
  TodoState.disabled({this.state = 'disabled'});
  /// Todo 完成
  TodoState.finished({this.state = 'finished'});
  /// Todo 未完成
  TodoState.failed({this.state = 'failed'});

  bool get isInitial => state == 'initial';
  bool get isEnabled => state == 'enabled';
  bool get isDisabled => state == 'disabled';
  bool get isFinished => state == 'finished';
  bool get isFailed => state == 'failed';
}