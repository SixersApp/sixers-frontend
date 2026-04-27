// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trade_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(LeagueTrades)
const leagueTradesProvider = LeagueTradesFamily._();

final class LeagueTradesProvider
    extends $AsyncNotifierProvider<LeagueTrades, List<Trade>> {
  const LeagueTradesProvider._({
    required LeagueTradesFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'leagueTradesProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$leagueTradesHash();

  @override
  String toString() {
    return r'leagueTradesProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  LeagueTrades create() => LeagueTrades();

  @override
  bool operator ==(Object other) {
    return other is LeagueTradesProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$leagueTradesHash() => r'bc97c528cc58026114641b991105d9c8a6db3ae0';

final class LeagueTradesFamily extends $Family
    with
        $ClassFamilyOverride<
          LeagueTrades,
          AsyncValue<List<Trade>>,
          List<Trade>,
          FutureOr<List<Trade>>,
          String
        > {
  const LeagueTradesFamily._()
    : super(
        retry: null,
        name: r'leagueTradesProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  LeagueTradesProvider call(String leagueId) =>
      LeagueTradesProvider._(argument: leagueId, from: this);

  @override
  String toString() => r'leagueTradesProvider';
}

abstract class _$LeagueTrades extends $AsyncNotifier<List<Trade>> {
  late final _$args = ref.$arg as String;
  String get leagueId => _$args;

  FutureOr<List<Trade>> build(String leagueId);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<AsyncValue<List<Trade>>, List<Trade>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Trade>>, List<Trade>>,
              AsyncValue<List<Trade>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
