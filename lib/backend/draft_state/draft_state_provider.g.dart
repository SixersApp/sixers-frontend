// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'draft_state_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$draftStateStreamHash() => r'36c552cd60509f5fbfb92b047ada51195d8128c9';

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

/// See also [draftStateStream].
@ProviderFor(draftStateStream)
const draftStateStreamProvider = DraftStateStreamFamily();

/// See also [draftStateStream].
class DraftStateStreamFamily extends Family<AsyncValue<DraftState>> {
  /// See also [draftStateStream].
  const DraftStateStreamFamily();

  /// See also [draftStateStream].
  DraftStateStreamProvider call(String leagueId) {
    return DraftStateStreamProvider(leagueId);
  }

  @override
  DraftStateStreamProvider getProviderOverride(
    covariant DraftStateStreamProvider provider,
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
  String? get name => r'draftStateStreamProvider';
}

/// See also [draftStateStream].
class DraftStateStreamProvider extends AutoDisposeStreamProvider<DraftState> {
  /// See also [draftStateStream].
  DraftStateStreamProvider(String leagueId)
    : this._internal(
        (ref) => draftStateStream(ref as DraftStateStreamRef, leagueId),
        from: draftStateStreamProvider,
        name: r'draftStateStreamProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$draftStateStreamHash,
        dependencies: DraftStateStreamFamily._dependencies,
        allTransitiveDependencies:
            DraftStateStreamFamily._allTransitiveDependencies,
        leagueId: leagueId,
      );

  DraftStateStreamProvider._internal(
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
    Stream<DraftState> Function(DraftStateStreamRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DraftStateStreamProvider._internal(
        (ref) => create(ref as DraftStateStreamRef),
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
  AutoDisposeStreamProviderElement<DraftState> createElement() {
    return _DraftStateStreamProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DraftStateStreamProvider && other.leagueId == leagueId;
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
mixin DraftStateStreamRef on AutoDisposeStreamProviderRef<DraftState> {
  /// The parameter `leagueId` of this provider.
  String get leagueId;
}

class _DraftStateStreamProviderElement
    extends AutoDisposeStreamProviderElement<DraftState>
    with DraftStateStreamRef {
  _DraftStateStreamProviderElement(super.provider);

  @override
  String get leagueId => (origin as DraftStateStreamProvider).leagueId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
