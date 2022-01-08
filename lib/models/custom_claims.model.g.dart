// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_claims.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomClaims _$CustomClaimsFromJson(Map<String, dynamic> json) => CustomClaims(
      groupIds: (json['groupIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
    );

Map<String, dynamic> _$CustomClaimsToJson(CustomClaims instance) =>
    <String, dynamic>{
      'groupIds': instance.groupIds,
    };
