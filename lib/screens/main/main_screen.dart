import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:price_memo/providers/provider.dart';

class MainScreen extends HookConsumerWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var user = ref.watch(authProvider).currentUser;
    return Scaffold(
      appBar: AppBar(
        title: const Text('title'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
          ],
        ),
      ),
    );
  }
}
