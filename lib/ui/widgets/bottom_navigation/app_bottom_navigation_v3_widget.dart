import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application/domain/entity/bottom_bar_model.dart';
import 'package:flutter_application/ui/widgets/bottom_navigation/bottom_navigator_v3_custom_clipper.dart';
import 'package:flutter_application/utils/app_colors.dart';

class AppBottomNavigationV3Widget extends StatefulWidget {
  final List<BottomBarModel> bottomList;
  final ValueChanged<int>? onPressed;
  final int initialIndex;
  final StreamController<int> bottomCtrl;

  static const routeName = 'AppBottomNavigationV3Widget';

  const AppBottomNavigationV3Widget({
    Key? key,
    required this.bottomCtrl,
    required this.bottomList,
    this.initialIndex = 0,
    this.onPressed,
  }) : super(key: key);

  @override
  State<AppBottomNavigationV3Widget> createState() => _AppBottomNavigationV3WidgetState();
}

class _AppBottomNavigationV3WidgetState extends State<AppBottomNavigationV3Widget> {
  static const tag = 'AppBottomNavigationV3Widget';

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          alignment: Alignment.bottomCenter,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipPath(
                clipper: BottomNavigatorV3CustomClipper(),
                child: Container(
                  width: double.infinity,
                  height: 68,
                  decoration: const BoxDecoration(color: AppColors.appBottomNavigationColor),
                ),
              ),
            ],
          ),
        ),
        Positioned.fill(
          bottom: 46,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: 60,
              height: 60,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.colorBrand800,
              ),
              child: const Icon(Icons.add),
            ),
          ),
        )
      ],
    );
  }
}
