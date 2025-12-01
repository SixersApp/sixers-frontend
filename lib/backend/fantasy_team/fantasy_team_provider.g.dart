// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fantasy_team_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(FantasyTeams)
const fantasyTeamsProvider = FantasyTeamsFamily._();

final class FantasyTeamsProvider
    extends $AsyncNotifierProvider<FantasyTeams, List<FantasyTeam>> {
  const FantasyTeamsProvider._({
    required FantasyTeamsFamily super.from,
    required String? super.argument,
  }) : super(
         retry: null,
         name: r'fantasyTeamsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$fantasyTeamsHash();

  @override
  String toString() {
    return r'fantasyTeamsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  FantasyTeams create() => FantasyTeams();

  @override
  bool operator ==(Object other) {
    return other is FantasyTeamsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$fantasyTeamsHash() => r'a0001602e1987735bff71fed37385589804963ae';

final class FantasyTeamsFamily extends $Family
    with
        $ClassFamilyOverride<
          FantasyTeams,
          AsyncValue<List<FantasyTeam>>,
          List<FantasyTeam>,
          FutureOr<List<FantasyTeam>>,
          String?
        > {
  const FantasyTeamsFamily._()
    : super(
        retry: null,
        name: r'fantasyTeamsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  FantasyTeamsProvider call({String? leagueId}) =>
      FantasyTeamsProvider._(argument: leagueId, from: this);

  @override
  String toString() => r'fantasyTeamsProvider';
}

abstract class _$FantasyTeams extends $AsyncNotifier<List<FantasyTeam>> {
  late final _$args = ref.$arg as String?;
  String? get leagueId => _$args;

  FutureOr<List<FantasyTeam>> build({String? leagueId});
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(leagueId: _$args);
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
