import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class EditScreen extends ConsumerWidget {
  final StatefulNavigationShell navigationShell;
  
  const EditScreen({
    super.key,
    required this.navigationShell,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return navigationShell;
  }
}
