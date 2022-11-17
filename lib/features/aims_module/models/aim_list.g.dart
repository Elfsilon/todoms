// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aim_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AimList _$AimListFromJson(Map<String, dynamic> json) => AimList(
      (json['items'] as List<dynamic>)
          .map((e) => Aim.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AimListToJson(AimList instance) => <String, dynamic>{
      'items': instance.items.map((e) => e.toJson()).toList(),
    };
