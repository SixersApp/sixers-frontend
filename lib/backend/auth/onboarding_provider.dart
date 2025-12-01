import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:dio/dio.dart';
import 'package:sixers/backend/auth/dio_client.dart';
import '../auth/auth_provider.dart';

part 'onboarding_provider.g.dart';

@riverpod
class OnboardingStage extends _$OnboardingStage {
  @override
  Future<int> build() async {
    final session = ref.watch(authProviderProvider);
    if (session == null) return 0;

    final userId = session.userId;
    if (userId.isEmpty) return 0;

    try {
      final res = await ApiClient.dio.get("/profiles/$userId");

      if (res.statusCode != 200) return 0;

      final value = res.data["onboarding_stage"];

      if (value is int) return value;
      if (value is String) return int.tryParse(value) ?? 0;

      return 0;
    } catch (_) {
      return 0;
    }
  }

  /// Update onboarding stage
  Future<void> advanceTo(int nextStage) async {
    final session = ref.read(authProviderProvider);
    if (session == null) return;

    final userId = session.userId;
    if (userId.isEmpty) return;

    await ApiClient.dio.put(
      "/profiles/$userId",
      data: {"onboarding_stage": nextStage},
    );

    state = AsyncData(nextStage);
  }

  Future<void> complete() => advanceTo(2);
}