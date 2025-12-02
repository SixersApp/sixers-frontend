// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scoring_rule_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ScoringRules)
const scoringRulesProvider = ScoringRulesFamily._();

final class ScoringRulesProvider
    extends $AsyncNotifierProvider<ScoringRules, List<ScoringRule>> {
  const ScoringRulesProvider._({
    required ScoringRulesFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'scoringRulesProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$scoringRulesHash();

  @override
  String toString() {
    return r'scoringRulesProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  ScoringRules create() => ScoringRules();

  @override
  bool operator ==(Object other) {
    return other is ScoringRulesProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$scoringRulesHash() => r'd54eac90a73f2b8cc02a1d2b1fbb8491ea57aea9';

final class ScoringRulesFamily extends $Family
    with
        $ClassFamilyOverride<
          ScoringRules,
          AsyncValue<List<ScoringRule>>,
          List<ScoringRule>,
          FutureOr<List<ScoringRule>>,
          String
        > {
  const ScoringRulesFamily._()
    : super(
        retry: null,
        name: r'scoringRulesProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ScoringRulesProvider call(String fantasyTeamInstanceId) =>
      ScoringRulesProvider._(argument: fantasyTeamInstanceId, from: this);

  @override
  String toString() => r'scoringRulesProvider';
}

abstract class _$ScoringRules extends $AsyncNotifier<List<ScoringRule>> {
  late final _$args = ref.$arg as String;
  String get fantasyTeamInstanceId => _$args;

  FutureOr<List<ScoringRule>> build(String fantasyTeamInstanceId);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref =
        this.ref as $Ref<AsyncValue<List<ScoringRule>>, List<ScoringRule>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<ScoringRule>>, List<ScoringRule>>,
              AsyncValue<List<ScoringRule>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
