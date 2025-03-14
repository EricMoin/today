import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:tiny_weather/features/home/providers/todo_provider.dart';

class SwitchTypeButton extends ConsumerStatefulWidget {
  SwitchTypeEnum type;
  SwitchTypeButton({super.key, this.type = SwitchTypeEnum.todo});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SwitchTypeButtonState();
}

class _SwitchTypeButtonState extends ConsumerState<SwitchTypeButton> {
  late ThemeData theme;
  @override
  Widget build(BuildContext context) {
    theme = Theme.of(context);
    var state = ref.watch(switchTypeProvider);
    String typeString = 'Todo';
    IconData iconData = Icons.task_alt;
    switch (state) {
      case 0:
        typeString = 'Todo';
        iconData = Icons.task_alt;
        break;
      case 1:
        typeString = 'Flow';
        iconData = Icons.account_tree;
        break;
      case 2:
        typeString = 'Plan';
        iconData = Icons.calendar_today;
        break;
    }
    return AnimatedSize(
      duration: Duration(seconds: 1),
      child: TextButton.icon(
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(theme.colorScheme.secondary),
        ),
        onPressed: () {
          ref.read(switchTypeProvider.notifier).change();
        },
        label: Text(
          typeString,
          style: theme.textTheme.labelLarge?.copyWith(
            color: theme.colorScheme.onTertiary,
          ),
        ),
        icon: Icon(iconData, color: theme.colorScheme.onSecondary),
      ),
    );
  }
}
