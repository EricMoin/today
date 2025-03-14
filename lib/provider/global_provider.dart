import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tiny_weather/constant/theme.dart';
part 'global_provider.g.dart';

enum ThemeState{
  dark,light
}

@riverpod
class AppTheme extends _$AppTheme{
  @override
  ThemeState build() => ThemeState.light;
  void changeMode(ThemeState mode){
    state = mode;
  }
  void switchMode(){
    state = state == ThemeState.dark ? ThemeState.light : ThemeState.dark;
  }
}