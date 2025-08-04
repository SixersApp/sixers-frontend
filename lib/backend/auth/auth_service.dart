import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  final _client = Supabase.instance.client;

  /// Get current user (if signed in)
  User? get currentUser => _client.auth.currentUser;

  /// Sign up (email + password)
  Future<AuthResponse> signUp(String email, String password) async {
    return await _client.auth.signUp(email: email, password: password);
  }

  /// Sign in (email + password)
  Future<AuthResponse> signIn(String email, String password) async {
    return await _client.auth.signInWithPassword(
      email: email,
      password: password,
    );
  }

  /// Sign out
  Future<void> signOut() async {
    await _client.auth.signOut();
  }

  /// Listen for auth state changes
  Stream<AuthState> get authStateChanges => _client.auth.onAuthStateChange;
}
