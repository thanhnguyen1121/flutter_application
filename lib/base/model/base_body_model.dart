import 'package:json_annotation/json_annotation.dart';

part 'base_body_model.g.dart';

@JsonSerializable()
class BaseBodyModel {
  factory BaseBodyModel.fromJson(Map<String, dynamic> json) => _$BaseBodyModelFromJson(json);

  Map<String, dynamic> toJson() => _$BaseBodyModelToJson(this);

  const BaseBodyModel();
}
