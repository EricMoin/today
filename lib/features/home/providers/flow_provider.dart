import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tiny_weather/local/key/local_key.dart';
import 'package:tiny_weather/local/model/flow.dart';
import 'package:tiny_weather/local/model/info.dart';
import 'package:tiny_weather/local/storage/local_storage.dart';
part 'flow_provider.g.dart';
@riverpod
class FlowList extends _$FlowList {
  @override
  List<Flow> build() {
    List<Flow>? flows = LocalStorage.get<List<Flow>?>(key: BoxKey.flows)?.cast();
    if ( flows == null ){
      LocalStorage.put(key: BoxKey.flows, data: []);
    }
    return flows ?? [];
  }
  
  void finishedTodo(String flowId,int index) {
    final updatedList = [...state];
    var target = state.firstWhere((e) => e.uuid == flowId);
    target.todos[index].state = BaseState.finished();
    state = updatedList;
  }
  
  void update(int index) {
    final updatedList = [...state];
    updatedList[index].updateState();
    state = updatedList;
  }
  Flow getFlow(String uuid){
    return state.firstWhere((e) => e.uuid == uuid);
  }
  void save(){
    LocalStorage.put(key: BoxKey.flows,data: state);
  }
}