import 'package:hive_ce_flutter/adapters.dart';
import 'package:tiny_weather/local/model/todo.dart';

/// Todo可以组成一个Flow
/// 只有所有的Todo被完成了，才能把当前Flow视为完成
class Flow extends HiveObject{
  String title;
  String content;
  List<Todo> todos;
  FlowState state;
  Flow({
    this.title = '',
    this.content = '',
    this.todos = const [],
    required this.state,
  });
}
 
class FlowState extends HiveObject{
  final String state;
  FlowState({required this.state});
  /// Flow 刚创建
  FlowState.initial({this.state = 'initial'});
  /// Flow 生效，有Todo在时间范围内
  FlowState.enable({this.state = 'enabled'});
  /// Flow 所有的Todo生效时间已过
  FlowState.disabled({this.state = 'disabled'});
  /// Flow 所有的Todo完成
  FlowState.finished({this.state = 'finished'});
  /// Flow 未完成
  FlowState.failed({this.state = 'failed'});
}