// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeDto _$HomeDtoFromJson(Map<String, dynamic> json) => HomeDto(
      name: json['name'] as String? ?? '',
      address: json['address'] as String? ?? '',
    );

Map<String, dynamic> _$HomeDtoToJson(HomeDto instance) => <String, dynamic>{
      'name': instance.name,
      'address': instance.address,
    };
