import 'package:flutter/material.dart' hide Flow;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:tiny_weather/features/home/components/todo_card.dart';
import 'package:tiny_weather/features/home/providers/flow_provider.dart';
import 'package:tiny_weather/local/model/flow.dart';
import 'package:tiny_weather/local/model/info.dart';
import 'package:tiny_weather/local/model/todo.dart';
import 'package:uuid/uuid.dart';

class EditFlowScreen extends ConsumerStatefulWidget {
  const EditFlowScreen({super.key});

  @override
  ConsumerState<EditFlowScreen> createState() => _EditFlowScreenState();
}

class _EditFlowScreenState extends ConsumerState<EditFlowScreen> {
  late ThemeData theme;
  late TextEditingController _titleEditingController;
  List<Todo> todos = [];
  DateTime startTime = DateTime.now();
  DateTime endTime = DateTime.now();
  @override
  void initState() {
    super.initState();
    _titleEditingController = TextEditingController();
  }

  @override
  void dispose() {
    _titleEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    theme = Theme.of(context);
    var width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Flow', style: theme.textTheme.titleMedium),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              if (_titleEditingController.text.isEmpty) {
                showAdaptiveDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog.adaptive(
                      title: Text('Save', style: theme.textTheme.titleMedium),
                      content: Text('Target can not be empty.'),
                      actionsAlignment: MainAxisAlignment.center,
                      actions: [
                        TextButton(
                          onPressed: () {
                            context.pop();
                          },
                          child: Text(
                            'Confirm',
                            style: theme.textTheme.titleSmall,
                          ),
                        ),
                      ],
                    );
                  },
                );
              } else {
                ref
                    .watch(flowListProvider.notifier)
                    .add(
                      Flow(
                        uuid: Uuid().v4(),
                        title: _titleEditingController.text,
                        firstCreateTime: DateTime.now().millisecondsSinceEpoch,
                        lastModifiedTime: DateTime.now().millisecondsSinceEpoch,
                        startAt: startTime.millisecondsSinceEpoch,
                        endAt: endTime.millisecondsSinceEpoch,
                        todos: todos,
                        state: BaseState.intialized(),
                      ),
                    );
                context.pop();
                Fluttertoast.showToast(msg: 'Successfully created flow');
              }
            },
            icon: Icon(Icons.check),
          ),
        ],
      ),
      body: Center(
        child: SizedBox(
          width: width * 0.9,
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 10,
                  children: [
                    Text(
                      '🎯  Target',
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: theme.colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextField(
                      controller: _titleEditingController,
                      maxLines: 1,
                      decoration: InputDecoration(
                        hintText: 'Enter your todo title',
                      ),
                    ),
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
                        Text('Start Date', style: theme.textTheme.titleSmall),
                        TextButton(
                          onPressed: () async {
                            final DateTime? picked = await showDatePicker(
                              context: context,
                              initialDate: startTime,
                              firstDate: DateTime.now(),
                              lastDate: DateTime.now().add(
                                Duration(days: 3600),
                              ),
                            );
                            if (picked != null && picked != startTime) {
                              setState(() {
                                startTime = picked;
                              });
                            }
                          },
                          child: Text(
                            DateFormat.yMEd().format(startTime),
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: theme.colorScheme.primary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('End Date', style: theme.textTheme.titleSmall),
                        TextButton(
                          onPressed: () async {
                            final DateTime? picked = await showDatePicker(
                              context: context,
                              initialDate: endTime,
                              firstDate: DateTime(1900),
                              lastDate: DateTime.now().add(
                                Duration(days: 3600),
                              ),
                            );
                            if (picked != null && picked != endTime) {
                              setState(() {
                                endTime = picked;
                              });
                            }
                          },
                          child: Text(
                            DateFormat.yMEd().format(endTime),
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: theme.colorScheme.primary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      '✍️  Job',
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: theme.colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SliverList.builder(
                itemCount: todos.length,
                itemBuilder: (context, index) {
                  return FlowTodoCard(
                    onTitleChanged: (value) {
                      todos[index].title = value;
                    },
                  );
                },
              ),
              SliverToBoxAdapter(
                child: IconButton.filled(
                  onPressed: () {
                    setState(() {
                      todos.add(
                        Todo(
                          uuid: Uuid().v4(),
                          title: '',
                          state: BaseState.intialized(),
                          firstCreateTime:
                              DateTime.now().millisecondsSinceEpoch,
                          lastModifiedTime:
                              DateTime.now().millisecondsSinceEpoch,
                          startAt: startTime.millisecondsSinceEpoch,
                          endAt: endTime.millisecondsSinceEpoch,
                        ),
                      );
                    });
                  },
                  icon: Icon(Icons.add),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FlowTodoCard extends StatefulWidget {
  final Function(String) onTitleChanged;
  const FlowTodoCard({super.key, required this.onTitleChanged});
  @override
  State<FlowTodoCard> createState() => _FlowTodoCardState();
}

class _FlowTodoCardState extends State<FlowTodoCard> {
  late ThemeData theme;
  late TextEditingController _titleEditingController;
  @override
  void initState() {
    super.initState();
    _titleEditingController = TextEditingController();
    _titleEditingController.addListener(() {
      widget.onTitleChanged(_titleEditingController.text);
    });
  }

  @override
  void dispose() {
    _titleEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    theme = Theme.of(context);
    return ListTile(
      contentPadding: EdgeInsets.all(0),
      leading: Icon(Icons.adjust_rounded),
      title: TextField(
        controller: _titleEditingController,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Enter your todo title',
        ),
      ),
    );
  }
}
