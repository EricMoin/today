import 'package:hive_ce/hive.dart';

class BaseInfo extends HiveObject{
  String uuid;
  int firstCreateTime;
  int lastModifiedTime;
  int startAt;
  int endAt;
  String title;
  String content;
  BaseState state;
  BaseInfo({
    required this.uuid,
    required this.firstCreateTime,
    required this.lastModifiedTime,
    required this.startAt,
    required this.endAt,
    required this.state,
    this.title = '',
    this.content = '',
  });
}

class BaseState extends HiveObject{
  final String state;
  BaseState({required this.state});


  static const initial = 'initial';
  static const enable = 'enable';
  static const fail = 'fail';
  static const finish = 'finish';

  factory BaseState.intialized() => BaseState(state: initial);
  factory BaseState.enabled() => BaseState(state: enable);
  factory BaseState.failed() => BaseState(state: fail);
  factory BaseState.finished() => BaseState(state: finish);


  bool get isInitial => state == initial;
  bool get isEnabled => state == enable;
  bool get isFinished => state == finish;
  bool get isFailed => state == fail;
}