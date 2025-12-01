import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sixers/backend/auth/app_session.dart';
import 'package:sixers/backend/auth/auth_service.dart';

part 'auth_provider.g.dart';

@Riverpod(keepAlive: true)
class AuthProvider extends _$AuthProvider {
  late final AuthService _authService;
  late AppSession? session; 

  @override
  AppSession? build() {
    _authService = ref.watch(authServiceProvider);

    // Restore existing Cognito session if user already signed in
    _restoreSession(); 

    return null;
  }

  Future<AppSession?> _restoreSession() async {
    final session = await _authService.getCurrentSession();
    if (session != null) {
      state = session;
      this.session = session;
      return session;
    }
    return null;
  }

  // LOGIN
  Future<void> signIn(String email, String password) async {
    final session = await _authService.signIn(email, password);
    state = session;
    this.session = session;
  }

  // SIGNUP (email verification handled outside)
  Future<void> signUp(String email, String password) async {
    await _authService.signUp(email, password);
  }

  // LOGOUT
  Future<void> signOut() async {
    await _authService.signOut();
    state = null;
    session = null;
  }
}



// Provides AuthService as a dependency
final authServiceProvider = Provider<AuthService>((ref) {
  return AuthService();
});

