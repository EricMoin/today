import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:tiny_weather/constant/theme.dart';
import 'package:tiny_weather/features/components/ink_container.dart';
import 'package:tiny_weather/local/model/info.dart';
import 'package:tiny_weather/local/model/todo.dart';

class TodoCard extends StatelessWidget {
  final Todo todo;
  bool isSelected;
  ValueChanged? onChanged;
  void Function()? onTap;
  TodoCard({
    required this.todo,
    required this.isSelected,
    this.onChanged,
    this.onTap,
  });
  late ThemeData theme;
  @override
  Widget build(BuildContext context) {
    theme = Theme.of(context);
    var containerColor = theme.colorScheme.outline;
    switch (todo.state.state) {
      case BaseState.finish:
        containerColor = ZExtraTheme.finishedColor;
        break;
      case BaseState.fail:
        containerColor = theme.colorScheme.errorContainer;
      case BaseState.enable:
        containerColor = theme.colorScheme.primaryContainer;
      default:
        containerColor = theme.colorScheme.surfaceContainerHigh;
    }
    return InkContainer(
      onTap: onTap,
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
      decoration: BoxDecoration(
        color: containerColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          todo.state.isFailed
              ? IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.cancel_outlined,
                  color: theme.colorScheme.error,
                ),
              )
              : Checkbox.adaptive(
                value: isSelected,
                activeColor: containerColor,
                onChanged: (value) {
                  onChanged?.call(value);
                },
              ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                todo.title,
                style: theme.textTheme.titleMedium?.copyWith(
                  color:
                      todo.state.isFinished
                          ? Colors.white
                          : theme.textTheme.titleMedium?.color,
                ),
              ),
              Text(
                todo.content,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color:
                      todo.state.isFinished
                          ? Colors.white
                          : theme.textTheme.bodyMedium?.color,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
