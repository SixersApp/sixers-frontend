// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'roster_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$teamContentDataHash() => r'fb26421046fd428e2c1bd1bd36f654e17edf710b';

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

/// See also [teamContentData].
@ProviderFor(teamContentData)
const teamContentDataProvider = TeamContentDataFamily();

/// See also [teamContentData].
class TeamContentDataFamily extends Family<AsyncValue<TeamContentData>> {
  /// See also [teamContentData].
  const TeamContentDataFamily();

  /// See also [teamContentData].
  TeamContentDataProvider call(League league) {
    return TeamContentDataProvider(league);
  }

  @override
  TeamContentDataProvider getProviderOverride(
    covariant TeamContentDataProvider provider,
  ) {
    return call(provider.league);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'teamContentDataProvider';
}

/// See also [teamContentData].
class TeamContentDataProvider
    extends AutoDisposeFutureProvider<TeamContentData> {
  /// See also [teamContentData].
  TeamContentDataProvider(League league)
    : this._internal(
        (ref) => teamContentData(ref as TeamContentDataRef, league),
        from: teamContentDataProvider,
        name: r'teamContentDataProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$teamContentDataHash,
        dependencies: TeamContentDataFamily._dependencies,
        allTransitiveDependencies:
            TeamContentDataFamily._allTransitiveDependencies,
        league: league,
      );

  TeamContentDataProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.league,
  }) : super.internal();

  final League league;

  @override
  Override overrideWith(
    FutureOr<TeamContentData> Function(TeamContentDataRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: TeamContentDataProvider._internal(
        (ref) => create(ref as TeamContentDataRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        league: league,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<TeamContentData> createElement() {
    return _TeamContentDataProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TeamContentDataProvider && other.league == league;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, league.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin TeamContentDataRef on AutoDisposeFutureProviderRef<TeamContentData> {
  /// The parameter `league` of this provider.
  League get league;
}

class _TeamContentDataProviderElement
    extends AutoDisposeFutureProviderElement<TeamContentData>
    with TeamContentDataRef {
  _TeamContentDataProviderElement(super.provider);

  @override
  League get league => (origin as TeamContentDataProvider).league;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
