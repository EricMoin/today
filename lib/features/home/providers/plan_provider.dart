import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:today/local/key/local_key.dart';
import 'package:today/local/model/plan.dart';
import 'package:today/local/storage/local_storage.dart';
import 'package:today/utils/notification_solver.dart';
part 'plan_provider.g.dart';
@riverpod
class PlanList extends _$PlanList {
  @override
  List<Plan> build() {
    List<Plan>? plans = (LocalStorage.get<List?>(key: BoxKey.plans))?.cast<Plan>();
    if ( plans == null ){
      LocalStorage.put(key: BoxKey.plans, data: []);
    }
    for (var plan in plans ?? []) {
      plan.updateState();
    }
    return plans ?? [];
  }
  Future<void> add(Plan plan) async {
    final updatedList = [...state];
    updatedList.add(plan);
    state = updatedList;
    LocalStorage.put(key: BoxKey.plans, data: state);
    
    // 添加通知
    await NotificationSolver.schedulePlanNotification(plan);
  }
  Future<void> remove(String uuid) async {
    final updatedList = [...state];
    updatedList.removeWhere((e) => e.uuid == uuid);
    state = updatedList;
    LocalStorage.put(key: BoxKey.plans, data: state);
    
    // 取消通知
    await NotificationSolver.cancelPlanNotification(uuid);
  }
  Future<void> update(Plan plan) async {
    final updatedList = [...state];
    updatedList.firstWhere((e) => e.uuid == plan.uuid).updateState();
    state = updatedList;
    LocalStorage.put(key: BoxKey.plans, data: state);
    
    // 更新通知
    await NotificationSolver.cancelPlanNotification(plan.uuid);
    await NotificationSolver.schedulePlanNotification(plan);
  }
  Plan getPlan(String uuid) {
    return state.firstWhere((e) => e.uuid == uuid);
  }
}

