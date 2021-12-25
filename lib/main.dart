import 'package:beamer/beamer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:price_memo/beamer_locations.dart';
import 'package:price_memo/components/loading.dart';
import 'package:price_memo/gen/firebase_options.dart';
import 'package:price_memo/providers/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setUrlStrategy(PathUrlStrategy());
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends HookConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// this is required so the `BeamGuard` checks can be rechecked on
    /// auth state changes
    var value = ref.watch(authUserProvider.originProvider);

    return value.when(
      data: (_) => BeamerProvider(
        routerDelegate: routerDelegate,
        child: MaterialApp.router(
          debugShowCheckedModeBanner: true,
          routeInformationParser: BeamerParser(),
          routerDelegate: routerDelegate,
        ),
      ),
      error: (_, __) => Container(),
      loading: () => const MyLoading(),
    );
  }
}
