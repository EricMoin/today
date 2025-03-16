import 'package:hive_ce_flutter/adapters.dart';
import 'package:logger/logger.dart';
import 'package:tiny_weather/local/model/info.dart';
import 'package:tiny_weather/local/model/todo.dart';
/// Todo可以组成一个Flow
/// 只有所有的Todo被完成了，才能把当前Flow视为完成
class Flow extends BaseInfo{
  List<Todo> todos;
  Flow({
    required super.uuid,
    required super.firstCreateTime,
    required super.lastModifiedTime,
    super.startAt = 0,
    super.endAt = 0,
    required super.state,
    super.title,
    super.content,
    this.todos = const [],
  });
  /// 根据Todo更新当前Flow的状态
  /// 我们这样解析Flow里Todo的情况：
  /// 1.enabled + initial/enabled => enabled
  /// 2.disabled + X       => disabled
  /// 3.finshed            => finished
  /// 4.failed + X         => failed
  /// 5.disabled + X       => failed
  /// 6.initial            => initial
  void updateState(){
    var now = DateTime.now().millisecondsSinceEpoch;
    /// 还未到开始时间
    if( now < startAt ){
      state = BaseState.intialized();
      return;
    }
    /// 已经过了结束时间
    if( now > endAt ){
      state = BaseState.failed();
      return;
    }
    
    /// 当且仅当所有的Todo完成时才算完成当前Flow
    state = todos.every((e) => e.state.isFinished) ? BaseState.finished() : BaseState.enabled();
    return;
  }
}