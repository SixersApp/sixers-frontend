class AppSession {
  final String userId;      // Cognito "sub" -> app_user.id
  final String email;
  final String idToken;     // for backend auth, if you want
  final String accessToken; // for backend auth
  final bool isOnboarded;   // optional, if you track onboarding

  AppSession({
    required this.userId,
    required this.email,
    required this.idToken,
    required this.accessToken,
    this.isOnboarded = false,
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
      isOnboarded: isOnboarded ?? this.isOnboarded,
    );
  }
}