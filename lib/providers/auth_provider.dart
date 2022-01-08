import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:price_memo/providers/provider.dart';
import 'package:price_memo/models/custom_claims.model.dart';

final customClaimProvider = StreamProvider.autoDispose((ref) {
  final auth = ref.watch(authProvider);
  return auth.authStateChanges().asyncMap<CustomClaims?>((user) async {
    if (user == null) {
      return null;
    }
    final tokenResult = await user.getIdTokenResult();
    return CustomClaims.fromJson(tokenResult.claims ?? {});
  });
});
