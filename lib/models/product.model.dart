import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';

part 'product.model.g.dart';

@JsonSerializable()
class Group {
  Group({
    required this.name,
  });

  final String name;
}

@JsonSerializable()
class Product {
  Product({
    required this.name,
    required this.latestPrice,
    required this.groupId,
    this.imagePath,
  }) {
    _$assertProduct(this);
  }

  final String name;
  @Min(0)
  final int latestPrice;
  final String groupId;
  @JsonKey(includeIfNull: false)
  final String? imagePath;
}

@Collection<Group>('groups')
@Collection<Product>('groups/*/products')
final groupsRef = GroupCollectionReference();
