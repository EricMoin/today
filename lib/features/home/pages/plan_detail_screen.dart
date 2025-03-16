import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiny_weather/extensions/extension.dart';
import 'package:tiny_weather/features/home/components/task_progress_indicator.dart';
import 'package:tiny_weather/features/home/providers/plan_provider.dart';
import 'package:tiny_weather/features/home/providers/todo_provider.dart';
import 'package:tiny_weather/local/model/info.dart';
import 'package:tiny_weather/local/model/plan.dart';
import 'package:tiny_weather/local/model/todo.dart';
import 'package:intl/intl.dart';

class PlanDetailScreen extends ConsumerStatefulWidget {
  String uuid;
  PlanDetailScreen({super.key, required this.uuid});
  
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PlanDetailScreenState();
}
class _PlanDetailScreenState extends ConsumerState<PlanDetailScreen>{
  late ThemeData theme;
  @override
  Widget build(BuildContext context) {
    theme = Theme.of(context);
    var plan = ref.watch(planListProvider.notifier).getPlan(widget.uuid);
    return Scaffold(
      appBar: AppBar(
      ),
      body: Center(
        child: LayoutBuilder(
          builder: (context, constraints) {
            var width = constraints.maxWidth;
            return Container(
              width: width * 0.9,
              child: CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [SliverToBoxAdapter(child: _PlanInfoCard(plan: plan))],
              ),
            );
          },
        ),
      ),
    );
  }
}

class _PlanInfoCard extends StatelessWidget {
  Plan plan;
  late ThemeData theme;
  _PlanInfoCard({required this.plan});
  @override
  Widget build(BuildContext context) {
    theme = Theme.of(context);
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
              startAt: plan.startAt,
              endAt: plan.endAt,
              progress: (plan.endAt == plan.startAt) ? 0 : (DateTime.now().millisecondsSinceEpoch - plan.startAt) / (plan.endAt - plan.startAt),
              state: plan.state,
            ),
          ),
          Text(
            '🎯  Target',
            style: theme.textTheme.titleMedium?.copyWith(
              color: theme.colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(plan.title, style: theme.textTheme.bodyMedium?.copyWith()),
          const SizedBox.shrink(),
          Text(
            '✍️  Job',
            style: theme.textTheme.titleMedium?.copyWith(
              color: theme.colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(plan.content, style: theme.textTheme.bodyMedium?.copyWith()),
          const SizedBox.shrink(),
          Text(
            '🕒  Period',
            style: theme.textTheme.titleMedium?.copyWith(
              color: theme.colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Trigger Time',
                style: theme.textTheme.titleSmall,
              ),
              Text(
                DateFormat.jms().format(DateTime.fromMillisecondsSinceEpoch(plan.triggerTime)),
                style: theme.textTheme.titleSmall?.copyWith(
                  color: theme.colorScheme.primary
                ),
              ),
            ],
          ),
          LinearProgressIndicator(value: plan.state.isFinished ? 1 : plan.endAt == plan.startAt ? 0 : (DateTime.now().millisecondsSinceEpoch - plan.triggerTime) / (plan.endAt - plan.startAt)),
          Row(
            children: [
              Text(
                plan.startAt.dateTime,
                style: theme.textTheme.titleSmall?.copyWith(
                  color: theme.colorScheme.primary
                ),
              ),
              Expanded(child: const SizedBox()),
              Text(
                plan.endAt.dateTime,
                style: theme.textTheme.titleSmall?.copyWith(
                  color: theme.colorScheme.primary
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
