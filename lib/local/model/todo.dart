import 'package:hive_ce/hive.dart';
import 'package:today/local/model/info.dart';

/// A standard Todo item
/// Primarily used for completing a single task within a specified time frame
class Todo extends BaseInfo {
  Todo({
    required super.uuid,
    required super.firstCreateTime,
    required super.lastModifiedTime,
    required super.startAt,
    required super.endAt,
    required super.state,
    super.title,
    super.content,
  });
  void updateState(){
    var now = DateTime.now();
    var startTime = DateTime.fromMillisecondsSinceEpoch(startAt);
    var endTime = DateTime.fromMillisecondsSinceEpoch(endAt);

    /// Failed - Todo was not completed within the specified time limit
    if( now.isAfter(endTime)  ){
      state = BaseState.failed();
      return;
    }
    /// Todo's time has not yet started
    if( now.isBefore(startTime) ){
      state = BaseState.intialized();
      return;
    }
    if( now.isAfter(startTime) && now.isBefore(endTime) ){
      state = BaseState.enabled();
      return;
    }
    /// Since the [finished] state needs to be manually confirmed
    /// We can simply consider it as being active
    state = BaseState.intialized();
  }
}