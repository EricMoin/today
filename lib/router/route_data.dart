import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tiny_weather/features/edit/edit_screen.dart';
import 'package:tiny_weather/features/user/user_screen.dart';
import 'package:tiny_weather/main_screen.dart';
import 'package:tiny_weather/features/home/home_screen.dart';

// This part declaration will be used by the code generator
part 'route_data.g.dart';

@TypedStatefulShellRoute<MainScreenRoute>(
  branches: [
    TypedStatefulShellBranch<HomeScreenBranch>(
      routes: [
        TypedGoRoute<HomeScreenRoute>(
          path: '/home',
        ),
      ]
    ),
    TypedStatefulShellBranch<EditScreenBranch>(
      routes: [
        TypedGoRoute<EditScreenRoute>(
          path: '/edit',
        ),
      ]
    ),
    TypedStatefulShellBranch<UserScreenBranch>(
      routes: [
        TypedGoRoute<UserScreenRoute>(
          path: '/user',
        ),
      ]
    ),
  ]
)
class MainScreenRoute extends StatefulShellRouteData {
  const MainScreenRoute();
  
  @override
  Widget builder(BuildContext context, GoRouterState state, StatefulNavigationShell navigationShell) => 
    MainScreen(navigationShell: navigationShell);
}

class HomeScreenBranch extends StatefulShellBranchData {
  const HomeScreenBranch();
}

class EditScreenBranch extends StatefulShellBranchData {
  const EditScreenBranch();
}

class UserScreenBranch extends StatefulShellBranchData {
  const UserScreenBranch();
}

class HomeScreenRoute extends GoRouteData {
  const HomeScreenRoute();
  
  @override
  Widget build(BuildContext context, GoRouterState state) => HomeScreen();
}

class EditScreenRoute extends GoRouteData {
  const EditScreenRoute();
  
  @override
  Widget build(BuildContext context, GoRouterState state) => EditScreen();
}

class UserScreenRoute extends GoRouteData {
  const UserScreenRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) => UserScreen();
}