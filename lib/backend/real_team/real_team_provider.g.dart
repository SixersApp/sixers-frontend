// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'real_team_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(RealTeams)
const realTeamsProvider = RealTeamsFamily._();

final class RealTeamsProvider
    extends $AsyncNotifierProvider<RealTeams, List<RealTeam>> {
  const RealTeamsProvider._({
    required RealTeamsFamily super.from,
    required String? super.argument,
  }) : super(
         retry: null,
         name: r'realTeamsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$realTeamsHash();

  @override
  String toString() {
    return r'realTeamsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  RealTeams create() => RealTeams();

  @override
  bool operator ==(Object other) {
    return other is RealTeamsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$realTeamsHash() => r'6938219b79a9412bd12c7bc0abdea8d1ce1b31d7';

final class RealTeamsFamily extends $Family
    with
        $ClassFamilyOverride<
          RealTeams,
          AsyncValue<List<RealTeam>>,
          List<RealTeam>,
          FutureOr<List<RealTeam>>,
          String?
        > {
  const RealTeamsFamily._()
    : super(
        retry: null,
        name: r'realTeamsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  RealTeamsProvider call({String? tournamentId}) =>
      RealTeamsProvider._(argument: tournamentId, from: this);

  @override
  String toString() => r'realTeamsProvider';
}

abstract class _$RealTeams extends $AsyncNotifier<List<RealTeam>> {
  late final _$args = ref.$arg as String?;
  String? get tournamentId => _$args;

  FutureOr<List<RealTeam>> build({String? tournamentId});
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(tournamentId: _$args);
    final ref = this.ref as $Ref<AsyncValue<List<RealTeam>>, List<RealTeam>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<RealTeam>>, List<RealTeam>>,
              AsyncValue<List<RealTeam>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
