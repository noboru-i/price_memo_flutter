import 'dart:math';

import 'package:beamer/beamer.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:price_memo/components/image_view.dart';
import 'package:price_memo/components/loading.dart';
import 'package:price_memo/models/product.model.dart';
import 'package:price_memo/providers/auth_provider.dart';
import 'package:price_memo/providers/provider.dart';
import 'package:price_memo/providers/storage_provider.dart';

class MainScreen extends HookConsumerWidget {
  const MainScreen({Key? key}) : super(key: key);

  Future<void> _addProduct(WidgetRef ref) async {
    var random = Random();

    var user = ref.watch(authProvider).currentUser;
    if (user == null) {
      return;
    }
    final claims = ref.watch(customClaimProvider).value;
    final groupId =
        (claims?.groupIds.length ?? 0) > 0 ? claims?.groupIds[0] : null;
    if (groupId == null) {
      throw Exception('groupId is null in _addProduct');
    }

    // TODO: now, generating dummy date.
    var reference = ProductCollectionReference(ref.read(firestoreProvider));
    reference.add(
      Product(
        name: 'sample ' + random.nextInt(100).toString(),
        latestPrice: random.nextInt(50000),
        groupId: groupId,
        imagePath: '', // TODO: if null is set, security rule error.
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authProvider).currentUser;
    final claims = ref.watch(customClaimProvider).value;

    return Scaffold(
      appBar: AppBar(
        title: const Text('product list'),
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            'email: ${user?.email}',
          ),
          SelectableText('claims: ${claims?.groupIds}'),
          const Expanded(
            child: _List(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addProduct(ref);
        },
        backgroundColor: Colors.green,
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _List extends HookConsumerWidget {
  const _List({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final claims = ref.watch(customClaimProvider).value;
    final groupId =
        (claims?.groupIds.length ?? 0) > 0 ? claims?.groupIds[0] : null;
    if (groupId == null) {
      return const MyLoading();
    }
    return FirestoreBuilder<ProductQuerySnapshot>(
      ref: productsRef
          .whereGroupId(isEqualTo: groupId)
          .orderByName(descending: true),
      builder: (context, snapshot, _) {
        if (snapshot.hasError) {
          return Center(
            child: SelectableText(snapshot.error.toString()),
          );
        }

        if (!snapshot.hasData) {
          return const MyLoading();
        }

        final data = snapshot.requireData;

        return ListView.builder(
          itemCount: data.docs.length,
          itemBuilder: (context, index) {
            return _ListItem(
              data.docs[index].data,
              data.docs[index].reference,
            );
          },
        );
      },
    );
  }
}

class _ListItem extends HookConsumerWidget {
  const _ListItem(this.product, this.reference, {Key? key}) : super(key: key);

  final Product product;
  final ProductDocumentReference reference;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imageData = ref.watch(downloadImageProvider(product.imagePath));
    return ListTile(
      title: Text(product.name),
      subtitle: Text('latest price: ${product.latestPrice}'),
      leading: SizedBox(
        width: 64,
        child: ImageView(null, imageData),
      ),
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: () {
          productsRef.doc(reference.id).delete();
        },
      ),
      onTap: () => context.beamToNamed('/products/${reference.id}'),
    );
  }
}
