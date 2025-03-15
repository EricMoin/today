import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiny_weather/features/home/components/flow_card.dart';
import 'package:tiny_weather/features/home/components/state_count_panel.dart';
import 'package:tiny_weather/features/home/components/switch_type_button.dart';
import 'package:tiny_weather/features/home/components/todo_card.dart';
import 'package:tiny_weather/features/home/providers/flow_provider.dart';
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
    var selectedList = ref.watch(selectedListProvider);
    var isSelected = ref.watch(isSelectedModeProvider);
    var switchType = SwitchTypeEnum.values[ref.watch(switchTypeProvider)];
    var flows = ref.watch(flowListProvider);

    return Scaffold(
      appBar: AppBar(
        title:
            isSelected
                ? Text('${selectedList.length} item selected')
                : Text(
                  'Today',
                  style: theme.textTheme.displayMedium?.copyWith(
                    color: theme.colorScheme.primary,
                  ),
                ),
        actions: [
          isSelected
              ? IconButton(
                onPressed: () {
                  ref.read(todoListProvider.notifier).removeAll(selectedList);
                  ref.read(flowListProvider.notifier).removeAll(selectedList);
                  ref.read(selectedListProvider.notifier).clear();
                },
                icon: Icon(Icons.delete_outline),
              )
              : IconButton(
                onPressed: () {
                  ref.read(appThemeProvider.notifier).switchMode();
                },
                icon: Icon(Icons.light_mode),
              ),
        ],
        bottom: PreferredSize(
          preferredSize: Size(MediaQuery.sizeOf(context).width, 50),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [StateCountPanel(), SwitchTypeButton()],
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
          physics: const BouncingScrollPhysics().applyTo(
            const AlwaysScrollableScrollPhysics(),
          ),
          slivers: [
            SliverOffstage(
              offstage: switchType != SwitchTypeEnum.todo,
              sliver: SliverPadding(
                padding: EdgeInsets.all(15),
                sliver: SliverList.separated(
                  itemCount: todos.length,
                  itemBuilder: (context, index) {
                    return TodoCard(
                      todo: todos[index],
                      isFinished: todos[index].state.isFinished,
                      isSelected: selectedList.contains(todos[index].uuid),
                      onTap: () {
                        if (isSelected) {
                          if (selectedList.contains(todos[index].uuid)) {
                            ref
                                .read(selectedListProvider.notifier)
                                .remove(todos[index].uuid);
                          } else {
                            ref
                                .read(selectedListProvider.notifier)
                                .add(todos[index].uuid);
                          }
                        } else {
                          TodoDetailScreenRoute(
                            uuid: todos[index].uuid,
                          ).push(context);
                        }
                      },
                      onLongPress: () {
                        if (!selectedList.contains(todos[index].uuid)) {
                          ref
                              .read(selectedListProvider.notifier)
                              .add(todos[index].uuid);
                        }
                      },
                      onChanged: (value) {
                        if (value) {
                          ref
                              .read(todoListProvider.notifier)
                              .finishedTodo(index);
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
            ),
            SliverPadding(
                padding: EdgeInsets.all(15),
                sliver: SliverList.separated(
                  itemCount: flows.length,
                  itemBuilder: (context, index) {
                    return FlowCard(
                      flow: flows[index],
                      isFinished: flows[index].state.isFinished,
                      isSelected: selectedList.contains(flows[index].uuid),
                      onTap: () {
                        if (isSelected) {
                          if (selectedList.contains(flows[index].uuid)) {
                            ref
                                .read(selectedListProvider.notifier)
                                .remove(flows[index].uuid);
                          } else {
                            ref
                                .read(selectedListProvider.notifier)
                                .add(flows[index].uuid);
                          }
                        } else {
                          FlowDetailScreenRoute(
                            uuid: flows[index].uuid,
                          ).push(context);
                        }
                      },
                      onLongPress: () {
                        if (!selectedList.contains(flows[index].uuid)) {
                          ref
                              .read(selectedListProvider.notifier)
                              .add(flows[index].uuid);
                        }
                      },
                      onChanged: (value) {
                        if (value) {
                          ref
                              .read(flowListProvider.notifier)
                              .finishedFlow(flows[index].uuid);
                        } else {
                          ref
                              .read(flowListProvider.notifier)
                              .update(index);
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
