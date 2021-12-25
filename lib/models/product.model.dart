import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';

part 'product.model.g.dart';

@JsonSerializable()
class Product {
  Product({
    required this.name,
    required this.latestPrice,
  }) {
    _$assertProduct(this);
  }

  final String name;
  @Min(0)
  final int latestPrice;
}

@Collection<Product>('products')
final productsRef = ProductCollectionReference();
