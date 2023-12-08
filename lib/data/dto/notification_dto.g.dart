// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationDto _$NotificationDtoFromJson(Map<String, dynamic> json) =>
    NotificationDto(
      id: json['Id'] as num? ?? 0,
      fromUser: json['FromUser'] as num? ?? 0,
      toUser: json['ToUser'] as num? ?? 0,
      isRead: json['IsRead'] as bool? ?? false,
      fromUserName: json['FromUserName'] as String? ?? '',
      message: json['Message'] as String? ?? '',
      link: json['Link'] as String? ?? '',
      type: json['Type'] as String? ?? '',
      createdDate: json['CreatedDate'] as String? ?? '',
      createdBy: json['CreatedBy'] as String? ?? '',
      updatedDate: json['UpdatedDate'] as String? ?? '',
      updatedBy: json['UpdatedBy'] as String? ?? '',
    );

Map<String, dynamic> _$NotificationDtoToJson(NotificationDto instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'FromUser': instance.fromUser,
      'ToUser': instance.toUser,
      'IsRead': instance.isRead,
      'FromUserName': instance.fromUserName,
      'Message': instance.message,
      'Link': instance.link,
      'Type': instance.type,
      'CreatedDate': instance.createdDate,
      'CreatedBy': instance.createdBy,
      'UpdatedDate': instance.updatedDate,
      'UpdatedBy': instance.updatedBy,
    };
