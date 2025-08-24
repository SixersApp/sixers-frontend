// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scoring_rule_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$scoringRuleServiceHash() =>
    r'becfe86c660ade2a11104c7f8730784d24afa8fe';

/// See also [scoringRuleService].
@ProviderFor(scoringRuleService)
final scoringRuleServiceProvider = Provider<ScoringRuleService>.internal(
  scoringRuleService,
  name: r'scoringRuleServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$scoringRuleServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ScoringRuleServiceRef = ProviderRef<ScoringRuleService>;
String _$defaultScoringRulesHash() =>
    r'da8090464e7a64da368ba23104eecb93d2666308';

/// Defaults (league_id IS NULL)
///
/// Copied from [defaultScoringRules].
@ProviderFor(defaultScoringRules)
final defaultScoringRulesProvider =
    AutoDisposeFutureProvider<List<ScoringRule>>.internal(
      defaultScoringRules,
      name: r'defaultScoringRulesProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$defaultScoringRulesHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef DefaultScoringRulesRef =
    AutoDisposeFutureProviderRef<List<ScoringRule>>;
String _$scoringRulesByLeagueHash() =>
    r'681732f725b46adc1f117e469f74b2f2a4506442';

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

/// Full league rules (materialized copy)
///
/// Copied from [scoringRulesByLeague].
@ProviderFor(scoringRulesByLeague)
const scoringRulesByLeagueProvider = ScoringRulesByLeagueFamily();

/// Full league rules (materialized copy)
///
/// Copied from [scoringRulesByLeague].
class ScoringRulesByLeagueFamily extends Family<AsyncValue<List<ScoringRule>>> {
  /// Full league rules (materialized copy)
  ///
  /// Copied from [scoringRulesByLeague].
  const ScoringRulesByLeagueFamily();

  /// Full league rules (materialized copy)
  ///
  /// Copied from [scoringRulesByLeague].
  ScoringRulesByLeagueProvider call(String leagueId) {
    return ScoringRulesByLeagueProvider(leagueId);
  }

  @override
  ScoringRulesByLeagueProvider getProviderOverride(
    covariant ScoringRulesByLeagueProvider provider,
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
  String? get name => r'scoringRulesByLeagueProvider';
}

/// Full league rules (materialized copy)
///
/// Copied from [scoringRulesByLeague].
class ScoringRulesByLeagueProvider
    extends AutoDisposeFutureProvider<List<ScoringRule>> {
  /// Full league rules (materialized copy)
  ///
  /// Copied from [scoringRulesByLeague].
  ScoringRulesByLeagueProvider(String leagueId)
    : this._internal(
        (ref) => scoringRulesByLeague(ref as ScoringRulesByLeagueRef, leagueId),
        from: scoringRulesByLeagueProvider,
        name: r'scoringRulesByLeagueProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$scoringRulesByLeagueHash,
        dependencies: ScoringRulesByLeagueFamily._dependencies,
        allTransitiveDependencies:
            ScoringRulesByLeagueFamily._allTransitiveDependencies,
        leagueId: leagueId,
      );

  ScoringRulesByLeagueProvider._internal(
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
  Override overrideWith(
    FutureOr<List<ScoringRule>> Function(ScoringRulesByLeagueRef provider)
    create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ScoringRulesByLeagueProvider._internal(
        (ref) => create(ref as ScoringRulesByLeagueRef),
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
  AutoDisposeFutureProviderElement<List<ScoringRule>> createElement() {
    return _ScoringRulesByLeagueProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ScoringRulesByLeagueProvider && other.leagueId == leagueId;
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
mixin ScoringRulesByLeagueRef
    on AutoDisposeFutureProviderRef<List<ScoringRule>> {
  /// The parameter `leagueId` of this provider.
  String get leagueId;
}

class _ScoringRulesByLeagueProviderElement
    extends AutoDisposeFutureProviderElement<List<ScoringRule>>
    with ScoringRulesByLeagueRef {
  _ScoringRulesByLeagueProviderElement(super.provider);

  @override
  String get leagueId => (origin as ScoringRulesByLeagueProvider).leagueId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
