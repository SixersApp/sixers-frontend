import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sixers/views/auth/sign_in_screen.dart';

part 'g_auth_origin_provider.g.dart';

@Riverpod(keepAlive: true)
class GAuthOrigin extends _$GAuthOrigin {
  
  @override
  String build() {
    return SignInScreen.route;
  }
  
  void changeOrigin(String path) {
    state = path;
  }
}