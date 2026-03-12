// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'draft_player_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(DraftPlayers)
const draftPlayersProvider = DraftPlayersFamily._();

final class DraftPlayersProvider
    extends $NotifierProvider<DraftPlayers, DraftPlayersState> {
  const DraftPlayersProvider._({
    required DraftPlayersFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'draftPlayersProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$draftPlayersHash();

  @override
  String toString() {
    return r'draftPlayersProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  DraftPlayers create() => DraftPlayers();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DraftPlayersState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DraftPlayersState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is DraftPlayersProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$draftPlayersHash() => r'dbc4dbf2ec8220ff0d6e5a929df25e922aace32b';

final class DraftPlayersFamily extends $Family
    with
        $ClassFamilyOverride<
          DraftPlayers,
          DraftPlayersState,
          DraftPlayersState,
          DraftPlayersState,
          String
        > {
  const DraftPlayersFamily._()
    : super(
        retry: null,
        name: r'draftPlayersProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  DraftPlayersProvider call(String leagueId) =>
      DraftPlayersProvider._(argument: leagueId, from: this);

  @override
  String toString() => r'draftPlayersProvider';
}

abstract class _$DraftPlayers extends $Notifier<DraftPlayersState> {
  late final _$args = ref.$arg as String;
  String get leagueId => _$args;

  DraftPlayersState build(String leagueId);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<DraftPlayersState, DraftPlayersState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<DraftPlayersState, DraftPlayersState>,
              DraftPlayersState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
