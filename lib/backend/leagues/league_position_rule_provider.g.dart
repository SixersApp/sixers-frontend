// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'league_position_rule_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(LeaguePositionRules)
const leaguePositionRulesProvider = LeaguePositionRulesFamily._();

final class LeaguePositionRulesProvider
    extends
        $AsyncNotifierProvider<LeaguePositionRules, List<LeaguePositionRule>> {
  const LeaguePositionRulesProvider._({
    required LeaguePositionRulesFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'leaguePositionRulesProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$leaguePositionRulesHash();

  @override
  String toString() {
    return r'leaguePositionRulesProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  LeaguePositionRules create() => LeaguePositionRules();

  @override
  bool operator ==(Object other) {
    return other is LeaguePositionRulesProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$leaguePositionRulesHash() =>
    r'6e55ce54003dfc9bb55e92ec99e46bff5d5fe1ac';

final class LeaguePositionRulesFamily extends $Family
    with
        $ClassFamilyOverride<
          LeaguePositionRules,
          AsyncValue<List<LeaguePositionRule>>,
          List<LeaguePositionRule>,
          FutureOr<List<LeaguePositionRule>>,
          String
        > {
  const LeaguePositionRulesFamily._()
    : super(
        retry: null,
        name: r'leaguePositionRulesProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  LeaguePositionRulesProvider call(String leagueId) =>
      LeaguePositionRulesProvider._(argument: leagueId, from: this);

  @override
  String toString() => r'leaguePositionRulesProvider';
}

abstract class _$LeaguePositionRules
    extends $AsyncNotifier<List<LeaguePositionRule>> {
  late final _$args = ref.$arg as String;
  String get leagueId => _$args;

  FutureOr<List<LeaguePositionRule>> build(String leagueId);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref =
        this.ref
            as $Ref<
              AsyncValue<List<LeaguePositionRule>>,
              List<LeaguePositionRule>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<List<LeaguePositionRule>>,
                List<LeaguePositionRule>
              >,
              AsyncValue<List<LeaguePositionRule>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
