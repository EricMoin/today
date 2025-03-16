import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:today/extensions/extension.dart';
import 'package:today/features/home/components/task_progress_indicator.dart';
import 'package:today/features/home/providers/todo_provider.dart';
import 'package:today/local/model/info.dart';
import 'package:today/local/model/todo.dart';
import 'package:intl/intl.dart';

class TodoDetailScreen extends ConsumerStatefulWidget {
  String uuid;
  TodoDetailScreen({super.key, required this.uuid});
  
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TodoDetailScreenState();
}
class _TodoDetailScreenState extends ConsumerState<TodoDetailScreen>{
  late ThemeData theme;
  @override
  Widget build(BuildContext context) {
    theme = Theme.of(context);
    var todo = ref.watch(todoListProvider.notifier).getTodo(widget.uuid);
    return Scaffold(
      appBar: AppBar(
        actions: [
          if( todo.state.isEnabled )
          IconButton(
            icon: Icon(Icons.check),
            onPressed: (){
              ref.read(todoListProvider.notifier).finishedTodo(
                ref.watch(todoListProvider).indexOf(todo)
              );
            },
          ),
          // const SizedBox(width: 10,),
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
                slivers: [SliverToBoxAdapter(child: _TodoInfoCard(todo: todo))],
              ),
            );
          },
        ),
      ),
    );
  }
}

class _TodoInfoCard extends StatelessWidget {
  Todo todo;
  late ThemeData theme;
  _TodoInfoCard({required this.todo});
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
              startAt: todo.startAt,
              endAt: todo.endAt,
              progress: (todo.endAt == todo.startAt) ? 0 : (DateTime.now().millisecondsSinceEpoch - todo.startAt) / (todo.endAt - todo.startAt),
              state: todo.state,
            ),
          ),
          Text(
            '🎯  Target',
            style: theme.textTheme.titleMedium?.copyWith(
              color: theme.colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(todo.title, style: theme.textTheme.bodyMedium?.copyWith()),
          const SizedBox.shrink(),
          Text(
            '✍️  Job',
            style: theme.textTheme.titleMedium?.copyWith(
              color: theme.colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(todo.content, style: theme.textTheme.bodyMedium?.copyWith()),
          const SizedBox.shrink(),
          Text(
            '🕒  Period',
            style: theme.textTheme.titleMedium?.copyWith(
              color: theme.colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
          LinearProgressIndicator(value: todo.state.isFinished ? 1 : todo.endAt == todo.startAt ? 0 : (DateTime.now().millisecondsSinceEpoch - todo.startAt) / (todo.endAt - todo.startAt)),
          Row(
            children: [
              Text(
                todo.startAt.dateTime,
                style: theme.textTheme.titleSmall?.copyWith(
                  color: theme.colorScheme.primary
                ),
              ),
              Expanded(child: const SizedBox()),
              Text(
                todo.endAt.dateTime,
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
