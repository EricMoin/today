import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tiny_weather/local/model/info.dart';
import 'package:tiny_weather/mock/mock.dart';
import 'package:tiny_weather/local/model/todo.dart';
part 'home_provider.g.dart';


@riverpod
class TodoList extends _$TodoList {
  @override
  List<Todo> build() {
    return todoList;
  }
  
  void finishedTodo(int index) {
    final updatedList = [...state];
    updatedList[index].state = BaseState.finished();
    state = updatedList;
  }
  
  void updateTodoState(int index) {
    final updatedList = [...state];
    updatedList[index].updateState();
    state = updatedList;
  }
}