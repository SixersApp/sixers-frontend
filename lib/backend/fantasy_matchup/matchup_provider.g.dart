// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'matchup_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(userMatchups)
const userMatchupsProvider = UserMatchupsFamily._();

final class UserMatchupsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Matchup>>,
          List<Matchup>,
          FutureOr<List<Matchup>>
        >
    with $FutureModifier<List<Matchup>>, $FutureProvider<List<Matchup>> {
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
  $FutureProviderElement<List<Matchup>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<Matchup>> create(Ref ref) {
    final argument = this.argument as int;
    return userMatchups(ref, matchNum: argument);
  }

  @override
  bool operator ==(Object other) {
    return other is UserMatchupsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$userMatchupsHash() => r'd44d18d80ba6ddb84ff8e825db6046d2e0b542f3';

final class UserMatchupsFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<Matchup>>, int> {
  const UserMatchupsFamily._()
    : super(
        retry: null,
        name: r'userMatchupsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  UserMatchupsProvider call({required int matchNum}) =>
      UserMatchupsProvider._(argument: matchNum, from: this);

  @override
  String toString() => r'userMatchupsProvider';
}
