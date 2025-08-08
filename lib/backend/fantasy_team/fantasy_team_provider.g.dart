// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fantasy_team_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fantasyTeamsHash() => r'a0001602e1987735bff71fed37385589804963ae';

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

abstract class _$FantasyTeams
    extends BuildlessAutoDisposeAsyncNotifier<List<FantasyTeam>> {
  late final String? leagueId;

  FutureOr<List<FantasyTeam>> build({String? leagueId});
}

/// See also [FantasyTeams].
@ProviderFor(FantasyTeams)
const fantasyTeamsProvider = FantasyTeamsFamily();

/// See also [FantasyTeams].
class FantasyTeamsFamily extends Family<AsyncValue<List<FantasyTeam>>> {
  /// See also [FantasyTeams].
  const FantasyTeamsFamily();

  /// See also [FantasyTeams].
  FantasyTeamsProvider call({String? leagueId}) {
    return FantasyTeamsProvider(leagueId: leagueId);
  }

  @override
  FantasyTeamsProvider getProviderOverride(
    covariant FantasyTeamsProvider provider,
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
  String? get name => r'fantasyTeamsProvider';
}

/// See also [FantasyTeams].
class FantasyTeamsProvider
    extends
        AutoDisposeAsyncNotifierProviderImpl<FantasyTeams, List<FantasyTeam>> {
  /// See also [FantasyTeams].
  FantasyTeamsProvider({String? leagueId})
    : this._internal(
        () => FantasyTeams()..leagueId = leagueId,
        from: fantasyTeamsProvider,
        name: r'fantasyTeamsProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$fantasyTeamsHash,
        dependencies: FantasyTeamsFamily._dependencies,
        allTransitiveDependencies:
            FantasyTeamsFamily._allTransitiveDependencies,
        leagueId: leagueId,
      );

  FantasyTeamsProvider._internal(
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
  FutureOr<List<FantasyTeam>> runNotifierBuild(
    covariant FantasyTeams notifier,
  ) {
    return notifier.build(leagueId: leagueId);
  }

  @override
  Override overrideWith(FantasyTeams Function() create) {
    return ProviderOverride(
      origin: this,
      override: FantasyTeamsProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<FantasyTeams, List<FantasyTeam>>
  createElement() {
    return _FantasyTeamsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FantasyTeamsProvider && other.leagueId == leagueId;
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
mixin FantasyTeamsRef
    on AutoDisposeAsyncNotifierProviderRef<List<FantasyTeam>> {
  /// The parameter `leagueId` of this provider.
  String? get leagueId;
}

class _FantasyTeamsProviderElement
    extends
        AutoDisposeAsyncNotifierProviderElement<FantasyTeams, List<FantasyTeam>>
    with FantasyTeamsRef {
  _FantasyTeamsProviderElement(super.provider);

  @override
  String? get leagueId => (origin as FantasyTeamsProvider).leagueId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
