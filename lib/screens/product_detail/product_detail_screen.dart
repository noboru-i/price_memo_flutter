import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:price_memo/components/image_view.dart';
import 'package:price_memo/components/loading.dart';
import 'package:price_memo/models/product.model.dart';
import 'package:price_memo/screens/product_detail/product_detail_notifier.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen(this.productId, {Key? key}) : super(key: key);

  final String productId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('product detail'),
      ),
      body: _Body(productId),
    );
  }
}

class _Body extends HookConsumerWidget {
  const _Body(this.productId, {Key? key}) : super(key: key);

  final String productId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(notifier(productId));
    final snapshot = state.snapshot;
    if (snapshot == null) {
      return const MyLoading();
    }
    return snapshot.when(
      data: (ProductDocumentSnapshot data) {
        final product = data.data;
        final reference = data.reference;
        if (product == null) {
          return const Text('error');
        }

        return _DetailEditor(productId, product, reference);
      },
      error: (Object error, StackTrace? stackTrace) {
        return const Text('error');
      },
      loading: () {
        return const MyLoading();
      },
    );
  }
}

class _DetailEditor extends HookConsumerWidget {
  _DetailEditor(
    this.productId,
    this.product,
    this.reference, {
    Key? key,
  }) : super(key: key);

  final String productId;
  final Product product;
  final ProductDocumentReference reference;

  final _formKey = GlobalKey<FormState>();

  Future<void> _pickImage(WidgetRef ref) async {
    final file = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (file == null) {
      return;
    }

    ref.read(notifier(productId).notifier).setFile(file);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productNameController = useTextEditingController(text: product.name);
    final latestPriceController =
        useTextEditingController(text: '${product.latestPrice}');
    final state = ref.watch(notifier(productId));
    final _notifier = ref.watch(notifier(productId).notifier);

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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(children: [
              SizedBox(
                width: 120,
                height: 120,
                child: ImageView(state.file),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: ElevatedButton(
                  onPressed: () => _pickImage(ref),
                  child: const Text('Upload image'),
                ),
              ),
            ]),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () => _notifier.save(
                context,
                ref.read,
                formKey: _formKey,
                name: productNameController.text,
                latestPriceString: latestPriceController.text,
              ),
              child: const Text('Save'),
            ),
          ),
        ],
      ),
    );
  }
}
