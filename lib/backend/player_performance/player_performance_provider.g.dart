// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_performance_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(playerPerformanceService)
const playerPerformanceServiceProvider = PlayerPerformanceServiceProvider._();

final class PlayerPerformanceServiceProvider
    extends
        $FunctionalProvider<
          PlayerPerformanceService,
          PlayerPerformanceService,
          PlayerPerformanceService
        >
    with $Provider<PlayerPerformanceService> {
  const PlayerPerformanceServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'playerPerformanceServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$playerPerformanceServiceHash();

  @$internal
  @override
  $ProviderElement<PlayerPerformanceService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  PlayerPerformanceService create(Ref ref) {
    return playerPerformanceService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PlayerPerformanceService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PlayerPerformanceService>(value),
    );
  }
}

String _$playerPerformanceServiceHash() =>
    r'bc4e15a3f829a79afa86b57a231b223a9d100658';

@ProviderFor(PlayerPerformanceController)
const playerPerformanceControllerProvider =
    PlayerPerformanceControllerFamily._();

final class PlayerPerformanceControllerProvider
    extends
        $AsyncNotifierProvider<
          PlayerPerformanceController,
          List<PlayerPerformance>
        > {
  const PlayerPerformanceControllerProvider._({
    required PlayerPerformanceControllerFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'playerPerformanceControllerProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$playerPerformanceControllerHash();

  @override
  String toString() {
    return r'playerPerformanceControllerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  PlayerPerformanceController create() => PlayerPerformanceController();

  @override
  bool operator ==(Object other) {
    return other is PlayerPerformanceControllerProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$playerPerformanceControllerHash() =>
    r'65c6def5fe47fb74541e554721ae00786451c5dd';

final class PlayerPerformanceControllerFamily extends $Family
    with
        $ClassFamilyOverride<
          PlayerPerformanceController,
          AsyncValue<List<PlayerPerformance>>,
          List<PlayerPerformance>,
          FutureOr<List<PlayerPerformance>>,
          String
        > {
  const PlayerPerformanceControllerFamily._()
    : super(
        retry: null,
        name: r'playerPerformanceControllerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  PlayerPerformanceControllerProvider call(String ftiId) =>
      PlayerPerformanceControllerProvider._(argument: ftiId, from: this);

  @override
  String toString() => r'playerPerformanceControllerProvider';
}

abstract class _$PlayerPerformanceController
    extends $AsyncNotifier<List<PlayerPerformance>> {
  late final _$args = ref.$arg as String;
  String get ftiId => _$args;

  FutureOr<List<PlayerPerformance>> build(String ftiId);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref =
        this.ref
            as $Ref<
              AsyncValue<List<PlayerPerformance>>,
              List<PlayerPerformance>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<List<PlayerPerformance>>,
                List<PlayerPerformance>
              >,
              AsyncValue<List<PlayerPerformance>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
