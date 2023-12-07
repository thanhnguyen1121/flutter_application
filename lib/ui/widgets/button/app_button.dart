import 'package:flutter/cupertino.dart';
import 'package:flutter_application/utils/app_colors.dart';
import 'package:flutter_application/utils/app_theme_state_extension.dart';

class AppButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String title;
  final Color? bgColor;

  const AppButton({
    super.key,
    required this.title,
    this.bgColor,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onPressed,
      padding: EdgeInsets.zero,
      child: Container(
        height: 48,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: bgColor ?? AppColors.colorInk500,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        alignment: Alignment.center,
        child: Text(
          title,
          style: context.appTheme.body14B.copyWith(
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}
