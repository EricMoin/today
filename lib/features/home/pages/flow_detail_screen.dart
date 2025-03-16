import 'package:flutter/material.dart' hide Flow;
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:tiny_weather/constant/theme.dart';
import 'package:tiny_weather/extensions/extension.dart';
import 'package:tiny_weather/features/home/components/task_progress_indicator.dart';
import 'package:tiny_weather/features/home/providers/flow_provider.dart';
import 'package:tiny_weather/local/model/flow.dart';
import 'package:tiny_weather/local/model/info.dart';

class FlowDetailScreen extends ConsumerStatefulWidget {
  String uuid;
  FlowDetailScreen({super.key, required this.uuid});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _FlowDetailScreenState();
}

class _FlowDetailScreenState extends ConsumerState<FlowDetailScreen> {
  late ThemeData theme;
  @override
  Widget build(BuildContext context) {
    theme = Theme.of(context);
    // 分别监听需要的状态
    final isFinished = ref.watch(
      isCurrentFlowFinishedProvider(widget.uuid)
    );
    final flow = ref.watch(currentFlowProvider(uuid: widget.uuid));

    return Scaffold(
      appBar: AppBar(
        actions: [
          if (!isFinished)
            IconButton(
              icon: Icon(Icons.check),
              onPressed: () {
                ref.read(currentFlowProvider(uuid: widget.uuid).notifier).finished();
              },
            ),
        ],
      ),
      body: Center(
        child: LayoutBuilder(
          builder: (context, constraints) {
            var width = constraints.maxWidth;
            return Container(
              width: width * 0.9,
              child: CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  SliverToBoxAdapter(
                    child: _FlowInfoCard(
                      flow: flow,
                      state: flow.state,  // 传递状态
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class _FlowInfoCard extends StatelessWidget {  // 不需要是 ConsumerWidget
  final Flow flow;
  final BaseState state;
  late ThemeData theme;

  _FlowInfoCard({
    required this.flow,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    theme = Theme.of(context);
    final todos = flow.todos;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10,
        children: [
          Center(
            child: TodoProgressIndicator(
              startAt: flow.startAt,
              endAt: flow.endAt,
              progress:
                  (flow.endAt == flow.startAt)
                      ? 0
                      : (DateTime.now().millisecondsSinceEpoch - flow.startAt) /
                          (flow.endAt - flow.startAt),
              state: state,  // 使用传入的 state
            ),
          ),
          Text(
            '🎯  Target',
            style: theme.textTheme.titleMedium?.copyWith(
              color: theme.colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(flow.title, style: theme.textTheme.bodyLarge?.copyWith()),
          const SizedBox.shrink(),
          Text(
            '✍️  Job',
            style: theme.textTheme.titleMedium?.copyWith(
              color: theme.colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            spacing: 10,
            children:
                todos.map((e) {
                  // 使用 Consumer 来为每个 Todo 单独监听状态
                  return Consumer(
                    builder: (context, ref, child) {
                      // 使用 select 只监听特定 Todo 的完成状态
                      final isFinished = ref.watch(
                        flowListProvider.select(
                          (flows) =>
                              flows
                                  .firstWhere((f) => f.uuid == flow.uuid)
                                  .todos
                                  .firstWhere((t) => t.uuid == e.uuid)
                                  .state
                                  .isFinished,
                        ),
                      );

                      return AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: isFinished ? ZExtraTheme.finishedColor : null,
                        ),
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                if (isFinished) {
                                  ref
                                      .read(flowListProvider.notifier)
                                      .updateTodoState(flow.uuid, e.uuid);
                                } else {
                                  ref
                                      .read(flowListProvider.notifier)
                                      .finishedTodo(flow.uuid, e.uuid);
                                }
                              },
                              icon: Icon(
                                isFinished ? Icons.check : Icons.adjust_rounded,
                                color: isFinished ? Colors.white : null,
                              ),
                            ),
                            Expanded(child: Text(
                              e.title,
                              style: theme.textTheme.bodyLarge?.copyWith(
                                color: isFinished ? Colors.white : null,
                              ),
                            ),),
                          ],
                        ),
                      );
                    },
                  );
                }).toList(),
          ),
          Text(
            '🕒  Period',
            style: theme.textTheme.titleMedium?.copyWith(
              color: theme.colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
          LinearProgressIndicator(
            value:
                state.isFinished
                    ? 1
                    : flow.endAt == flow.startAt
                    ? 0
                    : (DateTime.now().millisecondsSinceEpoch - flow.startAt) /
                        (flow.endAt - flow.startAt),
          ),
          Row(
            children: [
              Text(
                flow.startAt.dateTime,
                style: theme.textTheme.titleSmall?.copyWith(
                  color: theme.colorScheme.primary,
                ),
              ),
              Expanded(child: const SizedBox()),
              Text(
                flow.endAt.dateTime,
                style: theme.textTheme.titleSmall?.copyWith(
                  color: theme.colorScheme.primary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
