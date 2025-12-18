import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:sixers/backend/auth/dio_client.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart' as cognito;
import 'app_session.dart';

class AuthService {
  Future<AppSession?> getCurrentSession() async {
    try {
      final session = await Amplify.Auth.fetchAuthSession();
      if (!session.isSignedIn) {
        return null;
      }

      final appSession = await _buildSessionFromCognito();

      // ✅ IMPORTANT: set token on restore too
      ApiClient.setAuthToken(appSession.idToken);

      return appSession;
    } on AuthException catch (e) {
      return null;
    } catch (_) {
      return null;
    }
  }

  Future<AppSession?> signIn(String email, String password, bool firstTime) async {
    try {final result = await Amplify.Auth.signIn(
      username: email,
      password: password,
    );

      if (!result.isSignedIn) return null;

      final appSession = await _buildSessionFromCognito();
      ApiClient.setAuthToken(appSession.idToken);

      print(appSession.userId);
      printIdToken(appSession.idToken);

      if (firstTime){
        initUserInBackend(appSession);
      }
      return appSession;
    } on AuthException catch (e) {
      throw e.message;
    } catch (_) {
      throw "Something went wrong. Please try again later";
    }
  }
  

  void printIdToken(String idToken) {
    final text = idToken;
    const chunkSize = 800;
    for (var i = 0; i < text.length; i += chunkSize) {
      print(
        text.substring(
          i,
          i + chunkSize > text.length ? text.length : i + chunkSize,
        ),
      );
    }
    
  }

  Future<AppSession?> signInWithGoogle() async {
    try {
      final result = await Amplify.Auth.signInWithWebUI(
        provider: cognito.AuthProvider.google,
      );

      if (!result.isSignedIn) return null;

      final appSession = await _buildSessionFromCognito();
      ApiClient.setAuthToken(appSession.idToken);
      printIdToken(appSession.idToken);

      initUserInBackend(appSession);

      return appSession;
    } on AuthException catch (e) {
      throw e.message;
    } catch (e) {
      throw "Something went wrong. Please try again later";
    }
  }

  Future<void> signUp(String email, String password) async {
    try {
      await Amplify.Auth.signUp(
        username: email,
        password: password,
        options: SignUpOptions(
          userAttributes: {AuthUserAttributeKey.email: email},
        ),
      );
    } on AuthException catch (e) {
      throw e.message;
    } catch (_) {
      throw "Something went wrong. Please try again later";
    }
  }

  Future<void> signOut() async {
    await Amplify.Auth.signOut();
    ApiClient.setAuthToken(null);
  }

  Future<AppSession> _buildSessionFromCognito() async {
    final authSession =
        await Amplify.Auth.fetchAuthSession() as CognitoAuthSession;

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
    await ApiClient.dio.put("/users/auth/signup", data: {
      "email": session.email
    });
  }
}
