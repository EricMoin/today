import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tiny_weather/features/edit/edit_screen.dart';
import 'package:tiny_weather/features/edit/pages/edit_select_screen.dart';
import 'package:tiny_weather/features/edit/pages/edit_todo_screen.dart';
import 'package:tiny_weather/features/edit/pages/edit_flow_screen.dart';
import 'package:tiny_weather/features/edit/pages/edit_plan_screen.dart';
import 'package:tiny_weather/features/error/error_screen.dart';
import 'package:tiny_weather/features/home/pages/todo_detail_screen.dart';
import 'package:tiny_weather/features/user/user_screen.dart';
import 'package:tiny_weather/main_screen.dart';
import 'package:tiny_weather/features/home/home_screen.dart';

// This part declaration will be used by the code generator
part 'route_data.g.dart';

@TypedStatefulShellRoute<MainScreenRoute>(
  branches: [
    TypedStatefulShellBranch<HomeScreenBranch>(
      routes: [TypedGoRoute<HomeScreenRoute>(path: '/home')],
    ),
    TypedStatefulShellBranch<UserScreenBranch>(
      routes: [TypedGoRoute<UserScreenRoute>(path: '/user')],
    ),
  ],
)
class MainScreenRoute extends StatefulShellRouteData {
  const MainScreenRoute();

  @override
  Widget builder(
    BuildContext context,
    GoRouterState state,
    StatefulNavigationShell navigationShell,
  ) => MainScreen(navigationShell: navigationShell);
}

class HomeScreenBranch extends StatefulShellBranchData {
  const HomeScreenBranch();
}

class UserScreenBranch extends StatefulShellBranchData {
  const UserScreenBranch();
}

class HomeScreenRoute extends GoRouteData {
  const HomeScreenRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => HomeScreen();
}

@TypedStatefulShellRoute<EditScreenRoute>(
  branches: [
    TypedStatefulShellBranch<EditScreenSelectBranch>(
      routes: [
        TypedGoRoute<EditScreenSelectRoute>(
          path: '/edit/select',
        ),
      ],
    ),
    TypedStatefulShellBranch<EditTodoBranch>(
      routes: [
        TypedGoRoute<EditTodoRoute>(
          path: '/edit/todo',
        ),
      ],
    ),
    TypedStatefulShellBranch<EditFlowBranch>(
      routes: [
        TypedGoRoute<EditFlowRoute>(
          path: '/edit/flow',
        ),
      ],
    ),
    TypedStatefulShellBranch<EditPlanBranch>(
      routes: [
        TypedGoRoute<EditPlanRoute>(
          path: '/edit/plan',
        ),
      ],
    ),
  ],
)
class EditScreenRoute extends StatefulShellRouteData {
  const EditScreenRoute();
  @override
  Widget builder(
    BuildContext context,
    GoRouterState state,
    StatefulNavigationShell navigationShell,
  ) => EditScreen(navigationShell: navigationShell);
}

class EditScreenSelectBranch extends StatefulShellBranchData{
  const EditScreenSelectBranch();
}

class EditScreenSelectRoute extends GoRouteData{
  const EditScreenSelectRoute();
  
  @override
  Widget build(BuildContext context,GoRouterState state) => EditSelectScreen();
}

class EditTodoBranch extends StatefulShellBranchData{
  const EditTodoBranch();
}

class EditTodoRoute extends GoRouteData{
  const EditTodoRoute();
  
  @override
  Widget build(BuildContext context,GoRouterState state) => EditTodoScreen();
}

class EditFlowBranch extends StatefulShellBranchData{
  const EditFlowBranch();
}

class EditFlowRoute extends GoRouteData{
  const EditFlowRoute();
  
  @override
  Widget build(BuildContext context,GoRouterState state) => EditFlowScreen();
}

class EditPlanBranch extends StatefulShellBranchData{
  const EditPlanBranch();
}

class EditPlanRoute extends GoRouteData{
  const EditPlanRoute();
  
  @override
  Widget build(BuildContext context,GoRouterState state) => EditPlanScreen();
}

class UserScreenRoute extends GoRouteData {
  const UserScreenRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) => UserScreen();
}

@TypedGoRoute<DetailScreenRoute>(path: '/detail/:uuid')
class DetailScreenRoute extends GoRouteData {
  final String uuid;

  const DetailScreenRoute({required this.uuid});

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return TodoDetailScreen(uuid: uuid);
  }

  @override
  FutureOr<String?> redirect(BuildContext context, GoRouterState state) {
    // 如果uuid为空或无效，重定向到错误页面
    if (uuid.isEmpty) {
      return '/error';
    }
    return null;
  }
}


@TypedGoRoute<ErrorScreenRoute>(path: '/error')
class ErrorScreenRoute extends GoRouteData {
  const ErrorScreenRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => ErrorScreen();
}
