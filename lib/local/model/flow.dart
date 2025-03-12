import 'package:hive_ce_flutter/adapters.dart';
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
    required super.startAt,
    required super.endAt,
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
    int length = todos.length;

    /// 当且仅当所有的Todo完成时才算完成当前Flow
    int finished = 0;

    for(var i = 0; i < length; ++i){
      switch(todos[i].state.state){
        case BaseState.initial:
          state = BaseState.intialized();
          break;
        case BaseState.enable:
          state = BaseState.enabled();
          break;
        case BaseState.finish:
          ++finished;
          break;
        case BaseState.fail:
          state = BaseState.failed();
          return;
        default:
          break;
      }
    }
    state = finished == length ? BaseState.finished() : state;
    return;
  }
}