import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:tiny_weather/features/error/error_screen.dart';
import 'package:tiny_weather/router/route_data.dart';


final _rootNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  initialLocation: '/',
  navigatorKey: _rootNavigatorKey,
  routes: $appRoutes,
  errorBuilder: (context, state) => ErrorScreen(),
);

