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
  void add(Plan plan) {
    // Add notification
    NotificationSolver.schedulePlanNotification(plan);
    
    state = [...state, plan];
    LocalStorage.put(key: BoxKey.plans, data: state);
  }
  void remove(Plan plan) {
    // Cancel notification
    NotificationSolver.cancelPlanNotification(plan.uuid);
    
    state = [
      for (final p in state)
        if (p.uuid != plan.uuid) p,
    ];
    LocalStorage.put(key: BoxKey.plans, data: state);
  }
  void update(Plan plan) {
    // Update notification
    NotificationSolver.cancelPlanNotification(plan.uuid);
    NotificationSolver.schedulePlanNotification(plan);
    
    state = [
      for (final p in state)
        if (p.uuid == plan.uuid) plan else p,
    ];
    LocalStorage.put(key: BoxKey.plans, data: state);
  }
  Plan getPlan(String uuid) {
    return state.firstWhere((e) => e.uuid == uuid);
  }
}

