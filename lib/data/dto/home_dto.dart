import 'package:json_annotation/json_annotation.dart';

part 'home_dto.g.dart';

@JsonSerializable()
class HomeDto {
  @JsonKey(name: 'name', defaultValue: '')
  String name;

  @JsonKey(name: 'address', defaultValue: '')
  String address;

  factory HomeDto.fromJson(Map<String, dynamic> json) => _$HomeDtoFromJson(json);

  Map<String, dynamic> toJson() => _$HomeDtoToJson(this);

  HomeDto({
    required this.name,
    required this.address,
  });
}
