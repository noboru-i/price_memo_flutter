import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:price_memo/models/product.model.dart';
import 'package:price_memo/providers/auth_provider.dart';
import 'package:price_memo/providers/storage_provider.dart';
import 'package:price_memo/screens/product_detail/product_detail_model.dart';
import 'dart:async';

class ProductDetailNotifier
    extends StateNotifier<AsyncValue<ProductDetailModel>> {
  ProductDetailNotifier(this.productId, this._ref)
      : _storageRepository = _ref.read(storageRepositoryProvider),
        super(_ref.watch(_initialDataProvider(productId)));

  final String productId;
  final AutoDisposeRef _ref;
  final StorageRepository _storageRepository;

  void setFile(XFile file) {
    final data = state.asData?.value;
    if (data == null) {
      return;
    }
    state = AsyncData(data.copyWith(
      file: file,
    ));
  }

  void reload() {
    _ref.refresh(_initialDataProvider(productId));
  }

  Future<void> save(
    BuildContext context,
    Reader reader, {
    required GlobalKey<FormState> formKey,
    required String name,
    required String latestPriceString,
  }) async {
    final data = state.asData?.value.snapshot;
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
      imagePath: takeSnapshot?.ref.fullPath ?? data.data!.imagePath,
      groupId: data.data!.groupId,
    );

    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Saved!'),
    ));
  }

  Future<TaskSnapshot?> _uploadImage(Reader reader) async {
    final file = state.asData?.value.file;
    if (file == null) {
      // TODO handle error
      return Future.value(null);
    }
    return await _storageRepository.uploadImage(file);
  }
}

final notifier = StateNotifierProvider.autoDispose
    .family<ProductDetailNotifier, AsyncValue<ProductDetailModel>, String>(
        (ref, productId) {
  return ProductDetailNotifier(productId, ref);
});

class _FetchParam {
  _FetchParam({
    required this.groupId,
    required this.productId,
  });

  String groupId;
  String productId;
}

final _fetchProvider = FutureProvider.autoDispose
    .family<ProductDocumentSnapshot, _FetchParam>((ref, param) async {
  final response =
      await groupsRef.doc(param.groupId).products.doc(param.productId).get();
  ref.maintainState = true;
  return response;
});

final _initialDataProvider = FutureProvider.autoDispose
    .family<ProductDetailModel, String>((ref, productId) async {
  final claims = ref.watch(customClaimProvider).value;
  final groupId =
      (claims?.groupIds.length ?? 0) > 0 ? claims?.groupIds[0] : null;
  if (groupId == null) {
    // return empty data
    return ProductDetailModel(productId: productId);
  }

  final snapshot = await ref.watch(_fetchProvider(_FetchParam(
    groupId: groupId,
    productId: productId,
  )).future);
  // TODO: 画像表示コンポーネント側に、解決を任せるか？
  final imagePath = snapshot.data?.imagePath;
  final imageData =
      imagePath == null ? null : ref.read(downloadImageProvider(imagePath));

  return ProductDetailModel(
    productId: productId,
    snapshot: snapshot,
    imageData: imageData,
  );
});
