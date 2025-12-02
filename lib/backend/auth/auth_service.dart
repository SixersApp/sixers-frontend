import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:flutter/material.dart';
import 'package:sixers/backend/auth/dio_client.dart';
import 'app_session.dart';

class AuthService {
  Future<AppSession?> getCurrentSession() async {
    try {
      final session = await Amplify.Auth.fetchAuthSession();
      if (!session.isSignedIn) return null;

      return await _buildSessionFromCognito();
    } on AuthException {
      return null;
    }
  }

  Future<AppSession> signIn(String email, String password) async {
    final result = await Amplify.Auth.signIn(
      username: email,
      password: password,
    );

    if (!result.isSignedIn) {
      throw Exception('Sign-in not completed');
    }

    final appSession = await _buildSessionFromCognito();
    ApiClient.setAuthToken(appSession.idToken);

    print(appSession.userId);
    final text = appSession.idToken;
    const chunkSize = 800;
    for (var i = 0; i < text.length; i += chunkSize) {
      print(text.substring(i, 
        i + chunkSize > text.length ? text.length : i + chunkSize));
    }

    initUserInBackend(appSession);

    return appSession;
  }

  Future<void> signUp(String email, String password) async {
    await Amplify.Auth.signUp(
      username: email,
      password: password,
      options: SignUpOptions(
        userAttributes: {
          AuthUserAttributeKey.email: email,
        },
      ),
    );
  }

  Future<void> signOut() async {
    await Amplify.Auth.signOut();
  }

  Future<AppSession> _buildSessionFromCognito() async {
    final authSession = await Amplify.Auth.fetchAuthSession()
        as CognitoAuthSession;

    final attributes = await Amplify.Auth.fetchUserAttributes();
    final sub = attributes
        .firstWhere((e) => e.userAttributeKey == CognitoUserAttributeKey.sub)
        .value;

    final email = attributes
        .firstWhere((e) => e.userAttributeKey == CognitoUserAttributeKey.email)
        .value;

    final tokensResult = authSession.userPoolTokensResult;

    final tokens = tokensResult.value;

    final idToken = tokens.idToken.raw;
    final accessToken = tokens.accessToken.raw;


    return AppSession(
      userId: sub,
      email: email,
      idToken: idToken,
      accessToken: accessToken,
    );
  }

  Future<void> initUserInBackend(AppSession session) async {
    final id = session.idToken;   // Cognito user ID

    final email = session.email;  // or from attributes

    // await ApiClient.dio.post("/auth/createUser", data: {
    //   "id": id,
    //   "email": email,
    // });
  }
}