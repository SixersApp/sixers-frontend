// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tournament_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Tournaments)
const tournamentsProvider = TournamentsProvider._();

final class TournamentsProvider
    extends $AsyncNotifierProvider<Tournaments, List<Tournament>> {
  const TournamentsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'tournamentsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$tournamentsHash();

  @$internal
  @override
  Tournaments create() => Tournaments();
}

String _$tournamentsHash() => r'ec87dcddf3b84adfef3df4b7521f8eb3b6e45332';

abstract class _$Tournaments extends $AsyncNotifier<List<Tournament>> {
  FutureOr<List<Tournament>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<AsyncValue<List<Tournament>>, List<Tournament>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Tournament>>, List<Tournament>>,
              AsyncValue<List<Tournament>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
