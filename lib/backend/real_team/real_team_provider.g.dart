// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'real_team_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$realTeamsHash() => r'6938219b79a9412bd12c7bc0abdea8d1ce1b31d7';

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

abstract class _$RealTeams
    extends BuildlessAutoDisposeAsyncNotifier<List<RealTeam>> {
  late final String? tournamentId;

  FutureOr<List<RealTeam>> build({String? tournamentId});
}

/// See also [RealTeams].
@ProviderFor(RealTeams)
const realTeamsProvider = RealTeamsFamily();

/// See also [RealTeams].
class RealTeamsFamily extends Family<AsyncValue<List<RealTeam>>> {
  /// See also [RealTeams].
  const RealTeamsFamily();

  /// See also [RealTeams].
  RealTeamsProvider call({String? tournamentId}) {
    return RealTeamsProvider(tournamentId: tournamentId);
  }

  @override
  RealTeamsProvider getProviderOverride(covariant RealTeamsProvider provider) {
    return call(tournamentId: provider.tournamentId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'realTeamsProvider';
}

/// See also [RealTeams].
class RealTeamsProvider
    extends AutoDisposeAsyncNotifierProviderImpl<RealTeams, List<RealTeam>> {
  /// See also [RealTeams].
  RealTeamsProvider({String? tournamentId})
    : this._internal(
        () => RealTeams()..tournamentId = tournamentId,
        from: realTeamsProvider,
        name: r'realTeamsProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$realTeamsHash,
        dependencies: RealTeamsFamily._dependencies,
        allTransitiveDependencies: RealTeamsFamily._allTransitiveDependencies,
        tournamentId: tournamentId,
      );

  RealTeamsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.tournamentId,
  }) : super.internal();

  final String? tournamentId;

  @override
  FutureOr<List<RealTeam>> runNotifierBuild(covariant RealTeams notifier) {
    return notifier.build(tournamentId: tournamentId);
  }

  @override
  Override overrideWith(RealTeams Function() create) {
    return ProviderOverride(
      origin: this,
      override: RealTeamsProvider._internal(
        () => create()..tournamentId = tournamentId,
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
  AutoDisposeAsyncNotifierProviderElement<RealTeams, List<RealTeam>>
  createElement() {
    return _RealTeamsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RealTeamsProvider && other.tournamentId == tournamentId;
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
mixin RealTeamsRef on AutoDisposeAsyncNotifierProviderRef<List<RealTeam>> {
  /// The parameter `tournamentId` of this provider.
  String? get tournamentId;
}

class _RealTeamsProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<RealTeams, List<RealTeam>>
    with RealTeamsRef {
  _RealTeamsProviderElement(super.provider);

  @override
  String? get tournamentId => (origin as RealTeamsProvider).tournamentId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
