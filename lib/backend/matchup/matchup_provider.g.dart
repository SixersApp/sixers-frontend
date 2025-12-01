// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'matchup_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Matchups)
const matchupsProvider = MatchupsFamily._();

final class MatchupsProvider
    extends $AsyncNotifierProvider<Matchups, List<Matchup>> {
  const MatchupsProvider._({
    required MatchupsFamily super.from,
    required String? super.argument,
  }) : super(
         retry: null,
         name: r'matchupsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$matchupsHash();

  @override
  String toString() {
    return r'matchupsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  Matchups create() => Matchups();

  @override
  bool operator ==(Object other) {
    return other is MatchupsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$matchupsHash() => r'b48fb097554daecc764463671745a7836086d0a6';

final class MatchupsFamily extends $Family
    with
        $ClassFamilyOverride<
          Matchups,
          AsyncValue<List<Matchup>>,
          List<Matchup>,
          FutureOr<List<Matchup>>,
          String?
        > {
  const MatchupsFamily._()
    : super(
        retry: null,
        name: r'matchupsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  MatchupsProvider call({String? leagueId}) =>
      MatchupsProvider._(argument: leagueId, from: this);

  @override
  String toString() => r'matchupsProvider';
}

abstract class _$Matchups extends $AsyncNotifier<List<Matchup>> {
  late final _$args = ref.$arg as String?;
  String? get leagueId => _$args;

  FutureOr<List<Matchup>> build({String? leagueId});
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(leagueId: _$args);
    final ref = this.ref as $Ref<AsyncValue<List<Matchup>>, List<Matchup>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Matchup>>, List<Matchup>>,
              AsyncValue<List<Matchup>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(UserMatchups)
const userMatchupsProvider = UserMatchupsFamily._();

final class UserMatchupsProvider
    extends $AsyncNotifierProvider<UserMatchups, List<Matchup>> {
  const UserMatchupsProvider._({
    required UserMatchupsFamily super.from,
    required String? super.argument,
  }) : super(
         retry: null,
         name: r'userMatchupsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$userMatchupsHash();

  @override
  String toString() {
    return r'userMatchupsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  UserMatchups create() => UserMatchups();

  @override
  bool operator ==(Object other) {
    return other is UserMatchupsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$userMatchupsHash() => r'cabde0092f557b2ee6eeca5e5739ee5d2142508a';

final class UserMatchupsFamily extends $Family
    with
        $ClassFamilyOverride<
          UserMatchups,
          AsyncValue<List<Matchup>>,
          List<Matchup>,
          FutureOr<List<Matchup>>,
          String?
        > {
  const UserMatchupsFamily._()
    : super(
        retry: null,
        name: r'userMatchupsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  UserMatchupsProvider call({String? userId}) =>
      UserMatchupsProvider._(argument: userId, from: this);

  @override
  String toString() => r'userMatchupsProvider';
}

abstract class _$UserMatchups extends $AsyncNotifier<List<Matchup>> {
  late final _$args = ref.$arg as String?;
  String? get userId => _$args;

  FutureOr<List<Matchup>> build({String? userId});
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(userId: _$args);
    final ref = this.ref as $Ref<AsyncValue<List<Matchup>>, List<Matchup>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Matchup>>, List<Matchup>>,
              AsyncValue<List<Matchup>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
