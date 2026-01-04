// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'draft_pick_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(draftPicks)
const draftPicksProvider = DraftPicksFamily._();

final class DraftPicksProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<DraftPick>>,
          List<DraftPick>,
          FutureOr<List<DraftPick>>
        >
    with $FutureModifier<List<DraftPick>>, $FutureProvider<List<DraftPick>> {
  const DraftPicksProvider._({
    required DraftPicksFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'draftPicksProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$draftPicksHash();

  @override
  String toString() {
    return r'draftPicksProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<DraftPick>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<DraftPick>> create(Ref ref) {
    final argument = this.argument as String;
    return draftPicks(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is DraftPicksProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$draftPicksHash() => r'9156683ca9f4acacb0f0fc77fc47a011530d193b';

final class DraftPicksFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<DraftPick>>, String> {
  const DraftPicksFamily._()
    : super(
        retry: null,
        name: r'draftPicksProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  DraftPicksProvider call(String leagueId) =>
      DraftPicksProvider._(argument: leagueId, from: this);

  @override
  String toString() => r'draftPicksProvider';
}

@ProviderFor(DraftPickActions)
const draftPickActionsProvider = DraftPickActionsProvider._();

final class DraftPickActionsProvider
    extends $NotifierProvider<DraftPickActions, void> {
  const DraftPickActionsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'draftPickActionsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$draftPickActionsHash();

  @$internal
  @override
  DraftPickActions create() => DraftPickActions();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$draftPickActionsHash() => r'fe014cc0da4480d9f7291b0dbdd8184f5489b1d4';

abstract class _$DraftPickActions extends $Notifier<void> {
  void build();
  @$mustCallSuper
  @override
  void runBuild() {
    build();
    final ref = this.ref as $Ref<void, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<void, void>,
              void,
              Object?,
              Object?
            >;
    element.handleValue(ref, null);
  }
}
