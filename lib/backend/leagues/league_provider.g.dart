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

String _$leaguesHash() => r'16eba3b2f57b21d84766f0fe8d9b75e2790f0711';

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

/// Fetches a single league via GET /leagues/:leagueId. Unlike [leaguesProvider],
/// the team objects in the response include leaderboard fields
/// (wins / losses / matches_completed / avg_points_per_game / match_scores).

@ProviderFor(leagueDetail)
const leagueDetailProvider = LeagueDetailFamily._();

/// Fetches a single league via GET /leagues/:leagueId. Unlike [leaguesProvider],
/// the team objects in the response include leaderboard fields
/// (wins / losses / matches_completed / avg_points_per_game / match_scores).

final class LeagueDetailProvider
    extends $FunctionalProvider<AsyncValue<League?>, League?, FutureOr<League?>>
    with $FutureModifier<League?>, $FutureProvider<League?> {
  /// Fetches a single league via GET /leagues/:leagueId. Unlike [leaguesProvider],
  /// the team objects in the response include leaderboard fields
  /// (wins / losses / matches_completed / avg_points_per_game / match_scores).
  const LeagueDetailProvider._({
    required LeagueDetailFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'leagueDetailProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$leagueDetailHash();

  @override
  String toString() {
    return r'leagueDetailProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<League?> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<League?> create(Ref ref) {
    final argument = this.argument as String;
    return leagueDetail(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is LeagueDetailProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$leagueDetailHash() => r'9446cf74d637757a2f681894286073fcad3ab074';

/// Fetches a single league via GET /leagues/:leagueId. Unlike [leaguesProvider],
/// the team objects in the response include leaderboard fields
/// (wins / losses / matches_completed / avg_points_per_game / match_scores).

final class LeagueDetailFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<League?>, String> {
  const LeagueDetailFamily._()
    : super(
        retry: null,
        name: r'leagueDetailProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Fetches a single league via GET /leagues/:leagueId. Unlike [leaguesProvider],
  /// the team objects in the response include leaderboard fields
  /// (wins / losses / matches_completed / avg_points_per_game / match_scores).

  LeagueDetailProvider call(String leagueId) =>
      LeagueDetailProvider._(argument: leagueId, from: this);

  @override
  String toString() => r'leagueDetailProvider';
}
