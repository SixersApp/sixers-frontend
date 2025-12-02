import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:dio/dio.dart';
import 'package:sixers/backend/auth/dio_client.dart';
import '../auth/auth_provider.dart';

part 'onboarding_provider.g.dart';

@riverpod
class OnboardingStage extends _$OnboardingStage {
  @override
  Future<int> build() async {
    final authAsync = ref.watch(authProviderProvider);

    // Must wait for authentication to load.
    final session = authAsync.value;
    if (session == null) return 0;

    final userId = session.userId;
    if (userId.isEmpty) return 0;

    try {
      final res = await ApiClient.dio.get("/profile/$userId");

      if (res.statusCode != 200) return 0;

      final value = res.data["onboarding_stage"];

      if (value is int) return value;
      if (value is String) return int.tryParse(value) ?? 0;

      return 0;
    } catch (_) {
      return 0;
    }
  }

  // BASIC INFO UPDATE
  Future<void> updateBasicInfo({
    required String fullName,
    required String country,
    required String dob,
  }) async {
    final session = ref.read(authProviderProvider).value;
    if (session == null) return;

    final userId = session.userId;
    if (userId.isEmpty) return;

    final parsedDob = DateTime.tryParse(dob)?.toIso8601String().split("T")[0];

    await ApiClient.dio.put(
      "/profile/$userId",
      data: {
        "full_name": fullName,
        "country": country,
        "dob": parsedDob,
        "onboarding_stage": 1,
      },
    );

    state = const AsyncData(1);
  }

  // EXPERIENCE
  Future<void> updateExperience(int experience) async {
    final session = ref.read(authProviderProvider).value;
    if (session == null) return;

    final userId = session.userId;
    if (userId.isEmpty) return;

    await ApiClient.dio.put(
      "/profile/$userId",
      data: {
        "experience": experience,
        "onboarding_stage": 2,
      },
    );

    state = const AsyncData(2);
  }

  // ADVANCE STAGE
  Future<void> advanceTo(int nextStage) async {
    final session = ref.read(authProviderProvider).value;
    if (session == null) return;

    final userId = session.userId;
    if (userId.isEmpty) return;

    await ApiClient.dio.put(
      "/profile/$userId",
      data: {"onboarding_stage": nextStage},
    );

    state = AsyncData(nextStage);
  }

  // FETCH PROFILE
  Future<Map<String, dynamic>> fetchProfile() async {
    final session = ref.read(authProviderProvider).value;
    if (session == null) return {};

    final userId = session.userId;
    if (userId.isEmpty) return {};

    try {
      final res = await ApiClient.dio.get("/profile/$userId");

      if (res.statusCode == 200) {
        return {
          "full_name": res.data["full_name"],
          "country": res.data["country"],
          "dob": res.data["dob"],
          "onboarding_stage": res.data["onboarding_stage"],
          "experience": res.data["experience"],
        };
      }
    } catch (e) {
      print("Error fetching profile: $e");
    }

    return {};
  }

  Future<void> complete() => advanceTo(2);
}