import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:price_memo/models/product.model.dart';
import 'package:price_memo/providers/storage_provider.dart';
import 'package:price_memo/screens/product_detail/product_detail_model.dart';

class ProductDetailNotifier extends StateNotifier<ProductDetailModel> {
  ProductDetailNotifier(this.productId, this._ref)
      : _storageRepository = _ref.read(storageRepositoryProvider),
        super(ProductDetailModel(productId: productId)) {
    _fetch();
  }

  final String productId;
  final AutoDisposeRef _ref;
  final StorageRepository _storageRepository;

  Future<void> _fetch() async {
    final snapshot = _ref.watch(_fetchProvider(productId));
    state = state.copyWith(
      snapshot: snapshot,
    );

    final imagePath = snapshot.asData?.value.data?.imagePath;
    if (imagePath != null) {
      final imageSnapshot = _ref.watch(_fetchImageProvider(imagePath));
      state = state.copyWith(
        imageData: imageSnapshot,
      );
    }
  }

  void setFile(XFile file) {
    state = state.copyWith(file: file);
  }

  Future<void> save(
    BuildContext context,
    Reader reader, {
    required GlobalKey<FormState> formKey,
    required String name,
    required String latestPriceString,
  }) async {
    final data = state.snapshot?.value;
    if (data == null) {
      return;
    }
    if (formKey.currentState?.validate() != true) {
      // has error.
      return;
    }

    final takeSnapshot = await _uploadImage(reader);
    await data.reference.update(
      name: name,
      latestPrice: int.parse(latestPriceString),
      imagePath: takeSnapshot?.ref.fullPath,
    );

    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Saved!'),
    ));
  }

  Future<TaskSnapshot?> _uploadImage(Reader reader) async {
    final file = state.file;
    if (file == null) {
      // TODO handle error
      return Future.value(null);
    }
    return await _storageRepository.uploadImage(file);
  }
}

final notifier = StateNotifierProvider.autoDispose
    .family<ProductDetailNotifier, ProductDetailModel, String>(
        (ref, productId) {
  return ProductDetailNotifier(productId, ref);
});

final _fetchProvider = FutureProvider.autoDispose
    .family<ProductDocumentSnapshot, String>((ref, productId) async {
  return productsRef.doc(productId).get();
});

final _fetchImageProvider =
    FutureProvider.autoDispose.family<Uint8List?, String>((ref, url) async {
  final storageRepository = ref.read(storageRepositoryProvider);
  return storageRepository.downloadImage(url);
});
