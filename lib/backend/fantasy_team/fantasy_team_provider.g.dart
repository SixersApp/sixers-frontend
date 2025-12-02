// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fantasy_team_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(FantasyTeams)
const fantasyTeamsProvider = FantasyTeamsProvider._();

final class FantasyTeamsProvider
    extends $AsyncNotifierProvider<FantasyTeams, List<FantasyTeam>> {
  const FantasyTeamsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'fantasyTeamsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$fantasyTeamsHash();

  @$internal
  @override
  FantasyTeams create() => FantasyTeams();
}

String _$fantasyTeamsHash() => r'442847ebe0491c23e980a5167e1ba5bb86b3d445';

abstract class _$FantasyTeams extends $AsyncNotifier<List<FantasyTeam>> {
  FutureOr<List<FantasyTeam>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<AsyncValue<List<FantasyTeam>>, List<FantasyTeam>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<FantasyTeam>>, List<FantasyTeam>>,
              AsyncValue<List<FantasyTeam>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(leagueTeams)
const leagueTeamsProvider = LeagueTeamsFamily._();

final class LeagueTeamsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<FantasyTeam>>,
          List<FantasyTeam>,
          FutureOr<List<FantasyTeam>>
        >
    with
        $FutureModifier<List<FantasyTeam>>,
        $FutureProvider<List<FantasyTeam>> {
  const LeagueTeamsProvider._({
    required LeagueTeamsFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'leagueTeamsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$leagueTeamsHash();

  @override
  String toString() {
    return r'leagueTeamsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<FantasyTeam>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<FantasyTeam>> create(Ref ref) {
    final argument = this.argument as String;
    return leagueTeams(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is LeagueTeamsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$leagueTeamsHash() => r'4b531eefed2e9208d3b8b6050f5b454c7eea54e2';

final class LeagueTeamsFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<FantasyTeam>>, String> {
  const LeagueTeamsFamily._()
    : super(
        retry: null,
        name: r'leagueTeamsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  LeagueTeamsProvider call(String leagueId) =>
      LeagueTeamsProvider._(argument: leagueId, from: this);

  @override
  String toString() => r'leagueTeamsProvider';
}

@ProviderFor(userTeamInLeague)
const userTeamInLeagueProvider = UserTeamInLeagueFamily._();

final class UserTeamInLeagueProvider
    extends
        $FunctionalProvider<
          AsyncValue<FantasyTeam?>,
          FantasyTeam?,
          FutureOr<FantasyTeam?>
        >
    with $FutureModifier<FantasyTeam?>, $FutureProvider<FantasyTeam?> {
  const UserTeamInLeagueProvider._({
    required UserTeamInLeagueFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'userTeamInLeagueProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$userTeamInLeagueHash();

  @override
  String toString() {
    return r'userTeamInLeagueProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<FantasyTeam?> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<FantasyTeam?> create(Ref ref) {
    final argument = this.argument as String;
    return userTeamInLeague(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is UserTeamInLeagueProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$userTeamInLeagueHash() => r'ddc679e2736f21a1750e1dc737940ddedbce8ce7';

final class UserTeamInLeagueFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<FantasyTeam?>, String> {
  const UserTeamInLeagueFamily._()
    : super(
        retry: null,
        name: r'userTeamInLeagueProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  UserTeamInLeagueProvider call(String leagueId) =>
      UserTeamInLeagueProvider._(argument: leagueId, from: this);

  @override
  String toString() => r'userTeamInLeagueProvider';
}
