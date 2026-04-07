// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'matchup_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(UserMatchups)
const userMatchupsProvider = UserMatchupsProvider._();

final class UserMatchupsProvider
    extends $AsyncNotifierProvider<UserMatchups, List<LeagueMatchupGroup>> {
  const UserMatchupsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'userMatchupsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$userMatchupsHash();

  @$internal
  @override
  UserMatchups create() => UserMatchups();
}

String _$userMatchupsHash() => r'e6eb15de399b560b8b5d18e9bac7be1ec6771ba6';

abstract class _$UserMatchups extends $AsyncNotifier<List<LeagueMatchupGroup>> {
  FutureOr<List<LeagueMatchupGroup>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref
            as $Ref<
              AsyncValue<List<LeagueMatchupGroup>>,
              List<LeagueMatchupGroup>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<List<LeagueMatchupGroup>>,
                List<LeagueMatchupGroup>
              >,
              AsyncValue<List<LeagueMatchupGroup>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(weekMatchups)
const weekMatchupsProvider = WeekMatchupsFamily._();

final class WeekMatchupsProvider
    extends
        $FunctionalProvider<
          AsyncValue<WeekMatchupGroup?>,
          WeekMatchupGroup?,
          FutureOr<WeekMatchupGroup?>
        >
    with
        $FutureModifier<WeekMatchupGroup?>,
        $FutureProvider<WeekMatchupGroup?> {
  const WeekMatchupsProvider._({
    required WeekMatchupsFamily super.from,
    required (String, int) super.argument,
  }) : super(
         retry: null,
         name: r'weekMatchupsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$weekMatchupsHash();

  @override
  String toString() {
    return r'weekMatchupsProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<WeekMatchupGroup?> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<WeekMatchupGroup?> create(Ref ref) {
    final argument = this.argument as (String, int);
    return weekMatchups(ref, argument.$1, argument.$2);
  }

  @override
  bool operator ==(Object other) {
    return other is WeekMatchupsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$weekMatchupsHash() => r'6fd49ebeaa2700b9b356a1126080fb743e3c8ab0';

final class WeekMatchupsFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<WeekMatchupGroup?>, (String, int)> {
  const WeekMatchupsFamily._()
    : super(
        retry: null,
        name: r'weekMatchupsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  WeekMatchupsProvider call(String leagueId, int matchNum) =>
      WeekMatchupsProvider._(argument: (leagueId, matchNum), from: this);

  @override
  String toString() => r'weekMatchupsProvider';
}
