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
    extends $AsyncNotifierProvider<OnboardingStage, int> {
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

String _$onboardingStageHash() => r'3b33a983b802b2c4f8d67ac4641525b7a90254c5';

abstract class _$OnboardingStage extends $AsyncNotifier<int> {
  FutureOr<int> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<int>, int>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<int>, int>,
              AsyncValue<int>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
