import 'package:hive_ce/hive.dart';
import 'package:tiny_weather/local/model/info.dart';

/// 正常的一个Todo
/// 主要用于在限定时间内完成某件单一的任务
class Todo extends BaseInfo {
  Todo({
    required super.uuid,
    required super.firstCreateTime,
    required super.lastModifiedTime,
    required super.startAt,
    required super.endAt,
    required super.state,
    super.title,
    super.content,
  });
  void updateState(){
    var now = DateTime.now();
    var startTime = DateTime.fromMillisecondsSinceEpoch(startAt);
    var endTime = DateTime.fromMillisecondsSinceEpoch(endAt);

    /// 失效 限定时间没有完成Todo
    if( now.isAfter(endTime)  ){
      state = BaseState.failed();
      return;
    }
    /// Todo 的时间还没开始
    if( now.isBefore(startTime) ){
      state = BaseState.intialized();
    }
    /// 由于[finished]的状态需要手动确定
    /// 所以这里直接就可以看作生效中
    state = BaseState.enabled();
  }
}