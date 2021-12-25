import 'package:beamer/beamer.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
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
        final reference = snapshot.reference;
        if (product == null) {
          return const Text('error');
        }

        return _DetailEditor(product, reference);
      },
    );
  }
}

class _DetailEditor extends HookConsumerWidget {
  _DetailEditor(this.product, this.reference, {Key? key}) : super(key: key);

  final Product product;
  final ProductDocumentReference reference;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productNameController = useTextEditingController(text: product.name);
    final latestPriceController =
        useTextEditingController(text: '${product.latestPrice}');

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: productNameController,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'product name',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text.';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: latestPriceController,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'latest price',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text.';
                }
                if (int.tryParse(value) == null) {
                  return 'Please enter numeric.';
                }
                return null;
              },
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState?.validate() != true) {
                  // has error.
                  return;
                }
                await reference.update(
                  name: productNameController.text,
                  latestPrice: int.parse(latestPriceController.text),
                );
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('Saved!'),
                ));
              },
              child: const Text('Save'),
            ),
          ),
        ],
      ),
    );
  }
}
