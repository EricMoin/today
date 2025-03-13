import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tiny_weather/local/key/local_key.dart';
import 'package:tiny_weather/local/model/info.dart';
import 'package:tiny_weather/local/storage/local_storage.dart';
import 'package:tiny_weather/mock/mock.dart';
import 'package:tiny_weather/local/model/todo.dart';
part 'todo_provider.g.dart';


@riverpod
class TodoList extends _$TodoList {
  @override
  List<Todo> build() {
    List<Todo>? todos = (LocalStorage.get<List?>(key: BoxKey.todos))?.cast<Todo>();
    if ( todos == null ){
      LocalStorage.put(key: BoxKey.todos, data: <Todo>[]);
    }
    return todos ?? <Todo>[];
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
  Todo getTodo(String uuid){
    return state.firstWhere((e) => e.uuid == uuid);
  }
  void add(Todo todo){
    final updatedList = <Todo>[...state];
    todo.updateState();
    updatedList.add(todo);
    state = updatedList;
    save();
  }
  void save(){
    LocalStorage.put(key: BoxKey.todos,data: state);
  }
}