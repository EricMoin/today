import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:today/features/home/providers/todo_provider.dart';
import 'package:today/local/model/info.dart';
import 'package:today/local/model/todo.dart';
import 'package:uuid/uuid.dart';

class EditTodoScreen extends ConsumerStatefulWidget {
  const EditTodoScreen({super.key});

  @override
  ConsumerState<EditTodoScreen> createState() => _EditTodoScreenState();
}

class _EditTodoScreenState extends ConsumerState<EditTodoScreen> {
  late ThemeData theme;
  late TextEditingController _titleEditingController;
  late TextEditingController _bodyEditingController;
  DateTime startTime = DateTime.parse(DateFormat('yyyy-MM-dd').format(DateTime.now()));
  DateTime endTime = DateTime.parse(DateFormat('yyyy-MM-dd').format(DateTime.now()));
  @override
  void initState() {
    super.initState();
    _titleEditingController = TextEditingController();
    _bodyEditingController = TextEditingController();
  }

  @override
  void dispose() {
    _titleEditingController.dispose();
    _bodyEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    theme = Theme.of(context);
    var width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo', style: theme.textTheme.titleMedium),
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
                    .watch(todoListProvider.notifier)
                    .add(
                      Todo(
                        uuid: Uuid().v4(),
                        title: _titleEditingController.text,
                        content: _bodyEditingController.text,
                        firstCreateTime: DateTime.now().millisecondsSinceEpoch,
                        lastModifiedTime: DateTime.now().millisecondsSinceEpoch,
                        startAt: DateTime.parse(DateFormat('yyyy-MM-dd').format(startTime)).millisecondsSinceEpoch,
                        endAt: DateTime.parse(DateFormat('yyyy-MM-dd').format(endTime)).millisecondsSinceEpoch,
                        state: BaseState.intialized(),
                      ),
                    );
                context.pop();
                Fluttertoast.showToast(msg: 'Successfully created todo');
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
                      '✍️  Job',
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: theme.colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextField(
                      controller: _bodyEditingController,
                      decoration: InputDecoration(
                        hintText: 'Enter your todo content',
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
                              firstDate: startTime,
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
                              firstDate: endTime,
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
