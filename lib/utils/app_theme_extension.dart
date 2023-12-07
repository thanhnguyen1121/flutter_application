import 'package:flutter/material.dart';

class AppThemeExtension<T extends ThemeExtension<T>> extends ThemeExtension<T> {
  TextStyle h1 =
      const TextStyle(fontSize: 40, height: 64 / 40.0, fontWeight: FontWeight.w700, color: Color(0xff182531));
  TextStyle h2 =
      const TextStyle(fontSize: 32, height: 48 / 32.0, fontWeight: FontWeight.w700, color: Color(0xff182531));
  TextStyle h3 =
      const TextStyle(fontSize: 28, height: 44 / 28.0, fontWeight: FontWeight.w700, color: Color(0xff182531));
  TextStyle h4 =
      const TextStyle(fontSize: 24, height: 32 / 24.0, fontWeight: FontWeight.w700, color: Color(0xff182531));
  TextStyle h5 =
      const TextStyle(fontSize: 18, height: 22 / 18.0, fontWeight: FontWeight.w700, color: Color(0xff182531));
  TextStyle h6 = const TextStyle(fontSize: 16, height: 1, fontWeight: FontWeight.w600, color: Color(0xff182531));

  TextStyle body16 =
      const TextStyle(fontSize: 16, height: 24 / 16.0, fontWeight: FontWeight.w400, color: Color(0xff182531));
  TextStyle body16B =
      const TextStyle(fontSize: 16, height: 24 / 16.0, fontWeight: FontWeight.w700, color: Color(0xff182531));

  TextStyle body14 =
      const TextStyle(fontSize: 14, height: 20 / 14.0, fontWeight: FontWeight.w400, color: Color(0xff182531));
  TextStyle body14B =
      const TextStyle(fontSize: 14, height: 20 / 14.0, fontWeight: FontWeight.w700, color: Color(0xff182531));

  TextStyle body12 =
      const TextStyle(fontSize: 12, height: 18 / 12.0, fontWeight: FontWeight.w400, color: Color(0xff182531));
  TextStyle body12B =
      const TextStyle(fontSize: 12, height: 18 / 12.0, fontWeight: FontWeight.w700, color: Color(0xff182531));

  TextStyle body10 = const TextStyle(fontSize: 10, fontWeight: FontWeight.w400, color: Color(0xff182531));
  TextStyle body10B = const TextStyle(fontSize: 10, fontWeight: FontWeight.w700, color: Color(0xff182531));

  @override
  ThemeExtension<T> copyWith() {
    return this;
  }

  @override
  ThemeExtension<T> lerp(covariant ThemeExtension<T>? other, double t) {
    return this;
  }

  void applyFontFamily(String fontFamily) {
    h1 = h1.copyWith(
      fontFamily: fontFamily,
    );
    h2 = h2.copyWith(fontFamily: fontFamily);
    h3 = h3.copyWith(fontFamily: fontFamily);
    h4 = h4.copyWith(fontFamily: fontFamily);
    h5 = h5.copyWith(fontFamily: fontFamily);
    h6 = h6.copyWith(fontFamily: fontFamily);

    body12 = body12.copyWith(fontFamily: fontFamily);
    body14 = body14.copyWith(fontFamily: fontFamily);
    body16 = body16.copyWith(fontFamily: fontFamily);

    body10 = body10.copyWith(fontFamily: fontFamily);
    body12B = body12B.copyWith(fontFamily: fontFamily);
    body14B = body14B.copyWith(fontFamily: fontFamily);
  }
}
