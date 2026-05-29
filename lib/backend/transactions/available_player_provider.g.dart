// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'available_player_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AvailablePlayers)
const availablePlayersProvider = AvailablePlayersFamily._();

final class AvailablePlayersProvider
    extends $NotifierProvider<AvailablePlayers, AvailablePlayersState> {
  const AvailablePlayersProvider._({
    required AvailablePlayersFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'availablePlayersProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$availablePlayersHash();

  @override
  String toString() {
    return r'availablePlayersProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  AvailablePlayers create() => AvailablePlayers();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AvailablePlayersState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AvailablePlayersState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is AvailablePlayersProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$availablePlayersHash() => r'4e6cc2d3e5bdbe0f0d0fda49be754d64e428a1ca';

final class AvailablePlayersFamily extends $Family
    with
        $ClassFamilyOverride<
          AvailablePlayers,
          AvailablePlayersState,
          AvailablePlayersState,
          AvailablePlayersState,
          String
        > {
  const AvailablePlayersFamily._()
    : super(
        retry: null,
        name: r'availablePlayersProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  AvailablePlayersProvider call(String leagueId) =>
      AvailablePlayersProvider._(argument: leagueId, from: this);

  @override
  String toString() => r'availablePlayersProvider';
}

abstract class _$AvailablePlayers extends $Notifier<AvailablePlayersState> {
  late final _$args = ref.$arg as String;
  String get leagueId => _$args;

  AvailablePlayersState build(String leagueId);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<AvailablePlayersState, AvailablePlayersState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AvailablePlayersState, AvailablePlayersState>,
              AvailablePlayersState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
