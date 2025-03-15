// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route_data.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
  $mainScreenRoute,
  $editScreenSelectRoute,
  $editTodoRoute,
  $editFlowRoute,
  $editPlanRoute,
  $todoDetailScreenRoute,
  $flowDetailScreenRoute,
  $errorScreenRoute,
];

RouteBase get $mainScreenRoute => GoRouteData.$route(
  path: '/',

  factory: $MainScreenRouteExtension._fromState,
);

extension $MainScreenRouteExtension on MainScreenRoute {
  static MainScreenRoute _fromState(GoRouterState state) =>
      const MainScreenRoute();

  String get location => GoRouteData.$location('/');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $editScreenSelectRoute => GoRouteData.$route(
  path: '/edit/select',

  factory: $EditScreenSelectRouteExtension._fromState,
);

extension $EditScreenSelectRouteExtension on EditScreenSelectRoute {
  static EditScreenSelectRoute _fromState(GoRouterState state) =>
      const EditScreenSelectRoute();

  String get location => GoRouteData.$location('/edit/select');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $editTodoRoute => GoRouteData.$route(
  path: '/edit/todo',

  factory: $EditTodoRouteExtension._fromState,
);

extension $EditTodoRouteExtension on EditTodoRoute {
  static EditTodoRoute _fromState(GoRouterState state) => const EditTodoRoute();

  String get location => GoRouteData.$location('/edit/todo');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $editFlowRoute => GoRouteData.$route(
  path: '/edit/flow',

  factory: $EditFlowRouteExtension._fromState,
);

extension $EditFlowRouteExtension on EditFlowRoute {
  static EditFlowRoute _fromState(GoRouterState state) => const EditFlowRoute();

  String get location => GoRouteData.$location('/edit/flow');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $editPlanRoute => GoRouteData.$route(
  path: '/edit/plan',

  factory: $EditPlanRouteExtension._fromState,
);

extension $EditPlanRouteExtension on EditPlanRoute {
  static EditPlanRoute _fromState(GoRouterState state) => const EditPlanRoute();

  String get location => GoRouteData.$location('/edit/plan');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $todoDetailScreenRoute => GoRouteData.$route(
  path: '/todo/:uuid',

  factory: $TodoDetailScreenRouteExtension._fromState,
);

extension $TodoDetailScreenRouteExtension on TodoDetailScreenRoute {
  static TodoDetailScreenRoute _fromState(GoRouterState state) =>
      TodoDetailScreenRoute(uuid: state.pathParameters['uuid']!);

  String get location =>
      GoRouteData.$location('/todo/${Uri.encodeComponent(uuid)}');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $flowDetailScreenRoute => GoRouteData.$route(
  path: '/flow/:uuid',

  factory: $FlowDetailScreenRouteExtension._fromState,
);

extension $FlowDetailScreenRouteExtension on FlowDetailScreenRoute {
  static FlowDetailScreenRoute _fromState(GoRouterState state) =>
      FlowDetailScreenRoute(uuid: state.pathParameters['uuid']!);

  String get location =>
      GoRouteData.$location('/flow/${Uri.encodeComponent(uuid)}');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $errorScreenRoute => GoRouteData.$route(
  path: '/error',

  factory: $ErrorScreenRouteExtension._fromState,
);

extension $ErrorScreenRouteExtension on ErrorScreenRoute {
  static ErrorScreenRoute _fromState(GoRouterState state) =>
      const ErrorScreenRoute();

  String get location => GoRouteData.$location('/error');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
