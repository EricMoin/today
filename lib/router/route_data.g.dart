// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route_data.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$mainScreenRoute];

RouteBase get $mainScreenRoute => StatefulShellRouteData.$route(
  factory: $MainScreenRouteExtension._fromState,
  branches: [
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(
          path: '/home',

          factory: $HomeScreenRouteExtension._fromState,
          routes: [
            GoRouteData.$route(
              path: 'detail/:uuid',

              factory: $DetailScreenRouteExtension._fromState,
            ),
          ],
        ),
      ],
    ),
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(
          path: '/edit',

          factory: $EditScreenRouteExtension._fromState,
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

extension $DetailScreenRouteExtension on DetailScreenRoute {
  static DetailScreenRoute _fromState(GoRouterState state) =>
      DetailScreenRoute(uuid: state.pathParameters['uuid']!);

  String get location =>
      GoRouteData.$location('/home/detail/${Uri.encodeComponent(uuid)}');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $EditScreenRouteExtension on EditScreenRoute {
  static EditScreenRoute _fromState(GoRouterState state) =>
      const EditScreenRoute();

  String get location => GoRouteData.$location('/edit');

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
