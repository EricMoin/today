// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route_data.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
  $mainScreenRoute,
  $editScreenRoute,
  $detailScreenRoute,
  $errorScreenRoute,
];

RouteBase get $mainScreenRoute => StatefulShellRouteData.$route(
  factory: $MainScreenRouteExtension._fromState,
  branches: [
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(
          path: '/home',

          factory: $HomeScreenRouteExtension._fromState,
        ),
      ],
    ),
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(
          path: '/user',

          factory: $UserScreenRouteExtension._fromState,
        ),
      ],
    ),
  ],
);

extension $MainScreenRouteExtension on MainScreenRoute {
  static MainScreenRoute _fromState(GoRouterState state) =>
      const MainScreenRoute();
}

extension $HomeScreenRouteExtension on HomeScreenRoute {
  static HomeScreenRoute _fromState(GoRouterState state) =>
      const HomeScreenRoute();

  String get location => GoRouteData.$location('/home');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $UserScreenRouteExtension on UserScreenRoute {
  static UserScreenRoute _fromState(GoRouterState state) =>
      const UserScreenRoute();

  String get location => GoRouteData.$location('/user');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $editScreenRoute => StatefulShellRouteData.$route(
  factory: $EditScreenRouteExtension._fromState,
  branches: [
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(
          path: '/edit/select',

          factory: $EditScreenSelectRouteExtension._fromState,
        ),
      ],
    ),
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(
          path: '/edit/todo',

          factory: $EditTodoRouteExtension._fromState,
        ),
      ],
    ),
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(
          path: '/edit/flow',

          factory: $EditFlowRouteExtension._fromState,
        ),
      ],
    ),
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(
          path: '/edit/plan',

          factory: $EditPlanRouteExtension._fromState,
        ),
      ],
    ),
  ],
);

extension $EditScreenRouteExtension on EditScreenRoute {
  static EditScreenRoute _fromState(GoRouterState state) =>
      const EditScreenRoute();
}

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

extension $EditTodoRouteExtension on EditTodoRoute {
  static EditTodoRoute _fromState(GoRouterState state) => const EditTodoRoute();

  String get location => GoRouteData.$location('/edit/todo');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $EditFlowRouteExtension on EditFlowRoute {
  static EditFlowRoute _fromState(GoRouterState state) => const EditFlowRoute();

  String get location => GoRouteData.$location('/edit/flow');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $EditPlanRouteExtension on EditPlanRoute {
  static EditPlanRoute _fromState(GoRouterState state) => const EditPlanRoute();

  String get location => GoRouteData.$location('/edit/plan');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $detailScreenRoute => GoRouteData.$route(
  path: '/detail/:uuid',

  factory: $DetailScreenRouteExtension._fromState,
);

extension $DetailScreenRouteExtension on DetailScreenRoute {
  static DetailScreenRoute _fromState(GoRouterState state) =>
      DetailScreenRoute(uuid: state.pathParameters['uuid']!);

  String get location =>
      GoRouteData.$location('/detail/${Uri.encodeComponent(uuid)}');

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
