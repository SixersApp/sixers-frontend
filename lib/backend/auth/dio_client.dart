import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:dio/dio.dart';

class ApiClient {
  static final Dio dio = Dio(
    BaseOptions(
      baseUrl: "https://r8bg7l0ij9.execute-api.us-west-2.amazonaws.com/Prod",
      connectTimeout: Duration(seconds: 10),
      receiveTimeout: Duration(seconds: 10),
      headers: {"Content-Type": "application/json"},
    ),
  )..interceptors.add(_TokenRefreshInterceptor());

  static void setAuthToken(String? token) {
    if (token == null) {
      dio.options.headers.remove("Authorization");
    } else {
      dio.options.headers["Authorization"] = "Bearer $token";
    }
  }
}

class _TokenRefreshInterceptor extends Interceptor {
  bool _refreshing = false;

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401 && !_refreshing) {
      _refreshing = true;
      try {
        final session = await Amplify.Auth.fetchAuthSession() as CognitoAuthSession;
        final newToken = session.userPoolTokensResult.value.idToken.raw;
        ApiClient.setAuthToken(newToken);

        final opts = err.requestOptions;
        opts.headers['Authorization'] = 'Bearer $newToken';
        final response = await ApiClient.dio.fetch(opts);
        _refreshing = false;
        return handler.resolve(response);
      } catch (_) {
        _refreshing = false;
      }
    }
    return handler.next(err);
  }
}
