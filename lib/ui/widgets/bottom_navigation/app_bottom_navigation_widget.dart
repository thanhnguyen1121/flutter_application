import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_application/domain/entity/bottom_bar_model.dart';
import 'package:flutter_application/utils/app_colors.dart';
import 'package:flutter_application/utils/app_theme_state_extension.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppBottomNavigationWidget extends StatefulWidget {
  final StreamController<int> bottomBarCtrl;
  final ValueChanged<int>? onPressed;
  final int? initialIndex;
  final List<BottomBarModel> bottomData;

  const AppBottomNavigationWidget({
    super.key,
    required this.bottomBarCtrl,
    required this.bottomData,
    this.initialIndex,
    this.onPressed,
  });

  @override
  State<AppBottomNavigationWidget> createState() => _AppBottomNavigationWidgetState();
}

class _AppBottomNavigationWidgetState extends State<AppBottomNavigationWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(12),
        ),
      ),
      child: SafeArea(
        top: false,
        bottom: true,
        child: StreamBuilder<int>(
          initialData: widget.initialIndex,
          stream: widget.bottomBarCtrl.stream,
          builder: (context, snapshot) {
            final state = snapshot.requireData;
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: widget.bottomData.asMap().entries.map((e) {
                    return Expanded(
                      child: BottomNavigationBarItemWidget(
                        title: e.value.title,
                        iconPath: e.value.icon,
                        selected: e.key == state,
                        radiusTopLeft: e.key == 0 ? 12 : 0,
                        radiusTopRight: e.key == widget.bottomData.length - 1 ? 12 : 0,
                        onPressed: () {
                          widget.onPressed?.call(e.key);
                          widget.bottomBarCtrl.sink.add(e.key);
                        },
                      ),
                    );
                  }).toList(),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}

class BottomNavigationBarItemWidget extends StatelessWidget {
  final bool selected;
  final String title;
  final String iconPath;
  final VoidCallback onPressed;
  final double? radiusTopLeft;
  final double? radiusTopRight;

  const BottomNavigationBarItemWidget({
    super.key,
    required this.selected,
    required this.iconPath,
    required this.title,
    required this.onPressed,
    this.radiusTopLeft,
    this.radiusTopRight,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onPressed,
      padding: EdgeInsets.zero,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: selected ? AppColors.colorEB2227 : AppColors.transparent,
              width: 2,
            ),
          ),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(radiusTopLeft ?? 0),
            topRight: Radius.circular(radiusTopRight ?? 0),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              iconPath,
              width: 24,
              height: 24,
              color: selected ? AppColors.colorEB2227 : AppColors.colorC8C8C8,
            ),
            const SizedBox(height: 4),
            Text(
              title,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: context.appTheme.body10.copyWith(
                fontWeight: selected ? FontWeight.w700 : FontWeight.w300,
                color: selected ? AppColors.colorEB2227 : AppColors.colorC8C8C8,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
