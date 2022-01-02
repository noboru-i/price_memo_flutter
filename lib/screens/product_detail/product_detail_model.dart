import 'dart:typed_data';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:price_memo/models/product.model.dart';

part 'product_detail_model.freezed.dart';

@freezed
abstract class ProductDetailModel with _$ProductDetailModel {
  factory ProductDetailModel({
    required String productId,
    AsyncValue<ProductDocumentSnapshot>? snapshot,
    XFile? file,
    AsyncValue<Uint8List?>? imageData,
  }) = _ProductDetailModel;
}
