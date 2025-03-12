import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tiny_weather/features/edit/edit_screen.dart';
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
      routes: [
        TypedGoRoute<HomeScreenRoute>(
          path: '/home',
          routes: [
            // 在home分支下添加详情页路由
            TypedGoRoute<DetailScreenRoute>(
              path: 'detail/:uuid',
            ),
          ],
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
// 在主路由之外添加错误页面路由
@TypedGoRoute<ErrorScreenRoute>(
  path: '/error',
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

class ErrorScreenRoute extends GoRouteData {
  const ErrorScreenRoute();
  
  @override
  Widget build(BuildContext context, GoRouterState state) => ErrorScreen();
}