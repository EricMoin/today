import 'package:today/local/model/todo.dart';
import 'package:today/local/model/flow.dart';
import 'package:today/local/model/plan.dart';
import 'package:today/local/model/info.dart';
import 'package:uuid/uuid.dart';

// Current timestamp
final now = DateTime.now().millisecondsSinceEpoch;
final oneDay = 24 * 60 * 60 * 1000;
final uuid = Uuid();

// Todo list
final todoList = [
  Todo(
    uuid: uuid.v4(),
    firstCreateTime: now,
    lastModifiedTime: now,
    startAt: now,
    endAt: now + oneDay,
    state: BaseState.enabled(),
    title: 'Read Chapter 3',
    content: 'Complete reading Chapter 3 of Flutter Development',
  ),
  Todo(
    uuid: uuid.v4(),
    firstCreateTime: now - oneDay,
    lastModifiedTime: now,
    startAt: now - oneDay,
    endAt: now + oneDay * 2,
    state: BaseState.intialized(),
    title: 'Prepare for Weekly Meeting',
    content: 'Prepare PPT and presentation for next week\'s product demo',
  ),
  Todo(
    uuid: uuid.v4(),
    firstCreateTime: now - oneDay * 2,
    lastModifiedTime: now,
    startAt: now - oneDay * 2,
    endAt: now - oneDay,
    state: BaseState.finished(),
    title: 'Fix Homepage Bug',
    content: 'Resolve the loading issue of the homepage',
  ),
  Todo(
    uuid: uuid.v4(),
    firstCreateTime: now,
    lastModifiedTime: now,
    startAt: now,
    endAt: now + oneDay,
    state: BaseState.enabled(),
    title: 'Update Dependency Library',
    content: 'Update project dependencies to the latest version',
  ),
  Todo(
    uuid: uuid.v4(),
    firstCreateTime: now - oneDay,
    lastModifiedTime: now,
    startAt: now - oneDay,
    endAt: now + oneDay * 2,
    state: BaseState.intialized(),
    title: 'Optimize Application Performance',
    content: 'Analyze and optimize application startup time and response speed',
  ),
  Todo(
    uuid: uuid.v4(),
    firstCreateTime: now - oneDay * 2,
    lastModifiedTime: now,
    startAt: now - oneDay * 2,
    endAt: now - oneDay,
    state: BaseState.failed(),
    title: 'Implement New Feature',
    content: 'Implement the new feature based on the design draft',
  ),
];

// Flow list
final flowList = [
  Flow(
    uuid: uuid.v4(),
    firstCreateTime: now,
    lastModifiedTime: now,
    startAt: now,
    endAt: now + oneDay * 7,
    state: BaseState.enabled(),
    title: 'New Feature Development Process',
    content: 'Complete the entire process from design to deployment',
    todos: [todoList[0], todoList[1]],
  ),
  Flow(
    uuid: uuid.v4(),
    firstCreateTime: now,
    lastModifiedTime: now,
    startAt: now,
    endAt: now + oneDay * 3,
    state: BaseState.enabled(),
    title: 'Project Release Process',
    content: 'Standard process for new version release',
    todos: [todoList[2], todoList[3]],
  ),
];

// Plan list
final planList = [
  Plan(
    uuid: uuid.v4(),
    firstCreateTime: now,
    lastModifiedTime: now,
    startAt: now,
    endAt: now + oneDay * 30,
    state: BaseState.enabled(),
    title: 'Morning Study',
    content: 'Study programming every morning',
    triggerTime: 8 * 60 * 60 * 1000, // Daily at 8:00
  ),
  Plan(
    uuid: uuid.v4(),
    firstCreateTime: now,
    lastModifiedTime: now,
    startAt: now,
    endAt: now + oneDay * 30,
    state: BaseState.enabled(),
    title: 'Afternoon Review',
    content: 'Review what you learned in the morning',
    triggerTime: 14 * 60 * 60 * 1000, // Daily at 14:00
  ),
  Plan(
    uuid: uuid.v4(),
    firstCreateTime: now,
    lastModifiedTime: now,
    startAt: now,
    endAt: now + oneDay * 30,
    state: BaseState.enabled(),
    title: 'Evening Practice',
    content: 'Practice coding in the evening',
    triggerTime: 18 * 60 * 60 * 1000, // Daily at 18:00
  ),
];