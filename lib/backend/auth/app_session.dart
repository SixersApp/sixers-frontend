class AppSession {
  final String userId; // Cognito "sub" -> app_user.id
  final String email;
  final String idToken; // for backend auth, if you want
  final String accessToken; // for backend auth

  AppSession({
    required this.userId,
    required this.email,
    required this.idToken,
    required this.accessToken,
  });

  AppSession copyWith({
    String? userId,
    String? email,
    String? idToken,
    String? accessToken,
    bool? isOnboarded,
  }) {
    return AppSession(
      userId: userId ?? this.userId,
      email: email ?? this.email,
      idToken: idToken ?? this.idToken,
      accessToken: accessToken ?? this.accessToken,
    );
  }
}
