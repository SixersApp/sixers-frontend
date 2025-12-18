// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'onboarding_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(OnboardingStage)
const onboardingStageProvider = OnboardingStageProvider._();

final class OnboardingStageProvider
    extends $AsyncNotifierProvider<OnboardingStage, ProfileModel?> {
  const OnboardingStageProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'onboardingStageProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$onboardingStageHash();

  @$internal
  @override
  OnboardingStage create() => OnboardingStage();
}

String _$onboardingStageHash() => r'4e9a0bd3ddf7ce50d1791feb96d9211bc015e59b';

abstract class _$OnboardingStage extends $AsyncNotifier<ProfileModel?> {
  FutureOr<ProfileModel?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<ProfileModel?>, ProfileModel?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<ProfileModel?>, ProfileModel?>,
              AsyncValue<ProfileModel?>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
