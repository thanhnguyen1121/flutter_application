import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application/data/data.dart';
import 'package:flutter_application/domain/entity/bottom_bar_model.dart';
import 'package:flutter_application/gen/assets.gen.dart';
import 'package:flutter_application/utils/app_colors.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final baseApiService = BaseApiService();
  final StreamController<int> bottomBarCtrl = StreamController.broadcast();
  final List<BottomBarModel> bottomList = [
    BottomBarModel(icon: Assets.icons.homeBlack24dp.path, title: "home"),
    BottomBarModel(icon: Assets.icons.icFriesMenu.path, title: "Fries"),
    BottomBarModel(icon: Assets.icons.icNotification.path, title: "Notification"),
    BottomBarModel(icon: Assets.icons.icNotificationNote.path, title: "hi"),
  ];

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.appBackgroundColor,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Text("hi"),
        ],
      ),
    );
  }
}
