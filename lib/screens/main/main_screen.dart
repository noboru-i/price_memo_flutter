import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:price_memo/components/loading.dart';
import 'package:price_memo/models/product.model.dart';
import 'package:price_memo/providers/provider.dart';

class MainScreen extends HookConsumerWidget {
  const MainScreen({Key? key}) : super(key: key);

  Future<void> _addProduct() async {
    var random = Random();

    // TODO: now, generating dummy date.
    var reference = ProductCollectionReference(FirebaseFirestore.instance);
    reference.add(
      Product(
        name: 'sample ' + random.nextInt(100).toString(),
        latestPrice: random.nextInt(50000),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var user = ref.watch(authProvider).currentUser;
    return Scaffold(
      appBar: AppBar(
        title: const Text('title'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            'email: ${user?.email}',
          ),
          ElevatedButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
            child: const Text("Logout"),
          ),
          const Expanded(
            child: _List(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addProduct();
        },
        backgroundColor: Colors.green,
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _List extends StatelessWidget {
  const _List({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FirestoreBuilder<ProductQuerySnapshot>(
      ref: productsRef.orderByName(descending: true),
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

class _ListItem extends StatelessWidget {
  const _ListItem(this.product, this.reference, {Key? key}) : super(key: key);

  final Product product;
  final ProductDocumentReference reference;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(product.name),
      subtitle: Text('latest price: ${product.latestPrice}'),
      onTap: () => {},
    );
  }
}
