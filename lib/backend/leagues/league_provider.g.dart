// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'league_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Leagues)
const leaguesProvider = LeaguesProvider._();

final class LeaguesProvider
    extends $AsyncNotifierProvider<Leagues, List<League>> {
  const LeaguesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'leaguesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$leaguesHash();

  @$internal
  @override
  Leagues create() => Leagues();
}

String _$leaguesHash() => r'ad53c47d033c9102523aa486be969a28f6b92bc6';

abstract class _$Leagues extends $AsyncNotifier<List<League>> {
  FutureOr<List<League>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<List<League>>, List<League>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<League>>, List<League>>,
              AsyncValue<List<League>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(LeagueActions)
const leagueActionsProvider = LeagueActionsProvider._();

final class LeagueActionsProvider
    extends $NotifierProvider<LeagueActions, void> {
  const LeagueActionsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'leagueActionsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$leagueActionsHash();

  @$internal
  @override
  LeagueActions create() => LeagueActions();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$leagueActionsHash() => r'14c07482b21973c80b12bb5b6bf2bce5d686eb32';

abstract class _$LeagueActions extends $Notifier<void> {
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
