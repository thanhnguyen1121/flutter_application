import 'package:json_annotation/json_annotation.dart';

part 'error_dto.g.dart';

@JsonSerializable()
class ErrorDto {
  @JsonKey(name: 'status_code')
  int? statusCode;

  @JsonKey(name: 'Message')
  String? message;

  @JsonKey(name: 'errors')
  List<String>? errors;

  ErrorDto({this.statusCode, required this.message, required this.errors});

  factory ErrorDto.fromJson(Map<String, dynamic> json) =>
      _$ErrorDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorDtoToJson(this);
}