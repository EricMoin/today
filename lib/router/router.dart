import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:tiny_weather/router/route_data.dart';


final _rootNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  initialLocation: '/home',
  navigatorKey: _rootNavigatorKey,
  routes: $appRoutes,
);

