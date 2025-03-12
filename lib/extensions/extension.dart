import 'package:tiny_weather/local/model/flow.dart';
import 'package:tiny_weather/local/model/state.dart';
import 'package:tiny_weather/local/model/todo.dart';

extension FlowStateExtension on Flow{
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
        case 'initial':
          state = FlowState.initial();
          break;
        case 'enabled':
          state = FlowState.enable();
          break;
        case 'disabled':
          state = FlowState.failed();
          return;
        case 'finished':
          ++finished;
          break;
        case 'failed':
          state = FlowState.failed();
          return;
        default:
          break;
      }
    }
    state = finished == length ? FlowState.finished() : state;
    return;
  }
}