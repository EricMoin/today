import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiny_weather/features/home/components/todo_card.dart';
import 'package:tiny_weather/features/home/providers/todo_provider.dart';
import 'package:tiny_weather/router/route_data.dart';

class HomeScreen extends ConsumerWidget {
  late ThemeData theme;
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    theme = Theme.of(context);
    var todos = ref.watch(todoListProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Today', style: theme.textTheme.displayMedium),
      ),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverPadding(
            padding: EdgeInsets.all(15),
            sliver: SliverList.separated(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                return TodoCard(
                  todo: todos[index],
                  isSelected: todos[index].state.isFinished,
                  onTap:(){
                    DetailScreenRoute(uuid: todos[index].uuid).push(context);
                  },
                  onChanged: (value) {
                    if (value) {
                      ref.read(todoListProvider.notifier).finishedTodo(index);
                    } else {
                      ref.read(todoListProvider.notifier).updateTodoState(index);
                    }
                  },
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(height: 10);
              },
            ),
          ),
        ],
      ),
    );
  }
}
