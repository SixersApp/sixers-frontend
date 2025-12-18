import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sixers/backend/auth/auth_provider.dart';
import 'onboarding_service.dart';
import 'package:sixers/backend/onboarding/profile_model.dart';

part 'onboarding_provider.g.dart';

@riverpod
class OnboardingStage extends _$OnboardingStage {
  late final OnboardingService _service;

  @override
  Future<ProfileModel?> build() async {
    _service = OnboardingService();

    // SAFE AUTH FETCH
    final auth = await ref.watch(authProviderProvider.future);
    if (auth == null || auth.userId.isEmpty) return null;
    final profile = await _service.fetchProfile(auth.userId);
    if (!ref.mounted) return null;
    return profile;
  }

  Future<void> populateProfile() async {
    final auth = await ref.watch(authProviderProvider.future);
    if (auth == null || auth.userId.isEmpty) {
      state = AsyncData(null);
      return;
    }
    final profile = await _service.fetchProfile(auth.userId);
    if (!ref.mounted) {
      state = AsyncData(null);
    }
    state = AsyncData(profile);
  }

  // ---------------------------------------------------------
  // UPDATE BASIC INFO
  // ---------------------------------------------------------
  Future<void> updateProfileInfo({required ProfileModel profileData}) async {
    final auth = await ref.watch(authProviderProvider.future);
    if (!ref.mounted || auth == null || auth.userId.isEmpty) return;

    await _service.updateProfileData(profileData: profileData);
    if (!ref.mounted) return;
    state = AsyncData(profileData);
  }
}
