import 'package:flutter/material.dart';
import 'package:flutter_application/themes.dart';

extension AppThemeStateExtension on BuildContext {
  AppTheme get appTheme {
    return Theme.of(this).extension<AppTheme>()!;
  }
}
