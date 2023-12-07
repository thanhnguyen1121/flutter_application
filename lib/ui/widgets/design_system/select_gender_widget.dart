import 'package:flutter/material.dart';
import 'package:flutter_application/generated/l10n.dart';
import 'package:flutter_application/utils/app_colors.dart';
import 'package:flutter_application/utils/app_theme_state_extension.dart';

class SelectGenderWidget extends StatefulWidget {
  static const routeName = 'SelectGenderWidget';
  final ValueChanged<int>? onChangeGender;

  const SelectGenderWidget({super.key, this.onChangeGender});

  @override
  State<SelectGenderWidget> createState() => _SelectGenderWidgetState();
}

class _SelectGenderWidgetState extends State<SelectGenderWidget> {
  bool isMale = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "${S.current.gender}: ",
          style: context.appTheme.body14B,
        ),
        Expanded(
          child: RadioListTile<bool>(
            value: false,
            groupValue: isMale,
            title: Text(
              S.current.male,
              style: context.appTheme.body14,
            ),
            contentPadding: EdgeInsets.zero,
            activeColor: AppColors.colorEB2227,
            onChanged: (value) {
              setState(() {
                isMale = value!;
                widget.onChangeGender?.call(1);
              });
            },
          ),
        ),
        const SizedBox(
          width: 12,
        ),
        Expanded(
          child: RadioListTile(
            value: true,
            groupValue: isMale,
            activeColor: AppColors.colorEB2227,
            contentPadding: EdgeInsets.zero,
            title: Text(S.current.female, style: context.appTheme.body14),
            onChanged: (value) {
              setState(() {
                isMale = value!;
                widget.onChangeGender?.call(0);
              });
            },
          ),
        ),
      ],
    );
  }
}
