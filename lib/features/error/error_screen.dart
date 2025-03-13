import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ErrorScreen extends ConsumerWidget {
  late ThemeData theme;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    theme = Theme.of(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 10,
          children: [
            Icon(Icons.error_outline_outlined, size: 30),
            Text('当前页面不存在', style: theme.textTheme.titleMedium),
          ],
        ),
      ),
    );
  }
}
