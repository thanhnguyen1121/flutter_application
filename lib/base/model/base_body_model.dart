import 'package:json_annotation/json_annotation.dart';

part 'base_body_model.g.dart';

@JsonSerializable()
class BaseBodyModel {
  @JsonKey(name: 'pageSize', defaultValue: 20)
  int pageSize;

  factory BaseBodyModel.fromJson(Map<String, dynamic> json) => _$BaseBodyModelFromJson(json);

  Map<String, dynamic> toJson() => _$BaseBodyModelToJson(this);

  BaseBodyModel({
    this.pageSize = 20,
  });
}
