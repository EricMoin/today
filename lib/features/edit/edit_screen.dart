import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EditScreen extends ConsumerWidget{
  late ThemeData theme;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit',
          style: theme.textTheme.titleMedium,
        ),
        centerTitle: true,
      ),
      body: CustomScrollView(
        slivers: [

        ],
      ),
    );
  }
  
}