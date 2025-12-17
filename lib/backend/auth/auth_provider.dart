import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sixers/backend/auth/app_session.dart';
import 'package:sixers/backend/auth/auth_service.dart';

part 'auth_provider.g.dart';

@Riverpod(keepAlive: true)
class AuthProvider extends _$AuthProvider {
  late final AuthService _authService;

  @override
  Future<AppSession?> build() async {
    _authService = ref.watch(authServiceProvider);

    // Wait for Cognito session BEFORE returning the provider value.
    final session = await _authService.getCurrentSession();

    return session; // <-- critical fix
  }

  // LOGIN
  Future<void> signIn(String email, String password, bool firstTime) async {
    final session = await _authService.signIn(email, password, firstTime);
    state = AsyncData(session);
  }

  // SIGNUP (email verification handled separately)
  Future<void> signUp(String email, String password) async {
    await _authService.signUp(email, password);
  }

  // LOGOUT
  Future<void> signOut() async {
    await _authService.signOut();
    state = const AsyncData(null);
  }
}

final authServiceProvider = Provider<AuthService>((ref) {
  return AuthService();
});