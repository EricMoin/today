import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tiny_weather/constant/theme.dart';
import 'package:tiny_weather/constant/theme_manager.dart';
import 'package:tiny_weather/constant/util.dart';
import 'package:tiny_weather/provider/global_provider.dart';
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



class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    var mode = ref.watch(appThemeProvider);
    return MaterialApp.router(
      title: 'Tiny Weather',
      debugShowCheckedModeBanner: false,
      theme: mode == ThemeState.light ? ThemeManager.light(context) : ThemeManager.dark(context),
      routerConfig: router,
    );
  }
}