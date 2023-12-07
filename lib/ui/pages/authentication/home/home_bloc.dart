import 'package:flutter_application/base/model/error_dto.dart';
import 'package:flutter_application/ui/pages/authentication/home/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Cubit<HomeState> {
  HomeBloc() : super(const HomeState.loading());

  void init() {
    try {} catch (exception) {
      if (exception is ErrorDto) {
        emit(HomeState.error(exception.message));
      } else {
        emit(HomeState.error(exception.toString()));
      }
    }
  }
}
