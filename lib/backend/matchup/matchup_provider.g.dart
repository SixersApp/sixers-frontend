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

String _$userMatchupsHash() => r'cabde0092f557b2ee6eeca5e5739ee5d2142508a';

abstract class _$UserMatchups
    extends BuildlessAutoDisposeAsyncNotifier<List<Matchup>> {
  late final String? userId;

  FutureOr<List<Matchup>> build({String? userId});
}

/// See also [UserMatchups].
@ProviderFor(UserMatchups)
const userMatchupsProvider = UserMatchupsFamily();

/// See also [UserMatchups].
class UserMatchupsFamily extends Family<AsyncValue<List<Matchup>>> {
  /// See also [UserMatchups].
  const UserMatchupsFamily();

  /// See also [UserMatchups].
  UserMatchupsProvider call({String? userId}) {
    return UserMatchupsProvider(userId: userId);
  }

  @override
  UserMatchupsProvider getProviderOverride(
    covariant UserMatchupsProvider provider,
  ) {
    return call(userId: provider.userId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'userMatchupsProvider';
}

/// See also [UserMatchups].
class UserMatchupsProvider
    extends AutoDisposeAsyncNotifierProviderImpl<UserMatchups, List<Matchup>> {
  /// See also [UserMatchups].
  UserMatchupsProvider({String? userId})
    : this._internal(
        () => UserMatchups()..userId = userId,
        from: userMatchupsProvider,
        name: r'userMatchupsProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$userMatchupsHash,
        dependencies: UserMatchupsFamily._dependencies,
        allTransitiveDependencies:
            UserMatchupsFamily._allTransitiveDependencies,
        userId: userId,
      );

  UserMatchupsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.userId,
  }) : super.internal();

  final String? userId;

  @override
  FutureOr<List<Matchup>> runNotifierBuild(covariant UserMatchups notifier) {
    return notifier.build(userId: userId);
  }

  @override
  Override overrideWith(UserMatchups Function() create) {
    return ProviderOverride(
      origin: this,
      override: UserMatchupsProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<UserMatchups, List<Matchup>>
  createElement() {
    return _UserMatchupsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UserMatchupsProvider && other.userId == userId;
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
mixin UserMatchupsRef on AutoDisposeAsyncNotifierProviderRef<List<Matchup>> {
  /// The parameter `userId` of this provider.
  String? get userId;
}

class _UserMatchupsProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<UserMatchups, List<Matchup>>
    with UserMatchupsRef {
  _UserMatchupsProviderElement(super.provider);

  @override
  String? get userId => (origin as UserMatchupsProvider).userId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
