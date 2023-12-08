import 'package:flutter_application/base/model/base_body_model.dart';
import 'package:flutter_application/base/model/error_dto.dart';
import 'package:flutter_application/data/dto/notification_dto.dart';
import 'package:flutter_application/data/repositories/notification_repository.dart';
import 'package:flutter_application/ui/blocs/notification/notification_state.dart';
import 'package:flutter_application/utils/app_utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class NotificationBloc extends Cubit<NotificationState> {
  NotificationBloc() : super(const NotificationState.loading());

  final notificationRepo = GetIt.instance.get<NotificationRepository>();

  final refreshController = RefreshController();

  bool enableLoadMore = false;

  final searchBodyModel = BaseBodyModel();

  Future<void> init() async {
    try {
      List<NotificationDto> dataList = await getData();
      List<NotificationDto> unReadDataList = await getNotificationUnreadData();
      emit(NotificationState(dataList, unReadDataList.length));
    } catch (exception) {
      if (exception is ErrorDto) {
        emit(NotificationState.error(exception.message.toString()));
      } else {
        emit(NotificationState.error(exception.toString()));
      }
    }
  }

  Future<bool> readNotification(NotificationDto notification) async {
    try {
      final result = await notificationRepo.readNotification(notification.id.toInt());
      if (result) {
        state.whenOrNull((dataList, unReadCount) {
          final newList = [...dataList];
          for (var element in newList) {
            if (element.id == notification.id) {
              element.isRead = result;
              break;
            }
          }
          emit(NotificationState(newList, unReadCount));
        });
      }
      return result;
    } catch (exception) {
      return false;
    }
  }

  Future<List<NotificationDto>> getData() async {
    List<NotificationDto> dataList = await notificationRepo.getAllNotification(searchBodyModel);
    if (dataList.length == searchBodyModel.pageSize) {
      enableLoadMore = true;
    } else {
      enableLoadMore = false;
    }
    return dataList;
  }

  Future<List<NotificationDto>> getNotificationUnreadData() async {
    List<NotificationDto> dataList = await notificationRepo.getNotificationUnread(searchBodyModel);
    return dataList;
  }

  Future<void> onRefresh() async {
    final dataList = await getData();
    List<NotificationDto> unReadDataList = await getNotificationUnreadData();
    emit(NotificationState(dataList, unReadDataList.length));
    refreshController.refreshCompleted();
  }

  Future<void> onLoadMore() async {
    if (enableLoadMore) {
      await state.whenOrNull((dataList, unReadCount) async {
        final data = await getData();
        emit(NotificationState([...dataList, ...data], unReadCount));
      });
    }
    refreshController.loadComplete();
  }

  void cleanState() {
    emit(const NotificationState.loading());
  }

  //Bắc kạn

  Future<void> search({required String message, required String fromUser}) async {
    await state.whenOrNull((dataList, unReadCount) async {
      try {
        final newData = await getData();
        emit(NotificationState(newData, unReadCount));
      } catch (exception) {
        if (exception is ErrorDto) {
          AppUtils.showNoti(message: exception.message.toString());
        } else {
          AppUtils.showNoti(message: exception.toString());
        }
      }
    });
  }
}
