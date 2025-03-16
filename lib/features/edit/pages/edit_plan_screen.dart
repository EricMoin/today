import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:today/features/components/ink_container.dart';
import 'package:today/features/home/providers/plan_provider.dart';
import 'package:today/features/home/providers/todo_provider.dart';
import 'package:today/local/model/info.dart';
import 'package:today/local/model/plan.dart';
import 'package:today/local/model/todo.dart';
import 'package:today/mock/mock.dart';
import 'package:today/router/route_data.dart';
import 'package:uuid/uuid.dart';
import 'package:today/local/storage/local_storage.dart';

class EditPlanScreen extends ConsumerStatefulWidget {
  const EditPlanScreen({super.key});

  @override
  ConsumerState<EditPlanScreen> createState() => _EditPlanScreenState();
}

class _EditPlanScreenState extends ConsumerState<EditPlanScreen> {
  late ThemeData theme;
  late TextEditingController _titleEditingController;
  late TextEditingController _bodyEditingController;
  DateTime startTime = DateTime.parse(DateFormat('yyyy-MM-dd').format(DateTime.now()));
  DateTime triggerAt = DateTime.parse(DateFormat('yyyy-MM-dd').format(DateTime.now()));
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
        title: Text('Plan', style: theme.textTheme.titleMedium),
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
                    .watch(planListProvider.notifier)
                    .add(
                      Plan(
                        uuid: Uuid().v4(),
                        title: _titleEditingController.text,
                        content: _bodyEditingController.text,
                        firstCreateTime: DateTime.now().millisecondsSinceEpoch,
                        lastModifiedTime: DateTime.now().millisecondsSinceEpoch,
                        startAt: DateTime.parse(DateFormat('yyyy-MM-dd').format(startTime)).millisecondsSinceEpoch,
                        state: BaseState.intialized(),
                        endAt: DateTime.parse(DateFormat('yyyy-MM-dd').format(endTime)).millisecondsSinceEpoch,
                        triggerTime: triggerAt.millisecondsSinceEpoch,
                      ),
                    );
                MainScreenRoute().go(context);
                Fluttertoast.showToast(msg: 'Successfully created plan');
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
                        hintText: 'Enter your plan title',
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
                        hintText: 'Enter your plan content',
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
                        Text('Trigger At', style: theme.textTheme.titleSmall),
                        TextButton(
                          onPressed: () async {
                            final picked = await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.fromDateTime(triggerAt),
                            );
                            if (picked != null) {
                              setState(() {
                                triggerAt = DateTime(
                                  triggerAt.year,
                                  triggerAt.month,
                                  triggerAt.day,
                                  picked.hour,
                                  picked.minute,
                                  0
                                );
                              });
                            }
                          },
                          child: Text(
                            DateFormat.jms().format(triggerAt),
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
