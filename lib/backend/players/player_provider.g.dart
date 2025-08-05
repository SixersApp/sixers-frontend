// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$allPlayersHash() => r'2af163b726a6297dd3f9fbb622e54abf88534c24';

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

/// See also [allPlayers].
@ProviderFor(allPlayers)
const allPlayersProvider = AllPlayersFamily();

/// See also [allPlayers].
class AllPlayersFamily extends Family<AsyncValue<List<Player>>> {
  /// See also [allPlayers].
  const AllPlayersFamily();

  /// See also [allPlayers].
  AllPlayersProvider call(String tournamentId) {
    return AllPlayersProvider(tournamentId);
  }

  @override
  AllPlayersProvider getProviderOverride(
    covariant AllPlayersProvider provider,
  ) {
    return call(provider.tournamentId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'allPlayersProvider';
}

/// See also [allPlayers].
class AllPlayersProvider extends AutoDisposeFutureProvider<List<Player>> {
  /// See also [allPlayers].
  AllPlayersProvider(String tournamentId)
    : this._internal(
        (ref) => allPlayers(ref as AllPlayersRef, tournamentId),
        from: allPlayersProvider,
        name: r'allPlayersProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$allPlayersHash,
        dependencies: AllPlayersFamily._dependencies,
        allTransitiveDependencies: AllPlayersFamily._allTransitiveDependencies,
        tournamentId: tournamentId,
      );

  AllPlayersProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.tournamentId,
  }) : super.internal();

  final String tournamentId;

  @override
  Override overrideWith(
    FutureOr<List<Player>> Function(AllPlayersRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AllPlayersProvider._internal(
        (ref) => create(ref as AllPlayersRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        tournamentId: tournamentId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Player>> createElement() {
    return _AllPlayersProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AllPlayersProvider && other.tournamentId == tournamentId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, tournamentId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin AllPlayersRef on AutoDisposeFutureProviderRef<List<Player>> {
  /// The parameter `tournamentId` of this provider.
  String get tournamentId;
}

class _AllPlayersProviderElement
    extends AutoDisposeFutureProviderElement<List<Player>>
    with AllPlayersRef {
  _AllPlayersProviderElement(super.provider);

  @override
  String get tournamentId => (origin as AllPlayersProvider).tournamentId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
