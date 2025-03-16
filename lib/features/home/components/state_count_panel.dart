import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:today/constant/theme.dart';
import 'package:today/features/home/providers/todo_provider.dart';
import 'package:today/mock/mock.dart';

class StateCountPanel extends ConsumerWidget {
  late ThemeData theme;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var totalCount = ref.watch(todoListProvider).length;
    var enabledCount = ref.watch(enableCountProvider);
    var finishedCount = ref.watch(finishedCountProvider);
    var faildCount = ref.watch(failedCountProvider);
    theme = Theme.of(context);
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        spacing: 15,
        children: [
          SizedBox(
            width: 30,
            height: 30,
            child: Stack(
              children: [
                Positioned.fill(child: CircularProgressIndicator.adaptive(
                  value: ref.watch(todoListProvider).isEmpty ? 0 : enabledCount / ref.watch(todoListProvider).length,
                  valueColor: AlwaysStoppedAnimation(theme.colorScheme.primary),
                  backgroundColor: theme.colorScheme.surfaceDim,
                )),
                Center(
                  child: Text(
                    enabledCount.toString(),
                    style: theme.textTheme.labelMedium?.copyWith(
                      color: theme.colorScheme.primary
                    ),
                  ),
                )
              ],
            ),  
          ),
          SizedBox(
            width: 30,
            height: 30,
            child: Stack(
              children: [
                Positioned.fill(child: CircularProgressIndicator.adaptive(
                  value: ref.watch(todoListProvider).isEmpty ? 0 : finishedCount / ref.watch(todoListProvider).length,
                  valueColor: AlwaysStoppedAnimation(ZExtraTheme.finishedColor),
                  backgroundColor: theme.colorScheme.surfaceDim,
                )),
                Center(
                  child: Text(
                    finishedCount.toString(),
                    style: theme.textTheme.labelMedium?.copyWith(
                      color: ZExtraTheme.finishedColor
                    ),
                  ),
                )
              ],
            ),  
          ),
          SizedBox(
            width: 30,
            height: 30,
            child: Stack(
              children: [
                Positioned.fill(child: CircularProgressIndicator.adaptive(
                  value: ref.watch(todoListProvider).isEmpty ? 0 : faildCount / ref.watch(todoListProvider).length,
                  valueColor: AlwaysStoppedAnimation(theme.colorScheme.error),
                  backgroundColor: theme.colorScheme.surfaceDim,
                )),
                Center(
                  child: Text(
                    faildCount.toString(),
                    style: theme.textTheme.labelMedium?.copyWith(
                      color: theme.colorScheme.error
                    ),
                  ),
                )
              ],
            ),  
          ),
        ],
      ),
    );
  }
}