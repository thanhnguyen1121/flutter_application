import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application/gen/assets.gen.dart';
import 'package:flutter_application/ui/widgets/notification_widget.dart';
import 'package:flutter_application/utils/app_colors.dart';
import 'package:flutter_application/utils/app_theme_state_extension.dart';

class AppScrollWidget extends StatefulWidget {
  static const routeName = 'AppScrollWidget';
  final String title;
  final Widget body;
  final EdgeInsets? padding;
  final double? offset;
  final bool enableBack;
  final bool enableDrawer;
  final VoidCallback? onDrawerPressed;
  final bool enableNotification;
  final bool enableSearch;
  final VoidCallback? onSearchPressed;

  const AppScrollWidget(
      {super.key,
      required this.title,
      required this.body,
      this.padding,
      this.offset,
      this.enableBack = true,
      this.enableDrawer = false,
      this.onDrawerPressed,
      this.enableNotification = false,
      this.onSearchPressed,
      this.enableSearch = false});

  @override
  State<AppScrollWidget> createState() => _AppScrollWidgetState();
}

class _AppScrollWidgetState extends State<AppScrollWidget> {
  final ScrollController scrollController = ScrollController();
  final StreamController<bool> headerCtrl = StreamController.broadcast();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(scrollListener);
  }

  @override
  void dispose() {
    scrollController.removeListener(scrollListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          controller: scrollController,
          padding: widget.padding,
          physics: const BouncingScrollPhysics(),
          child: widget.body,
        ),
        AppScrollAppBarWidget(
          headerCtrl: headerCtrl,
          enableBack: widget.enableBack,
          enableDrawer: widget.enableDrawer,
          title: widget.title,
          onDrawerPressed: widget.onDrawerPressed,
          enableNotification: widget.enableNotification,
          onSearchPressed: widget.onSearchPressed,
          enableSearch: widget.enableSearch,
        ),
      ],
    );
  }

  void scrollListener() {
    if (scrollController.offset >= (widget.offset ?? 200) && !scrollController.position.outOfRange) {
      headerCtrl.sink.add(true);
    }
    if (scrollController.offset < (widget.offset ?? 200) && !scrollController.position.outOfRange) {
      headerCtrl.sink.add(false);
    }
  }
}

class AppScrollAppBarWidget extends StatelessWidget {
  final StreamController<bool> headerCtrl;
  final String title;
  final bool enableBack;
  final bool enableDrawer;
  final bool enableNotification;
  final bool enableSearch;
  final VoidCallback? onDrawerPressed;
  final VoidCallback? onSearchPressed;

  const AppScrollAppBarWidget({
    super.key,
    required this.headerCtrl,
    required this.title,
    required this.enableBack,
    required this.enableDrawer,
    this.onDrawerPressed,
    this.enableNotification = false,
    this.enableSearch = false,
    this.onSearchPressed,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      stream: headerCtrl.stream.distinct(),
      initialData: false,
      builder: (context, snapshot) {
        final isExpanded = snapshot.requireData;
        if (isExpanded) {
          return Container(
            decoration: BoxDecoration(
              color: AppColors.color8B1F17,
              boxShadow: [
                BoxShadow(
                  color: AppColors.black.withOpacity(0.06),
                  offset: const Offset(0, 1),
                  blurRadius: 2.0,
                  spreadRadius: 2.0,
                )
              ],
            ),
            child: SafeArea(
              top: true,
              bottom: false,
              child: Container(
                alignment: Alignment.centerLeft,
                height: 57,
                padding: const EdgeInsets.only(left: 16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (enableBack) ...[
                      InkResponse(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        radius: 24,
                        child: const Icon(Icons.arrow_back, color: AppColors.white),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                    ],
                    if (enableDrawer) ...[
                      InkResponse(
                        onTap: () {
                          onDrawerPressed?.call();
                        },
                        radius: 24,
                        child: Assets.icons.icFriesMenu.svg(
                          width: 28,
                          height: 28,
                          color: AppColors.white,
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                    ],
                    Expanded(
                      child: Text(
                        title,
                        style: context.appTheme.h5.copyWith(color: AppColors.white),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                      ),
                    ),
                    if (enableSearch) ...[
                      InkWell(
                        onTap: onSearchPressed,
                        child: const Icon(Icons.search, color: AppColors.white),
                      ),
                      const SizedBox(width: 16),
                    ],
                    if (enableNotification) ...[
                      const NotificationWidget(),
                      const SizedBox(
                        width: 16,
                      ),
                    ],
                  ],
                ),
              ),
            ),
          );
        }
        return SafeArea(
          top: true,
          bottom: false,
          child: Container(
            alignment: Alignment.centerLeft,
            height: 57,
            padding: const EdgeInsets.only(left: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (enableBack) ...[
                  InkResponse(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    radius: 24,
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        color: AppColors.colorA1A1AA.withOpacity(0.5),
                      ),
                      child: const Icon(
                        Icons.arrow_back,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ],
                if (enableDrawer) ...[
                  InkResponse(
                    onTap: () {
                      onDrawerPressed?.call();
                    },
                    radius: 24,
                    child: Assets.icons.icFriesMenu.svg(
                      width: 28,
                      height: 28,
                      color: AppColors.white,
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                ],
                Expanded(child: Container()),
                if (enableSearch) ...[
                  InkWell(
                    onTap: onSearchPressed,
                    child: const Icon(Icons.search, color: AppColors.white),
                  ),
                  const SizedBox(width: 16),
                ],
                if (enableNotification) ...[
                  const NotificationWidget(),
                  const SizedBox(width: 16),
                ],
              ],
            ),
          ),
        );
      },
    );
  }
}
