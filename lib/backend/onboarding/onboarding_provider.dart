import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sixers/backend/auth/auth_provider.dart';
import 'onboarding_service.dart';

part 'onboarding_provider.g.dart';

@riverpod
class OnboardingStage extends _$OnboardingStage {
  late final OnboardingService _service;

  @override
  Future<int> build() async {
    _service = OnboardingService();

    // SAFE AUTH FETCH
    final auth = await ref.watch(authProviderProvider.future);
    if (auth == null || auth.userId.isEmpty) return 0;

    final stage = await _service.fetchStage(auth.userId);

    if (!ref.mounted) return 0;

    return stage;
  }

  // ---------------------------------------------------------
  // UPDATE BASIC INFO
  // ---------------------------------------------------------
  Future<void> updateBasicInfo({
    required String fullName,
    required String country,
    required String dob,
  }) async {
    // ❗ MUST use .future here
    final auth = await ref.watch(authProviderProvider.future);
    if (!ref.mounted || auth == null || auth.userId.isEmpty) return;

    await _service.updateBasicInfo(
      userId: auth.userId,
      fullName: fullName,
      country: country,
      dob: dob,
    );

    if (!ref.mounted) return;

    state = const AsyncData(1);
  }

  // ---------------------------------------------------------
  // UPDATE EXPERIENCE
  // ---------------------------------------------------------
  Future<void> updateExperience(int experience) async {
    final auth = await ref.watch(authProviderProvider.future);
    if (!ref.mounted || auth == null || auth.userId.isEmpty) return;

    await _service.updateExperience(
      userId: auth.userId,
      experience: experience,
    );

    if (!ref.mounted) return;

    state = const AsyncData(2);
  }

  // ---------------------------------------------------------
  // ADVANCE STAGE
  // ---------------------------------------------------------
  Future<void> advanceTo(int nextStage) async {
    final auth = await ref.watch(authProviderProvider.future);
    if (!ref.mounted || auth == null || auth.userId.isEmpty) return;

    await _service.updateStage(
      userId: auth.userId,
      stage: nextStage,
    );

    if (!ref.mounted) return;

    state = AsyncData(nextStage);
  }

  // ---------------------------------------------------------
  // FETCH PROFILE
  // ---------------------------------------------------------
  Future<Map<String, dynamic>> fetchProfile() async {
    final auth = await ref.watch(authProviderProvider.future);
    if (!ref.mounted || auth == null || auth.userId.isEmpty) {
      return {};
    }

    final data = await _service.fetchProfile(auth.userId);

    if (!ref.mounted) return {};

    return data;
  }

  Future<void> complete() => advanceTo(2);
}