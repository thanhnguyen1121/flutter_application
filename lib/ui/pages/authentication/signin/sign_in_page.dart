import 'package:flutter/material.dart';
import 'package:flutter_application/data/data.dart';
import 'package:flutter_application/data/dto/home_dto.dart';
import 'package:flutter_application/domain/body_model/home_body_model.dart';

import '../../../../generated/l10n.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final baseApiService = BaseApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(S.current.sign_in),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          baseApiService.handleGetList<HomeDto, HomeBodyModel>(
            endPoint: "endPoint",
            bodyModel: HomeBodyModel(name: "hi_name"),
            fromJsonT: (json) => HomeDto.fromJson(json as Map<String, dynamic>),
          );
        },
        child: const Text("test"),
      ),
    );
  }
}
