import 'package:beamer/beamer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:price_memo/providers/provider.dart';
import 'package:price_memo/screens/login/login_screen.dart';
import 'package:price_memo/screens/main/main_screen.dart';
import 'package:price_memo/screens/product_detail/product_detail_screen.dart';

final routerDelegate = BeamerDelegate(
  guards: [
    // unauthorized user is moved to login screen.
    BeamGuard(
      pathPatterns: ['/login'],
      guardNonMatching: true,
      check: (context, state) {
        final container = ProviderScope.containerOf(context, listen: false);
        return container.read(authProvider).currentUser != null;
      },
      beamToNamed: (_, __) => '/login',
    ),
    // authorized user is moved to main screen.
    BeamGuard(
      pathPatterns: ['/login'],
      check: (context, state) {
        final container = ProviderScope.containerOf(context, listen: false);
        return container.read(authProvider).currentUser == null;
      },
      beamToNamed: (_, __) => '/',
    ),
  ],
  locationBuilder: RoutesLocationBuilder(
    routes: {
      '/': (_, __, ___) => const MainScreen(),
      '/login': (context, state, data) => const LoginScreen(),
      '/products/:productId': (_, state, ___) {
        var productId = state.pathParameters['productId'];
        return ProductDetailScreen(productId);
      },
    },
  ),
  initialPath: '/',
);
