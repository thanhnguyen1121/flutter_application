import 'package:json_annotation/json_annotation.dart';

part 'notification_dto.g.dart';

@JsonSerializable()
class NotificationDto {
  @JsonKey(name: 'Id', defaultValue: 0)
  num id;

  @JsonKey(name: 'FromUser', defaultValue: 0)
  num fromUser;

  @JsonKey(name: 'ToUser', defaultValue: 0)
  num toUser;

  @JsonKey(name: 'IsRead', defaultValue: false)
  bool isRead;

  @JsonKey(name: 'FromUserName', defaultValue: '')
  String fromUserName;

  @JsonKey(name: 'Message', defaultValue: '')
  String message;

  @JsonKey(name: 'Link', defaultValue: '')
  String link;

  @JsonKey(name: 'Type', defaultValue: '')
  String type;

  @JsonKey(name: 'CreatedDate', defaultValue: '')
  String createdDate;

  @JsonKey(name: 'CreatedBy', defaultValue: '')
  String createdBy;

  @JsonKey(name: 'UpdatedDate', defaultValue: '')
  String updatedDate;

  @JsonKey(name: 'UpdatedBy', defaultValue: '')
  String updatedBy;

  factory NotificationDto.fromJson(Map<String, dynamic> json) => _$NotificationDtoFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationDtoToJson(this);

  NotificationDto({
    required this.id,
    required this.fromUser,
    required this.toUser,
    required this.isRead,
    required this.fromUserName,
    required this.message,
    required this.link,
    required this.type,
    required this.createdDate,
    required this.createdBy,
    required this.updatedDate,
    required this.updatedBy,
  });
}
