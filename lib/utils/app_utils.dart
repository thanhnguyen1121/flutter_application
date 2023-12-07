import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/application.dart';
import 'package:flutter_application/generated/l10n.dart';
import 'package:flutter_application/ui/widgets/button/app_button.dart';
import 'package:flutter_application/utils/app_colors.dart';
import 'package:flutter_application/utils/app_theme_state_extension.dart';
import 'package:intl/intl.dart';

class AppUtils {
  static bool isShowLoading = false;

  static void hideKeyBoard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  static void showLoading() {
    isShowLoading = true;
    showDialog(
      barrierDismissible: false,
      context: appKey.currentState!.context,
      builder: (context) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              width: 100,
              height: 100,
              child: const CupertinoActivityIndicator(
                color: AppColors.colorEB2227,
                radius: 12,
              ),
            ),
          ],
        );
      },
    );
  }

  static void hideLoading() {
    if (isShowLoading) {
      isShowLoading = false;
      Navigator.of(appKey.currentContext!).pop();
    }
  }

  static Future showNoti({
    required String message,
    String? title,
    VoidCallback? onOk,
    bool enableCancel = false,
    String? okTitle,
    Color? okBgColor,
  }) {
    return showDialog(
      barrierDismissible: false,
      context: appKey.currentState!.context,
      builder: (context) {
        return Material(
          type: MaterialType.transparency,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    Text(
                      title ?? S.current.notify,
                      style: context.appTheme.body16B,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      message,
                      textAlign: TextAlign.center,
                      style: context.appTheme.body14,
                    ),
                    const SizedBox(height: 24),
                    Row(
                      children: [
                        Expanded(flex: 2, child: Container()),
                        if (enableCancel == true) ...[
                          Expanded(
                            flex: 1,
                            child: AppButton(
                              title: "Hủy",
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ),
                          const SizedBox(width: 8),
                        ],
                        Expanded(
                          flex: 1,
                          child: AppButton(
                            title: okTitle ?? "Ok",
                            bgColor: okBgColor,
                            onPressed: () {
                              onOk?.call();
                              Navigator.of(context).pop();
                            },
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  static void showDatePicker(BuildContext context, {ValueChanged<String>? onChangedDate}) {
    DateTime currentDate = DateTime.now();
    AppUtils.hideKeyBoard();
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      enableDrag: true,
      backgroundColor: AppColors.transparent,
      builder: (context) {
        return Container(
          decoration: const BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(12),
            ),
          ),
          child: SafeArea(
            bottom: true,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 57,
                    decoration: const BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(12),
                      ),
                    ),
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Chọn ngày",
                            style: context.appTheme.body16B,
                          ),
                        ),
                        Positioned.fill(
                          right: 16,
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: InkWell(
                              child: const Icon(
                                Icons.close,
                                color: AppColors.black,
                              ),
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const Divider(thickness: 1, height: 1, color: AppColors.colorC8C8C8),
                  SizedBox(
                    height: 250,
                    width: double.infinity,
                    child: CupertinoTheme(
                      data: const CupertinoThemeData(
                        brightness: Brightness.light,
                      ),
                      child: CupertinoDatePicker(
                        mode: CupertinoDatePickerMode.date,
                        maximumDate: DateTime.now().add(const Duration(hours: 12)),
                        onDateTimeChanged: (DateTime dateTime) {
                          currentDate = dateTime;
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(flex: 2, child: Container()),
                      Expanded(
                        flex: 1,
                        child: AppButton(
                          title: "Chọn ngày",
                          onPressed: () {
                            Navigator.of(context).pop();
                            onChangedDate?.call(DateFormat("dd/MM/yyyy").format(currentDate));
                          },
                        ),
                      ),
                      const SizedBox(width: 16)
                    ],
                  ),
                  const SizedBox(height: 12),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  static List<BoxShadow> shadow = [
    BoxShadow(
      color: AppColors.black.withOpacity(0.06),
      blurRadius: 3,
      spreadRadius: 1,
      offset: const Offset(0, 3),
    )
  ];
}
