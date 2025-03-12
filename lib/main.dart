import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiny_weather/constant/theme.dart';
import 'package:tiny_weather/constant/util.dart';
import 'package:tiny_weather/router/router.dart';
import 'package:tiny_weather/utils/init.dart';

void main() async {
  await InitApp.init();
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Tiny Weather',
      theme: ZTheme(createTextTheme(context, 'Manrope', 'Manrope')).light(),
      routerConfig: router,
    );
  }
}