import 'package:flutter/material.dart';
import 'package:flutter_application/utils/app_theme_extension.dart';

ThemeData light(BuildContext context) {
  return ThemeData.light().copyWith(
    extensions: <AppThemeExtension<dynamic>>[
      AppTheme(),
    ],
    pageTransitionsTheme: const PageTransitionsTheme(builders: {
      TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder()
    }),
  );
}

ThemeData dark(BuildContext context) {
  return ThemeData.dark().copyWith(
    extensions: <AppThemeExtension<dynamic>>[
      AppTheme(),
    ],
    pageTransitionsTheme: const PageTransitionsTheme(builders: {
      TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder()
    }),
  );
}

class AppTheme extends AppThemeExtension<AppTheme> {}
