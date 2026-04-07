import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sixers/backend/auth/app_session.dart';
import 'package:sixers/backend/auth/auth_service.dart';
import 'package:sixers/backend/auth/dio_client.dart';
import 'package:sixers/utils/logger.dart';

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

  /// Sign in after confirmSignUp, handling the case where Cognito may or may not
  /// have auto-signed the user in.
  Future<void> signInAfterVerification(String email, String password) async {
    // Check if Cognito already signed us in
    var session = await _authService.getCurrentSession();
    logDebug("signInAfterVerification: existing session=${session != null ? 'found' : 'null'}");

    if (session == null) {
      // Not auto-signed in — sign in explicitly (without firstTime to skip initUserInBackend)
      try {
        session = await _authService.signIn(email, password, false);
      } on String catch (e) {
        if (e.contains('already signed in')) {
          await _authService.signOut();
          session = await _authService.signIn(email, password, false);
        } else {
          rethrow;
        }
      }
    }

    // Set auth state FIRST so the router can redirect regardless of backend init
    state = AsyncData(session);

    // Then try to init the backend user — don't block auth on this
    if (session != null) {
      try {
        await _authService.initUserInBackend(session);
      } catch (e) {
        logError("initUserInBackend failed (non-blocking): $e");
      }
    }
  }

  // SIGNUP (email verification handled separately)
  Future<void> signUp(String email, String password) async {
    await _authService.signUp(email, password);
  }

  Future<void> signInWithGoogle() async {
    final session = await _authService.signInWithGoogle();
    state = AsyncData(session);
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
