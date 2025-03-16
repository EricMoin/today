import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:today/features/edit/pages/edit_select_screen.dart';
import 'package:today/features/edit/pages/edit_todo_screen.dart';
import 'package:today/features/edit/pages/edit_flow_screen.dart';
import 'package:today/features/edit/pages/edit_plan_screen.dart';
import 'package:today/features/error/error_screen.dart';
import 'package:today/features/home/pages/flow_detail_screen.dart';
import 'package:today/features/home/pages/todo_detail_screen.dart';
import 'package:today/features/home/pages/plan_detail_screen.dart';
import 'package:today/main_screen.dart';
import 'package:today/features/home/home_screen.dart';

// This part declaration will be used by the code generator
part 'route_data.g.dart';

@TypedGoRoute<MainScreenRoute>(path: '/')
class MainScreenRoute extends GoRouteData {
  const MainScreenRoute();
  @override
  Widget build(
    BuildContext context,
    GoRouterState state,
  ) => MainScreen();
}
@TypedGoRoute<EditScreenSelectRoute>(path: '/edit/select')
class EditScreenSelectRoute extends GoRouteData{
  const EditScreenSelectRoute();
  
  @override
  Widget build(BuildContext context,GoRouterState state) => EditSelectScreen();
}

@TypedGoRoute<EditTodoRoute>(path: '/edit/todo')
class EditTodoRoute extends GoRouteData{
  const EditTodoRoute();
  
  @override
  Widget build(BuildContext context,GoRouterState state) => EditTodoScreen();
}

@TypedGoRoute<EditFlowRoute>(path: '/edit/flow')
class EditFlowRoute extends GoRouteData{
  const EditFlowRoute();
  @override
  Widget build(BuildContext context,GoRouterState state) => EditFlowScreen();
}

@TypedGoRoute<EditPlanRoute>(path: '/edit/plan')
class EditPlanRoute extends GoRouteData{
  const EditPlanRoute();
  
  @override
  Widget build(BuildContext context,GoRouterState state) => EditPlanScreen();
}


@TypedGoRoute<TodoDetailScreenRoute>(path: '/todo/:uuid')
class TodoDetailScreenRoute extends GoRouteData {
  final String uuid;

  const TodoDetailScreenRoute({required this.uuid});

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

@TypedGoRoute<FlowDetailScreenRoute>(path: '/flow/:uuid')
class FlowDetailScreenRoute extends GoRouteData {
  final String uuid;

  const FlowDetailScreenRoute({required this.uuid});

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return FlowDetailScreen(uuid: uuid);
  }
}

@TypedGoRoute<PlanDetailScreenRoute>(path: '/plan/:uuid')
class PlanDetailScreenRoute extends GoRouteData {
  final String uuid;

  const PlanDetailScreenRoute({required this.uuid});

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return PlanDetailScreen(uuid: uuid);
  }
}


@TypedGoRoute<ErrorScreenRoute>(path: '/error')
class ErrorScreenRoute extends GoRouteData {
  const ErrorScreenRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => ErrorScreen();
}
