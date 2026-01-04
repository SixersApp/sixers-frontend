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

String _$leaguesHash() => r'47444f7b9de576818b5d0edb46617a0716ac869e';

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
