import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tiny_weather/local/key/local_key.dart';
import 'package:tiny_weather/local/model/flow.dart';
import 'package:tiny_weather/local/model/info.dart';
import 'package:tiny_weather/local/model/todo.dart';
import 'package:tiny_weather/local/storage/local_storage.dart';
part 'flow_provider.g.dart';
@riverpod
class FlowList extends _$FlowList {
  @override
  List<Flow> build() {
    List<Flow>? flows = (LocalStorage.get<List?>(key: BoxKey.flows))?.cast<Flow>();
    if ( flows == null ){
      LocalStorage.put(key: BoxKey.flows, data: []);
    }
    return flows ?? [];
  }
  void updateTodoState(String flowId,String todoId){
    final updatedList = [...state];
    updatedList.firstWhere((e) => e.uuid == flowId).todos.firstWhere((e) => e.uuid == todoId).updateState();
    updatedList.firstWhere((e) => e.uuid == flowId).updateState();
    state = updatedList;
    
    save();
  }
  void finishedTodo(String flowId,String todoId) {
    final updatedList = [...state];
    updatedList.firstWhere((e) => e.uuid == flowId).todos.firstWhere((e) => e.uuid == todoId).state = BaseState.finished();
    state = updatedList;
    save();
  }
  List<Todo> getTodo(String flowId){
    return state.firstWhere((e) => e.uuid == flowId).todos;
  }
  void finishedFlow(String uuid){
    final updatedList = [...state];
    updatedList.firstWhere((e) => e.uuid == uuid).state = BaseState.finished();
    state = updatedList;
    save();
  }
  void removeAll(List<String> flows){
    final updatedList = [...state];
    updatedList.removeWhere((e) => flows.contains(e.uuid));
    state = updatedList;
    save();
  }
  void update(int index) {
    final updatedList = [...state];
    updatedList[index].updateState();
    state = updatedList;
    save();
  }
  Flow getFlow(String uuid){
    return state.firstWhere((e) => e.uuid == uuid);
  }
  void add(Flow flow){
    flow.updateState();
    state.add(flow);
    save();
  }
  void updateFlowState(int index){
    state[index].updateState();
    save();
  }
  void save(){
    LocalStorage.put(key: BoxKey.flows,data: state);
  }
}