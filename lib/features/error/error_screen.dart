import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ErrorScreen extends ConsumerWidget {
  late ThemeData theme;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    theme = Theme.of(context);
    return Scaffold(
      body: Text(
        '遇到了未知错误',
        style: theme.textTheme.displayLarge,
      ),
    );
  }
}