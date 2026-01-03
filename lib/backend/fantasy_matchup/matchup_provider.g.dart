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
    extends $AsyncNotifierProvider<UserMatchups, List<Matchup>> {
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

String _$userMatchupsHash() => r'590f9d06bdd93197dde80aa8c5a8f23d7baece5c';

abstract class _$UserMatchups extends $AsyncNotifier<List<Matchup>> {
  FutureOr<List<Matchup>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
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
