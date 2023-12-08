import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_application/domain/entity/bottom_bar_model.dart';
import 'package:flutter_application/utils/app_colors.dart';
import 'package:flutter_application/utils/app_theme_state_extension.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppBottomNavigationV2Widget extends StatefulWidget {
  final ValueChanged<int>? onPressed;
  final int initialIndex;
  final StreamController<int> bottomBarCtrl;
  final List<BottomBarModel> bottomData;

  const AppBottomNavigationV2Widget({
    Key? key,
    required this.initialIndex,
    required this.bottomBarCtrl,
    required this.bottomData,
    this.onPressed,
  }) : super(key: key);

  @override
  State<AppBottomNavigationV2Widget> createState() => _AppBottomNavigationV2WidgetState();
}

class _AppBottomNavigationV2WidgetState extends State<AppBottomNavigationV2Widget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.appBottomNavigationColor,
        borderRadius: BorderRadius.circular(20),
      ),
      height: 72,
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 16).copyWith(bottom: 24),
      child: StreamBuilder<int>(
        stream: widget.bottomBarCtrl.stream,
        initialData: widget.initialIndex,
        builder: (context, snapshot) {
          final index = snapshot.requireData;
          return Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: widget.bottomData.asMap().entries.map((e) {
              return Expanded(
                child: CupertinoButton(
                  onPressed: () {
                    widget.bottomBarCtrl.sink.add(e.key);
                    widget.onPressed?.call(e.key);
                  },
                  padding: EdgeInsets.zero,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(
                        e.value.icon,
                        width: 24,
                        height: 24,
                        color: index == e.key ? AppColors.white : AppColors.white.withOpacity(0.5),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        e.value.title,
                        style: context.appTheme.body12.copyWith(
                          color: index == e.key ? AppColors.white : AppColors.white.withOpacity(0.5),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
