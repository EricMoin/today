import 'package:tiny_weather/local/model/todo.dart';
import 'package:tiny_weather/local/model/flow.dart';
import 'package:tiny_weather/local/model/plan.dart';
import 'package:tiny_weather/local/model/info.dart';
import 'package:uuid/uuid.dart';

// 当前时间戳
final now = DateTime.now().millisecondsSinceEpoch;
final oneDay = 24 * 60 * 60 * 1000;
final uuid = Uuid();

// Todo列表
final todoList = [
  Todo(
    uuid: uuid.v4(),
    firstCreateTime: now,
    lastModifiedTime: now,
    startAt: now,
    endAt: now + oneDay,
    state: BaseState.enabled(),
    title: '完成项目文档',
    content: '编写项目的技术文档和使用说明',
  ),
  Todo(
    uuid: uuid.v4(),
    firstCreateTime: now - oneDay,
    lastModifiedTime: now,
    startAt: now - oneDay,
    endAt: now + oneDay * 2,
    state: BaseState.intialized(),
    title: '准备周会演示',
    content: '准备下周产品演示的PPT和演示文稿',
  ),
  Todo(
    uuid: uuid.v4(),
    firstCreateTime: now - oneDay * 2,
    lastModifiedTime: now,
    startAt: now - oneDay * 2,
    endAt: now - oneDay,
    state: BaseState.finished(),
    title: '修复首页Bug',
    content: '解决用户反馈的首页加载问题',
  ),
  Todo(
    uuid: uuid.v4(),
    firstCreateTime: now,
    lastModifiedTime: now,
    startAt: now,
    endAt: now + oneDay,
    state: BaseState.enabled(),
    title: '更新依赖库',
    content: '将项目依赖更新到最新版本',
  ),
  Todo(
    uuid: uuid.v4(),
    firstCreateTime: now - oneDay,
    lastModifiedTime: now,
    startAt: now - oneDay,
    endAt: now + oneDay * 2,
    state: BaseState.intialized(),
    title: '优化应用性能',
    content: '分析并优化应用启动时间和响应速度',
  ),
  Todo(
    uuid: uuid.v4(),
    firstCreateTime: now - oneDay * 2,
    lastModifiedTime: now,
    startAt: now - oneDay * 2,
    endAt: now - oneDay,
    state: BaseState.failed(),
    title: '实现新功能',
    content: '按照设计稿实现用户请求的新功能',
  ),
];

// Flow列表
final flowList = [
  Flow(
    uuid: uuid.v4(),
    firstCreateTime: now,
    lastModifiedTime: now,
    startAt: now,
    endAt: now + oneDay * 7,
    state: BaseState.enabled(),
    title: '新功能开发流程',
    content: '完成新功能的从设计到上线的完整流程',
    todos: [
      Todo(
        uuid: uuid.v4(),
        firstCreateTime: now,
        lastModifiedTime: now,
        startAt: now,
        endAt: now + oneDay * 2,
        state: BaseState.enabled(),
        title: '需求分析',
        content: '分析用户需求并整理文档',
      ),
      Todo(
        uuid: uuid.v4(),
        firstCreateTime: now,
        lastModifiedTime: now,
        startAt: now + oneDay * 2,
        endAt: now + oneDay * 4,
        state: BaseState.intialized(),
        title: '功能开发',
        content: '完成核心功能的开发工作',
      ),
      Todo(
        uuid: uuid.v4(),
        firstCreateTime: now,
        lastModifiedTime: now,
        startAt: now + oneDay * 4,
        endAt: now + oneDay * 5,
        state: BaseState.intialized(),
        title: '测试验收',
        content: '进行功能测试和验收',
      ),
    ],
  ),
  Flow(
    uuid: uuid.v4(),
    firstCreateTime: now,
    lastModifiedTime: now,
    startAt: now,
    endAt: now + oneDay * 3,
    state: BaseState.enabled(),
    title: '项目发布流程',
    content: '新版本发布的标准流程',
    todos: [
      Todo(
        uuid: uuid.v4(),
        firstCreateTime: now,
        lastModifiedTime: now,
        startAt: now,
        endAt: now + oneDay,
        state: BaseState.finished(),
        title: '代码审查',
        content: '进行代码review和优化',
      ),
      Todo(
        uuid: uuid.v4(),
        firstCreateTime: now,
        lastModifiedTime: now,
        startAt: now + oneDay,
        endAt: now + oneDay * 2,
        state: BaseState.enabled(),
        title: '测试部署',
        content: '在测试环境部署并验证',
      ),
    ],
  ),
];

// Plan列表
final planList = [
  Plan(
    uuid: uuid.v4(),
    firstCreateTime: now,
    lastModifiedTime: now,
    startAt: now,
    endAt: now + oneDay * 30,
    state: BaseState.enabled(),
    title: '晨会',
    content: '每日团队晨会',
    triggerTime: 8 * 60 * 60 * 1000, // 每天8:00
  ),
  Plan(
    uuid: uuid.v4(),
    firstCreateTime: now,
    lastModifiedTime: now,
    startAt: now,
    endAt: now + oneDay * 30,
    state: BaseState.enabled(),
    title: '代码提交',
    content: '每日代码提交和同步',
    triggerTime: 14 * 60 * 60 * 1000, // 每天14:00
  ),
  Plan(
    uuid: uuid.v4(),
    firstCreateTime: now,
    lastModifiedTime: now,
    startAt: now,
    endAt: now + oneDay * 30,
    state: BaseState.enabled(),
    title: '日报填写',
    content: '填写今日工作内容和进度',
    triggerTime: 18 * 60 * 60 * 1000, // 每天18:00
  ),
];