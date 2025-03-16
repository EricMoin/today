import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:today/features/error/error_screen.dart';
import 'package:today/router/route_data.dart';


final _rootNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  initialLocation: '/',
  navigatorKey: _rootNavigatorKey,
  routes: $appRoutes,
  errorBuilder: (context, state) => ErrorScreen(),
);

