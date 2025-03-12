import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends ConsumerWidget {
  late ThemeData theme;
  HomeScreen({
    super.key,
    });
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Today',
          style: theme.textTheme.displayMedium,
        ),
      ),
      body: Center(
        child: Text('Home'),
      ),
    );
  }
}
