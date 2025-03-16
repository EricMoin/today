import 'package:flutter/material.dart';
import 'package:today/constant/theme.dart';
import 'package:today/features/components/ink_container.dart';
import 'package:today/local/model/info.dart';
import 'package:today/local/model/plan.dart';

class PlanCard extends StatelessWidget {
  final Plan plan;
  bool isSelected;
  void Function()? onTap;
  void Function()? onLongPress;
  PlanCard({
    required this.plan,
    required this.isSelected,
    this.onTap,
    this.onLongPress,
  });
  late ThemeData theme;
  @override
  Widget build(BuildContext context) {
    theme = Theme.of(context);
    var containerColor = theme.colorScheme.outline;
    switch (plan.state.state) {
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
    if (isSelected) {
      containerColor = theme.colorScheme.tertiaryContainer;
    }
    return InkContainer(
      onTap: onTap,
      onLongPress: onLongPress,
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      decoration: BoxDecoration(
        color: containerColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            plan.title,
            style: theme.textTheme.titleMedium?.copyWith(
              color:
                  plan.state.isFinished
                      ? Colors.white
                      : theme.textTheme.titleMedium?.color,
            ),
          ),
          Text(
            plan.content,
            style: theme.textTheme.bodyMedium?.copyWith(
              color:
                  plan.state.isFinished
                      ? Colors.white
                      : theme.textTheme.bodyMedium?.color,
            ),
          ),
        ],
      ),
    );
  }
}
