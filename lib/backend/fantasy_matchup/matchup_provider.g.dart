// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'matchup_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(UserMatchups)
const userMatchupsProvider = UserMatchupsFamily._();

final class UserMatchupsProvider
    extends $AsyncNotifierProvider<UserMatchups, List<Matchup>> {
  const UserMatchupsProvider._({
    required UserMatchupsFamily super.from,
    required int super.argument,
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

String _$userMatchupsHash() => r'b68dd870dc410e360ca3788094b6dfe16293d039';

final class UserMatchupsFamily extends $Family
    with
        $ClassFamilyOverride<
          UserMatchups,
          AsyncValue<List<Matchup>>,
          List<Matchup>,
          FutureOr<List<Matchup>>,
          int
        > {
  const UserMatchupsFamily._()
    : super(
        retry: null,
        name: r'userMatchupsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  UserMatchupsProvider call(int matchNum) =>
      UserMatchupsProvider._(argument: matchNum, from: this);

  @override
  String toString() => r'userMatchupsProvider';
}

abstract class _$UserMatchups extends $AsyncNotifier<List<Matchup>> {
  late final _$args = ref.$arg as int;
  int get matchNum => _$args;

  FutureOr<List<Matchup>> build(int matchNum);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
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
