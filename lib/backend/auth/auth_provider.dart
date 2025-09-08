import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sixers/backend/auth/auth_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'auth_provider.g.dart';

@riverpod
class Auth extends _$Auth {
  final _service = AuthService();

  @override
  User? build() {

    _service.authStateChanges.listen((event) {
      state = event.session?.user;
    });
    return _service.currentUser;
  }

  Future<void> signIn(String email, String password) async {
    await _service.signIn(email, password);
  }

  Future<void> signUp(String email, String password) async {
    print("Signing up with $email");
    final response = await _service.signUp(email, password);
    print("SignUp response: ${response.user}, ${response.session}");
  }

  Future<void> signOut() async {
    await _service.signOut();
  }
}
