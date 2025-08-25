// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'draft_settings_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$draftSettingsHash() => r'c1fc2d8f98e9bb47fa8ae3571a228cc804b3b1b8';

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

abstract class _$DraftSettings
    extends BuildlessAutoDisposeAsyncNotifier<model.DraftSettings?> {
  late final String leagueId;

  FutureOr<model.DraftSettings?> build(String leagueId);
}

/// Family provider: fetches draft settings for a given league.
///
/// Copied from [DraftSettings].
@ProviderFor(DraftSettings)
const draftSettingsProvider = DraftSettingsFamily();

/// Family provider: fetches draft settings for a given league.
///
/// Copied from [DraftSettings].
class DraftSettingsFamily extends Family<AsyncValue<model.DraftSettings?>> {
  /// Family provider: fetches draft settings for a given league.
  ///
  /// Copied from [DraftSettings].
  const DraftSettingsFamily();

  /// Family provider: fetches draft settings for a given league.
  ///
  /// Copied from [DraftSettings].
  DraftSettingsProvider call(String leagueId) {
    return DraftSettingsProvider(leagueId);
  }

  @override
  DraftSettingsProvider getProviderOverride(
    covariant DraftSettingsProvider provider,
  ) {
    return call(provider.leagueId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'draftSettingsProvider';
}

/// Family provider: fetches draft settings for a given league.
///
/// Copied from [DraftSettings].
class DraftSettingsProvider
    extends
        AutoDisposeAsyncNotifierProviderImpl<
          DraftSettings,
          model.DraftSettings?
        > {
  /// Family provider: fetches draft settings for a given league.
  ///
  /// Copied from [DraftSettings].
  DraftSettingsProvider(String leagueId)
    : this._internal(
        () => DraftSettings()..leagueId = leagueId,
        from: draftSettingsProvider,
        name: r'draftSettingsProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$draftSettingsHash,
        dependencies: DraftSettingsFamily._dependencies,
        allTransitiveDependencies:
            DraftSettingsFamily._allTransitiveDependencies,
        leagueId: leagueId,
      );

  DraftSettingsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.leagueId,
  }) : super.internal();

  final String leagueId;

  @override
  FutureOr<model.DraftSettings?> runNotifierBuild(
    covariant DraftSettings notifier,
  ) {
    return notifier.build(leagueId);
  }

  @override
  Override overrideWith(DraftSettings Function() create) {
    return ProviderOverride(
      origin: this,
      override: DraftSettingsProvider._internal(
        () => create()..leagueId = leagueId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        leagueId: leagueId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<DraftSettings, model.DraftSettings?>
  createElement() {
    return _DraftSettingsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DraftSettingsProvider && other.leagueId == leagueId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, leagueId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin DraftSettingsRef
    on AutoDisposeAsyncNotifierProviderRef<model.DraftSettings?> {
  /// The parameter `leagueId` of this provider.
  String get leagueId;
}

class _DraftSettingsProviderElement
    extends
        AutoDisposeAsyncNotifierProviderElement<
          DraftSettings,
          model.DraftSettings?
        >
    with DraftSettingsRef {
  _DraftSettingsProviderElement(super.provider);

  @override
  String get leagueId => (origin as DraftSettingsProvider).leagueId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
