import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:price_memo/providers/provider.dart';

class LoginScreen extends HookConsumerWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SignInScreen(
      auth: ref.read(authProvider),
      providerConfigs: const [
        EmailProviderConfiguration(),
      ],
    );
  }
}
