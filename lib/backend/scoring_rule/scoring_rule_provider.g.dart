// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scoring_rule_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$scoringRulesHash() => r'6c5435f61b40950eb48ca0e5cc4362bb80c094a9';

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

abstract class _$ScoringRules
    extends BuildlessAutoDisposeAsyncNotifier<List<ScoringRule>> {
  late final String? leagueId;

  FutureOr<List<ScoringRule>> build({String? leagueId});
}

/// See also [ScoringRules].
@ProviderFor(ScoringRules)
const scoringRulesProvider = ScoringRulesFamily();

/// See also [ScoringRules].
class ScoringRulesFamily extends Family<AsyncValue<List<ScoringRule>>> {
  /// See also [ScoringRules].
  const ScoringRulesFamily();

  /// See also [ScoringRules].
  ScoringRulesProvider call({String? leagueId}) {
    return ScoringRulesProvider(leagueId: leagueId);
  }

  @override
  ScoringRulesProvider getProviderOverride(
    covariant ScoringRulesProvider provider,
  ) {
    return call(leagueId: provider.leagueId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'scoringRulesProvider';
}

/// See also [ScoringRules].
class ScoringRulesProvider
    extends
        AutoDisposeAsyncNotifierProviderImpl<ScoringRules, List<ScoringRule>> {
  /// See also [ScoringRules].
  ScoringRulesProvider({String? leagueId})
    : this._internal(
        () => ScoringRules()..leagueId = leagueId,
        from: scoringRulesProvider,
        name: r'scoringRulesProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$scoringRulesHash,
        dependencies: ScoringRulesFamily._dependencies,
        allTransitiveDependencies:
            ScoringRulesFamily._allTransitiveDependencies,
        leagueId: leagueId,
      );

  ScoringRulesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.leagueId,
  }) : super.internal();

  final String? leagueId;

  @override
  FutureOr<List<ScoringRule>> runNotifierBuild(
    covariant ScoringRules notifier,
  ) {
    return notifier.build(leagueId: leagueId);
  }

  @override
  Override overrideWith(ScoringRules Function() create) {
    return ProviderOverride(
      origin: this,
      override: ScoringRulesProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<ScoringRules, List<ScoringRule>>
  createElement() {
    return _ScoringRulesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ScoringRulesProvider && other.leagueId == leagueId;
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
mixin ScoringRulesRef
    on AutoDisposeAsyncNotifierProviderRef<List<ScoringRule>> {
  /// The parameter `leagueId` of this provider.
  String? get leagueId;
}

class _ScoringRulesProviderElement
    extends
        AutoDisposeAsyncNotifierProviderElement<ScoringRules, List<ScoringRule>>
    with ScoringRulesRef {
  _ScoringRulesProviderElement(super.provider);

  @override
  String? get leagueId => (origin as ScoringRulesProvider).leagueId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
