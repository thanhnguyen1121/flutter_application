// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_body_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeBodyModel _$HomeBodyModelFromJson(Map<String, dynamic> json) =>
    HomeBodyModel(
      name: json['name'] as String?,
      address: json['address'] as String?,
    );

Map<String, dynamic> _$HomeBodyModelToJson(HomeBodyModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('address', instance.address);
  return val;
}
