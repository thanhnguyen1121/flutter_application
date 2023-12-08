import 'package:flutter_application/base/model/base_body_model.dart';
import 'package:flutter_application/data/dto/notification_dto.dart';
import 'package:flutter_application/data/repositories/notification_repository.dart';

class NotificationRepositoryImpl extends NotificationRepository {
  @override
  Future<List<NotificationDto>> getNotificationUnread(BaseBodyModel searchModel) {
    return notificationService.getNotificationUnread(searchModel);
  }

  @override
  Future<List<NotificationDto>> getAllNotification(BaseBodyModel searchModel) {
    return notificationService.getAllNotification(searchModel);
  }

  @override
  Future<bool> readNotification(int notificationId) {
    return notificationService.readNotification(notificationId);
  }
}
