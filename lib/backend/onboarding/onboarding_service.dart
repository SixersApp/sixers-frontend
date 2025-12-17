import 'package:dio/dio.dart';
import 'package:sixers/backend/auth/dio_client.dart';

class OnboardingService {
  final Dio _dio = ApiClient.dio;

  Future<int> fetchStage(String userId) async {
    final res = await _dio.get("/profile/$userId");
    if (res.statusCode != 200) return 0;

    final value = res.data["onboarding_stage"];
    if (value is int) return value;
    if (value is String) return int.tryParse(value) ?? 0;

    return 0;
  }

  Future<void> updateBasicInfo({
    required String userId,
    required String fullName,
    required String country,
    required String dob,
  }) async {
    final parsedDob = DateTime.tryParse(dob)
        ?.toIso8601String()
        .split("T")[0];

    await _dio.put(
      "/profile/$userId",
      data: {
        "full_name": fullName,
        "country": country,
        "dob": parsedDob,
        "onboarding_stage": 1,
      },
    );
  }

  Future<void> updateExperience({
    required String userId,
    required int experience,
  }) async {
    await _dio.put(
      "/profile/$userId",
      data: {
        "experience": experience,
        "onboarding_stage": 2,
      },
    );
  }

  Future<void> updateStage({
    required String userId,
    required int stage,
  }) async {
    await _dio.put(
      "/profile/$userId",
      data: {"onboarding_stage": stage},
    );
  }

  Future<Map<String, dynamic>> fetchProfile(String userId) async {
    final res = await _dio.get("/users/profile");
    if (res.statusCode != 200) return {};

    return {
      "full_name": res.data["full_name"],
      "country": res.data["country"],
      "dob": res.data["dob"],
      "onboarding_stage": res.data["onboarding_stage"],
      "experience": res.data["experience"],
    };
  }
}