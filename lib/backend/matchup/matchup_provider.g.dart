// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'matchup_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$matchupsHash() => r'b48fb097554daecc764463671745a7836086d0a6';

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

abstract class _$Matchups
    extends BuildlessAutoDisposeAsyncNotifier<List<Matchup>> {
  late final String? leagueId;

  FutureOr<List<Matchup>> build({String? leagueId});
}

/// See also [Matchups].
@ProviderFor(Matchups)
const matchupsProvider = MatchupsFamily();

/// See also [Matchups].
class MatchupsFamily extends Family<AsyncValue<List<Matchup>>> {
  /// See also [Matchups].
  const MatchupsFamily();

  /// See also [Matchups].
  MatchupsProvider call({String? leagueId}) {
    return MatchupsProvider(leagueId: leagueId);
  }

  @override
  MatchupsProvider getProviderOverride(covariant MatchupsProvider provider) {
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
  String? get name => r'matchupsProvider';
}

/// See also [Matchups].
class MatchupsProvider
    extends AutoDisposeAsyncNotifierProviderImpl<Matchups, List<Matchup>> {
  /// See also [Matchups].
  MatchupsProvider({String? leagueId})
    : this._internal(
        () => Matchups()..leagueId = leagueId,
        from: matchupsProvider,
        name: r'matchupsProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$matchupsHash,
        dependencies: MatchupsFamily._dependencies,
        allTransitiveDependencies: MatchupsFamily._allTransitiveDependencies,
        leagueId: leagueId,
      );

  MatchupsProvider._internal(
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
  FutureOr<List<Matchup>> runNotifierBuild(covariant Matchups notifier) {
    return notifier.build(leagueId: leagueId);
  }

  @override
  Override overrideWith(Matchups Function() create) {
    return ProviderOverride(
      origin: this,
      override: MatchupsProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<Matchups, List<Matchup>>
  createElement() {
    return _MatchupsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MatchupsProvider && other.leagueId == leagueId;
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
mixin MatchupsRef on AutoDisposeAsyncNotifierProviderRef<List<Matchup>> {
  /// The parameter `leagueId` of this provider.
  String? get leagueId;
}

class _MatchupsProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<Matchups, List<Matchup>>
    with MatchupsRef {
  _MatchupsProviderElement(super.provider);

  @override
  String? get leagueId => (origin as MatchupsProvider).leagueId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
