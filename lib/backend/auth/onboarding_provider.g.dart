// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'onboarding_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$onboardingStageHash() => r'1eaa58b0f9daac8d5d0cd75632d60e5567044bbb';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$OnboardingStage
    extends BuildlessAutoDisposeAsyncNotifier<int> {
  late final String userId;

  FutureOr<int> build(String userId);
}

/// Represents the user's onboarding stage.
/// 0 => Basic Info, 1 => Experience, >=2 => Done
///
/// Copied from [OnboardingStage].
@ProviderFor(OnboardingStage)
const onboardingStageProvider = OnboardingStageFamily();

/// Represents the user's onboarding stage.
/// 0 => Basic Info, 1 => Experience, >=2 => Done
///
/// Copied from [OnboardingStage].
class OnboardingStageFamily extends Family<AsyncValue<int>> {
  /// Represents the user's onboarding stage.
  /// 0 => Basic Info, 1 => Experience, >=2 => Done
  ///
  /// Copied from [OnboardingStage].
  const OnboardingStageFamily();

  /// Represents the user's onboarding stage.
  /// 0 => Basic Info, 1 => Experience, >=2 => Done
  ///
  /// Copied from [OnboardingStage].
  OnboardingStageProvider call(String userId) {
    return OnboardingStageProvider(userId);
  }

  @override
  OnboardingStageProvider getProviderOverride(
    covariant OnboardingStageProvider provider,
  ) {
    return call(provider.userId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'onboardingStageProvider';
}

/// Represents the user's onboarding stage.
/// 0 => Basic Info, 1 => Experience, >=2 => Done
///
/// Copied from [OnboardingStage].
class OnboardingStageProvider
    extends AutoDisposeAsyncNotifierProviderImpl<OnboardingStage, int> {
  /// Represents the user's onboarding stage.
  /// 0 => Basic Info, 1 => Experience, >=2 => Done
  ///
  /// Copied from [OnboardingStage].
  OnboardingStageProvider(String userId)
    : this._internal(
        () => OnboardingStage()..userId = userId,
        from: onboardingStageProvider,
        name: r'onboardingStageProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$onboardingStageHash,
        dependencies: OnboardingStageFamily._dependencies,
        allTransitiveDependencies:
            OnboardingStageFamily._allTransitiveDependencies,
        userId: userId,
      );

  OnboardingStageProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.userId,
  }) : super.internal();

  final String userId;

  @override
  FutureOr<int> runNotifierBuild(covariant OnboardingStage notifier) {
    return notifier.build(userId);
  }

  @override
  Override overrideWith(OnboardingStage Function() create) {
    return ProviderOverride(
      origin: this,
      override: OnboardingStageProvider._internal(
        () => create()..userId = userId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        userId: userId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<OnboardingStage, int>
  createElement() {
    return _OnboardingStageProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is OnboardingStageProvider && other.userId == userId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin OnboardingStageRef on AutoDisposeAsyncNotifierProviderRef<int> {
  /// The parameter `userId` of this provider.
  String get userId;
}

class _OnboardingStageProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<OnboardingStage, int>
    with OnboardingStageRef {
  _OnboardingStageProviderElement(super.provider);

  @override
  String get userId => (origin as OnboardingStageProvider).userId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
