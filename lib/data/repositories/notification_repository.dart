import 'package:flutter_application/base/model/base_body_model.dart';
import 'package:flutter_application/data/datasource/remote/notification_service.dart';
import 'package:flutter_application/data/dto/notification_dto.dart';

abstract class NotificationRepository {
  NotificationService notificationService = NotificationService();

  Future<List<NotificationDto>> getNotificationUnread(BaseBodyModel searchModel);

  Future<List<NotificationDto>> getAllNotification(BaseBodyModel searchModel);

  Future<bool> readNotification(int notificationId);
}
