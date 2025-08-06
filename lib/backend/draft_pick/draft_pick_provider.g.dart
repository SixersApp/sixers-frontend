// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'draft_pick_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$draftPicksHash() => r'3e005469476bb05e50b38100ceaebbc55b4a3fe7';

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

/// See also [draftPicks].
@ProviderFor(draftPicks)
const draftPicksProvider = DraftPicksFamily();

/// See also [draftPicks].
class DraftPicksFamily extends Family<AsyncValue<List<DraftPick>>> {
  /// See also [draftPicks].
  const DraftPicksFamily();

  /// See also [draftPicks].
  DraftPicksProvider call(String leagueId) {
    return DraftPicksProvider(leagueId);
  }

  @override
  DraftPicksProvider getProviderOverride(
    covariant DraftPicksProvider provider,
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
  String? get name => r'draftPicksProvider';
}

/// See also [draftPicks].
class DraftPicksProvider extends AutoDisposeFutureProvider<List<DraftPick>> {
  /// See also [draftPicks].
  DraftPicksProvider(String leagueId)
    : this._internal(
        (ref) => draftPicks(ref as DraftPicksRef, leagueId),
        from: draftPicksProvider,
        name: r'draftPicksProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$draftPicksHash,
        dependencies: DraftPicksFamily._dependencies,
        allTransitiveDependencies: DraftPicksFamily._allTransitiveDependencies,
        leagueId: leagueId,
      );

  DraftPicksProvider._internal(
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
    FutureOr<List<DraftPick>> Function(DraftPicksRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DraftPicksProvider._internal(
        (ref) => create(ref as DraftPicksRef),
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
  AutoDisposeFutureProviderElement<List<DraftPick>> createElement() {
    return _DraftPicksProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DraftPicksProvider && other.leagueId == leagueId;
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
mixin DraftPicksRef on AutoDisposeFutureProviderRef<List<DraftPick>> {
  /// The parameter `leagueId` of this provider.
  String get leagueId;
}

class _DraftPicksProviderElement
    extends AutoDisposeFutureProviderElement<List<DraftPick>>
    with DraftPicksRef {
  _DraftPicksProviderElement(super.provider);

  @override
  String get leagueId => (origin as DraftPicksProvider).leagueId;
}

String _$draftPickActionsHash() => r'6b864dd54e71d4085ea2cf11632b7d560b47ac41';

/// See also [DraftPickActions].
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
