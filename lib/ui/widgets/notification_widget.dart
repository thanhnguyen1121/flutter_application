import 'package:flutter/material.dart';
import 'package:flutter_application/gen/assets.gen.dart';
import 'package:flutter_application/ui/blocs/notification/notification_bloc.dart';
import 'package:flutter_application/ui/blocs/notification/notification_state.dart';
import 'package:flutter_application/utils/app_colors.dart';
import 'package:flutter_application/utils/app_theme_state_extension.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: () {
        // Navigator.pushNamed(context, NotificationPage.routeName);
      },
      radius: 24,
      child: BlocBuilder<NotificationBloc, NotificationState>(
        builder: (context, state) {
          return state.whenOrNull((dataList, unReadCount) {
                if (dataList.any((element) => element.isRead == false)) {
                  return SizedBox(
                    width: 40,
                    height: 40,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [

                        SvgPicture.asset("", color: Colors.black,),
                        Assets.icons.icNotification.svg(
                          width: 28,
                          height: 28,
                          color: AppColors.white,
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.colorEB2227,
                            ),
                            padding: const EdgeInsets.all(6),
                            child: Text(
                              unReadCount <= 99 ? unReadCount.toString() : "99+",
                              textAlign: TextAlign.center,
                              style: context.appTheme.body10B.copyWith(
                                color: AppColors.white,
                                fontSize: 9,
                                height: 1,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                }
                return Assets.icons.icNotification.svg(
                  width: 28,
                  height: 28,
                  color: AppColors.white,
                );
              }) ??
              Assets.icons.icNotification.svg(
                width: 28,
                height: 28,
                color: AppColors.white,
              );
        },
      ),
    );
  }
}
