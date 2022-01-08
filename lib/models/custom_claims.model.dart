import 'package:json_annotation/json_annotation.dart';

part 'custom_claims.model.g.dart';

@JsonSerializable()
class CustomClaims {
  CustomClaims({
    required this.groupIds,
  });

  factory CustomClaims.fromJson(Map<String, dynamic> json) =>
      _$CustomClaimsFromJson(json);

  @JsonKey(defaultValue: [])
  final List<String> groupIds;
}
