import 'package:hive_ce/hive.dart';
import 'package:logger/logger.dart';
import 'package:today/local/model/info.dart';
import 'package:today/local/model/todo.dart';
/// Todos can form a Flow
/// Only when all Todos are completed can the current Flow be considered complete
class Flow extends BaseInfo{
  List<Todo> todos;
  Flow({
    required super.uuid,
    required super.firstCreateTime,
    required super.lastModifiedTime,
    required super.startAt,
    required super.endAt,
    required super.state,
    this.todos = const [],
    super.title,
    super.content,
  });
  /// Update the current Flow's status based on the Todos
  /// We analyze the Todos in the Flow as follows:
  void updateState() {
    var now = DateTime.now();
    var startTime = DateTime.fromMillisecondsSinceEpoch(startAt);
    var endTime = DateTime.fromMillisecondsSinceEpoch(endAt);

    /// Not yet reached the start time
    if (now.isBefore(startTime)) {
      state = BaseState.intialized();
      return;
    }

    /// Already past the end time
    if (now.isAfter(endTime)) {
      state = BaseState.failed();
      return;
    }

    /// Only when all Todos are completed is the Flow considered complete
    bool allFinished = todos.every((element) => element.state.isFinished);
    state = allFinished ? BaseState.finished() : BaseState.enabled();
  }
}