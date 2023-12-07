import 'package:flutter_application/base/model/base_body_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'home_body_model.g.dart';

@JsonSerializable()
class HomeBodyModel extends BaseBodyModel {
  @JsonKey(name: 'name', includeIfNull: false)
  String? name;

  @JsonKey(name: 'address', includeIfNull: false)
  String? address;

  factory HomeBodyModel.fromJson(Map<String, dynamic> json) => _$HomeBodyModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$HomeBodyModelToJson(this);

  HomeBodyModel({
    this.name,
    this.address,
  });
}
