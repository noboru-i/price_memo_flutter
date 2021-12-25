import 'package:beamer/beamer.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:flutter/material.dart';
import 'package:price_memo/models/product.model.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen(this.productId, {Key? key}) : super(key: key);

  final String? productId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('product detail'),
        leading: BackButton(
          // TODO: we must change URLs to use `maybePop`(default).
          onPressed: () => Beamer.of(context).beamBack(),
        ),
      ),
      body: _Body(productId),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body(this.productId, {Key? key}) : super(key: key);

  final String? productId;

  @override
  Widget build(BuildContext context) {
    return FirestoreBuilder<ProductDocumentSnapshot>(
      ref: productsRef.doc(productId),
      builder: (context, asyncSnapshot, _) {
        if (asyncSnapshot.hasError) return const Text('error');
        if (!asyncSnapshot.hasData) return const Text('loading');

        final snapshot = asyncSnapshot.data!;
        final product = snapshot.data;
        if (product == null) {
          return const Text('error');
        }

        return Column(
          children: [
            Text('name: ${product.name}'),
            Text('latest price: ${product.latestPrice}'),
          ],
        );
      },
    );
  }
}
