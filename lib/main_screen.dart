import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class MainScreen extends ConsumerWidget {
  final StatefulNavigationShell navigationShell;
  const MainScreen({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: navigationShell,
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        elevation: 0,
        onPressed: () {
          navigationShell.goBranch(1);
        },
        child: const Icon(Icons.edit),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 5,
        height: 50,
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {
                navigationShell.goBranch(0);
              },
              icon: const Icon(
                Icons.home,
                size: 32,
              ),
            ),
            IconButton(
              onPressed: () {
                navigationShell.goBranch(2);
              },
              icon: const Icon(
                Icons.person,
                size: 32,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
