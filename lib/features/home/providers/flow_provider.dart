import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/web.dart';
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
    updatedList.firstWhere((e) => e.uuid == flowId).updateState();
    Logger().i(updatedList.firstWhere((e) => e.uuid == flowId).state.state);
    state = updatedList;
    save();
  }
  List<Todo> getTodo(String flowId){
    return state.firstWhere((e) => e.uuid == flowId).todos;
  }
  void finishedFlow(String uuid){
    final updatedList = [...state];
    updatedList.firstWhere((e) => e.uuid == uuid).state = BaseState.finished();
    updatedList.firstWhere((e) => e.uuid == uuid).todos.forEach((e) => e.state = BaseState.finished());
    state = updatedList;
    save();
  }
  void removeAll(List<String> flows){
    final updatedList = [...state];
    updatedList.removeWhere((e) => flows.contains(e.uuid));
    state = updatedList;
    save();
  }
  void updateFlowState(int index) {
    final updatedList = [...state];
    updatedList[index].updateState();
    state = updatedList;
    save();
  }
  void add(Flow flow){
    flow.updateState();
    state.add(flow);
    save();
  }
  void save(){
    LocalStorage.put(key: BoxKey.flows,data: state);
  }
  void updateFlow(Flow updatedFlow) {
    final updatedList = [...state];
    final index = updatedList.indexWhere((e) => e.uuid == updatedFlow.uuid);
    if (index != -1) {
      updatedList[index] = updatedFlow;
      state = updatedList;
      save();
    }
  }
  void updateCurrentFlow(String flowId, void Function(Flow flow) updater) {
    final updatedList = [...state];
    final index = updatedList.indexWhere((e) => e.uuid == flowId);
    if (index != -1) {
      final flow = updatedList[index];
      updater(flow);
      state = updatedList;
      save();
    }
  }
}
@riverpod
class CurrentFlow extends _$CurrentFlow {
  @override
  Flow build({
    required String uuid,
  }) {
    Logger().i("[BUILD]: ${ ref.watch(flowListProvider).firstWhere((e) => e.uuid == uuid).state.state}");
    return ref.watch(flowListProvider).firstWhere((e) => e.uuid == uuid);
  }
  void update() {
    ref.read(flowListProvider.notifier).updateCurrentFlow(
      uuid,
      (flow) => flow.updateState(),
    );
  }
  void finishedTodo(String todoId) {
    ref.read(flowListProvider.notifier).updateCurrentFlow(
      uuid,
      (flow) {
        flow.todos.firstWhere((e) => e.uuid == todoId).state = BaseState.finished();
      },
    );
  }
  void finished() {
    ref.read(flowListProvider.notifier).finishedFlow(uuid);
  }
}
@riverpod
bool isCurrentFlowFinished(Ref ref,String uuid) {
  return ref.watch(flowListProvider).firstWhere((e) => e.uuid == uuid).state.isFinished;
}

