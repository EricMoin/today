import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiny_weather/features/home/components/state_count_panel.dart';
import 'package:tiny_weather/features/home/components/switch_type_button.dart';
import 'package:tiny_weather/features/home/components/todo_card.dart';
import 'package:tiny_weather/features/home/providers/todo_provider.dart';
import 'package:tiny_weather/provider/global_provider.dart';
import 'package:tiny_weather/router/route_data.dart';

class HomeScreen extends ConsumerWidget {
  late ThemeData theme;
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    theme = Theme.of(context);
    var todos = ref.watch(todoListProvider);
    var selectedTodo = ref.watch(selectedListProvider);
    var isSelected = ref.watch(isSelectedModeProvider);



    return Scaffold(
      appBar: AppBar(
        title:
            isSelected
                ? Text('${selectedTodo.length} item selected')
                : Text('Today', style: theme.textTheme.displayMedium?.copyWith(
                  color: theme.colorScheme.primary
                )),
        actions: [
          isSelected ? 
            IconButton(
              onPressed: () {
                ref.read(todoListProvider.notifier).removeAll(selectedTodo);
                ref.read(selectedListProvider.notifier).clear();
              },
              icon: Icon(Icons.delete_outline),
            )
          :
            IconButton(
              onPressed: () {
                ref.read(appThemeProvider.notifier).switchMode();
              },
              icon: Icon(
                Icons.light_mode
              ),
            ),
        ],
        bottom: PreferredSize(
          preferredSize: Size(MediaQuery.sizeOf(context).width, 50),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                StateCountPanel(),
                SwitchTypeButton()
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        elevation: 0,
        onPressed: () {
          EditScreenSelectRoute().push(context);
        },
        child: const Icon(Icons.edit),
      ),
      body: RefreshIndicator.adaptive(
        onRefresh: () async {
          await Future.delayed(Duration(seconds: 1));
          return;
        },
        child: CustomScrollView(
          physics: const BouncingScrollPhysics().applyTo(const AlwaysScrollableScrollPhysics()),
          slivers: [
            SliverPadding(
              padding: EdgeInsets.all(15),
              sliver: SliverList.separated(
                itemCount: todos.length,
                itemBuilder: (context, index) {
                  return TodoCard(
                    todo: todos[index],
                    isFinished: todos[index].state.isFinished,
                    isSelected: selectedTodo.contains(todos[index].uuid),
                    onTap: () {
                      if (isSelected) {
                        if (selectedTodo.contains(todos[index].uuid)) {
                          ref
                              .read(selectedListProvider.notifier)
                              .remove(todos[index].uuid);
                        } else {
                          ref
                              .read(selectedListProvider.notifier)
                              .add(todos[index].uuid);
                        }
                      } else {
                        DetailScreenRoute(uuid: todos[index].uuid).push(context);
                      }
                    },
                    onLongPress: () {
                      if (!selectedTodo.contains(todos[index].uuid)) {
                        ref
                            .read(selectedListProvider.notifier)
                            .add(todos[index].uuid);
                      }
                    },
                    onChanged: (value) {
                      if (value) {
                        ref.read(todoListProvider.notifier).finishedTodo(index);
                      } else {
                        ref
                            .read(todoListProvider.notifier)
                            .updateTodoState(index);
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
      ),
    );
  }
}
