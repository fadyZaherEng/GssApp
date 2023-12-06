import 'package:flutter/material.dart';
import 'package:gss/src/core/utils/constants/nums.dart';

abstract class ThemeState {}
class InitialTheme extends ThemeState{}

class LoadThemeState extends ThemeState {
  final ThemeData themeData;
  LoadThemeState(this.themeData);
}
