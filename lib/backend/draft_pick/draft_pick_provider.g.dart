// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'draft_pick_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$draftPicksStreamHash() => r'7048f18b6d16bab36ee598d0d551263252980317';

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

/// See also [draftPicksStream].
@ProviderFor(draftPicksStream)
const draftPicksStreamProvider = DraftPicksStreamFamily();

/// See also [draftPicksStream].
class DraftPicksStreamFamily extends Family<AsyncValue<List<DraftPick>>> {
  /// See also [draftPicksStream].
  const DraftPicksStreamFamily();

  /// See also [draftPicksStream].
  DraftPicksStreamProvider call(String leagueId) {
    return DraftPicksStreamProvider(leagueId);
  }

  @override
  DraftPicksStreamProvider getProviderOverride(
    covariant DraftPicksStreamProvider provider,
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
  String? get name => r'draftPicksStreamProvider';
}

/// See also [draftPicksStream].
class DraftPicksStreamProvider
    extends AutoDisposeStreamProvider<List<DraftPick>> {
  /// See also [draftPicksStream].
  DraftPicksStreamProvider(String leagueId)
    : this._internal(
        (ref) => draftPicksStream(ref as DraftPicksStreamRef, leagueId),
        from: draftPicksStreamProvider,
        name: r'draftPicksStreamProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$draftPicksStreamHash,
        dependencies: DraftPicksStreamFamily._dependencies,
        allTransitiveDependencies:
            DraftPicksStreamFamily._allTransitiveDependencies,
        leagueId: leagueId,
      );

  DraftPicksStreamProvider._internal(
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
    Stream<List<DraftPick>> Function(DraftPicksStreamRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DraftPicksStreamProvider._internal(
        (ref) => create(ref as DraftPicksStreamRef),
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
  AutoDisposeStreamProviderElement<List<DraftPick>> createElement() {
    return _DraftPicksStreamProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DraftPicksStreamProvider && other.leagueId == leagueId;
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
mixin DraftPicksStreamRef on AutoDisposeStreamProviderRef<List<DraftPick>> {
  /// The parameter `leagueId` of this provider.
  String get leagueId;
}

class _DraftPicksStreamProviderElement
    extends AutoDisposeStreamProviderElement<List<DraftPick>>
    with DraftPicksStreamRef {
  _DraftPicksStreamProviderElement(super.provider);

  @override
  String get leagueId => (origin as DraftPicksStreamProvider).leagueId;
}

String _$draftPickActionsHash() => r'2af3a837a7ea512db914f7732f844c9b132f29b4';

/// expose mutations
///
/// Copied from [DraftPickActions].
@ProviderFor(DraftPickActions)
final draftPickActionsProvider =
    AutoDisposeNotifierProvider<DraftPickActions, void>.internal(
      DraftPickActions.new,
      name: r'draftPickActionsProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$draftPickActionsHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$DraftPickActions = AutoDisposeNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
