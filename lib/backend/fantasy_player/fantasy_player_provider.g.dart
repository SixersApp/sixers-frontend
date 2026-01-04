// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fantasy_player_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(FantasyPlayerController)
const fantasyPlayerControllerProvider = FantasyPlayerControllerFamily._();

final class FantasyPlayerControllerProvider
    extends
        $AsyncNotifierProvider<FantasyPlayerController, List<FantasyPlayer>> {
  const FantasyPlayerControllerProvider._({
    required FantasyPlayerControllerFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'fantasyPlayerControllerProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$fantasyPlayerControllerHash();

  @override
  String toString() {
    return r'fantasyPlayerControllerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  FantasyPlayerController create() => FantasyPlayerController();

  @override
  bool operator ==(Object other) {
    return other is FantasyPlayerControllerProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$fantasyPlayerControllerHash() =>
    r'258b842882d75a516ce341fd9bc6c506a4a111a0';

final class FantasyPlayerControllerFamily extends $Family
    with
        $ClassFamilyOverride<
          FantasyPlayerController,
          AsyncValue<List<FantasyPlayer>>,
          List<FantasyPlayer>,
          FutureOr<List<FantasyPlayer>>,
          String
        > {
  const FantasyPlayerControllerFamily._()
    : super(
        retry: null,
        name: r'fantasyPlayerControllerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  FantasyPlayerControllerProvider call(String ftiId) =>
      FantasyPlayerControllerProvider._(argument: ftiId, from: this);

  @override
  String toString() => r'fantasyPlayerControllerProvider';
}

abstract class _$FantasyPlayerController
    extends $AsyncNotifier<List<FantasyPlayer>> {
  late final _$args = ref.$arg as String;
  String get ftiId => _$args;

  FutureOr<List<FantasyPlayer>> build(String ftiId);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref =
        this.ref as $Ref<AsyncValue<List<FantasyPlayer>>, List<FantasyPlayer>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<FantasyPlayer>>, List<FantasyPlayer>>,
              AsyncValue<List<FantasyPlayer>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
