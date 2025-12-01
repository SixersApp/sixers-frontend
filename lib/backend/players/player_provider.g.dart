// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(allPlayers)
const allPlayersProvider = AllPlayersFamily._();

final class AllPlayersProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Player>>,
          List<Player>,
          FutureOr<List<Player>>
        >
    with $FutureModifier<List<Player>>, $FutureProvider<List<Player>> {
  const AllPlayersProvider._({
    required AllPlayersFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'allPlayersProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$allPlayersHash();

  @override
  String toString() {
    return r'allPlayersProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<Player>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<Player>> create(Ref ref) {
    final argument = this.argument as String;
    return allPlayers(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is AllPlayersProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$allPlayersHash() => r'2af163b726a6297dd3f9fbb622e54abf88534c24';

final class AllPlayersFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<Player>>, String> {
  const AllPlayersFamily._()
    : super(
        retry: null,
        name: r'allPlayersProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  AllPlayersProvider call(String tournamentId) =>
      AllPlayersProvider._(argument: tournamentId, from: this);

  @override
  String toString() => r'allPlayersProvider';
}
