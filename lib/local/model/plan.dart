import 'package:hive_ce_flutter/adapters.dart';
import 'package:today/local/model/info.dart';

/// Used for recurring tasks
/// Such as daily reminders at 8:00 AM to study vocabulary
class Plan extends BaseInfo {
  Plan({
    required super.uuid,
    required super.firstCreateTime,
    required super.lastModifiedTime,
    required super.startAt,
    required super.endAt,
    required super.state,
    required this.triggerTime,
    super.title,
    super.content,
  });

  /// Trigger time in milliseconds from midnight (e.g., 8:00 AM = 8 * 60 * 60 * 1000)
  int triggerTime;

  void updateState(){
    if(state.isFinished){
      return;
    }
    var now = DateTime.now().millisecondsSinceEpoch;
    if(now > startAt && now < endAt){
      state = BaseState.enabled();
      return;
    }
    if(now > endAt){
      state = BaseState.finished();
      return;
    }
    if(now < startAt){
      state = BaseState.intialized();
      return;
    }
  }
}