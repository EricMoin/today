import 'package:flutter/material.dart' hide Flow;
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiny_weather/constant/theme.dart';
import 'package:tiny_weather/extensions/extension.dart';
import 'package:tiny_weather/features/home/components/task_progress_indicator.dart';
import 'package:tiny_weather/features/home/providers/flow_provider.dart';

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
    var flow = ref.watch(flowListProvider.notifier).getFlow(widget.uuid);
    var finishedCount = flow.todos.where((e) => e.state.isFinished).length;
    return Scaffold(
      appBar: AppBar(
        actions: [
          if (flow.state.isEnabled)
            IconButton(
              icon: Icon(Icons.check),
              onPressed: () {
                ref.read(flowListProvider.notifier).finishedFlow(widget.uuid);
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
                    child: _FlowInfoCard(flowId: widget.uuid)
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class _FlowInfoCard extends ConsumerWidget {
  final String flowId;
  late ThemeData theme;
  
  _FlowInfoCard({required this.flowId});
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    theme = Theme.of(context);
    // 监听整个 flowListProvider 的状态
    final flows = ref.watch(flowListProvider);
    // 找到特定的 flow
    final flow = flows.firstWhere((f) => f.uuid == flowId);
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
              state: flow.state,
            ),
          ),
          Text(
            '🎯  Target',
            style: theme.textTheme.titleMedium?.copyWith(
              color: theme.colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(flow.title, style: theme.textTheme.bodyMedium?.copyWith()),
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
            children: todos.map((e) {
              // 使用 Consumer 来为每个 Todo 单独监听状态
              return Consumer(
                builder: (context, ref, child) {
                  // 使用 select 只监听特定 Todo 的完成状态
                  final isFinished = ref.watch(
                    flowListProvider.select((flows) => 
                      flows.firstWhere((f) => f.uuid == flowId)
                          .todos.firstWhere((t) => t.uuid == e.uuid)
                          .state.isFinished
                    )
                  );
                  
                  return ListTile(
                    contentPadding: EdgeInsets.all(0),
                    tileColor: isFinished ? ZExtraTheme.finishedColor : null,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    leading: IconButton(
                      onPressed: () {
                        if (isFinished) {
                          ref.read(flowListProvider.notifier).updateTodoState(flow.uuid, e.uuid);
                        } else {
                          ref.read(flowListProvider.notifier).finishedTodo(flow.uuid, e.uuid);
                        }
                      }, 
                      icon: Icon(
                        isFinished ? Icons.check : Icons.adjust_rounded,
                        color: isFinished ?Colors.white : null,
                      )
                    ),
                    title: Text(e.title, style: theme.textTheme.titleMedium?.copyWith(
                      color: isFinished ? Colors.white : null,
                    )),
                  );
                }
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
          LinearProgressIndicator(value: -2),
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
