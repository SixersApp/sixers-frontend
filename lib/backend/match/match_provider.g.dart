// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(MatchFeed)
const matchFeedProvider = MatchFeedFamily._();

final class MatchFeedProvider
    extends $AsyncNotifierProvider<MatchFeed, List<MatchModel>> {
  const MatchFeedProvider._({
    required MatchFeedFamily super.from,
    required String? super.argument,
  }) : super(
         retry: null,
         name: r'matchFeedProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$matchFeedHash();

  @override
  String toString() {
    return r'matchFeedProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  MatchFeed create() => MatchFeed();

  @override
  bool operator ==(Object other) {
    return other is MatchFeedProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$matchFeedHash() => r'6532a8f42c94ca350cc04f365bcdea3f0cfb44b5';

final class MatchFeedFamily extends $Family
    with
        $ClassFamilyOverride<
          MatchFeed,
          AsyncValue<List<MatchModel>>,
          List<MatchModel>,
          FutureOr<List<MatchModel>>,
          String?
        > {
  const MatchFeedFamily._()
    : super(
        retry: null,
        name: r'matchFeedProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  MatchFeedProvider call({String? matchId}) =>
      MatchFeedProvider._(argument: matchId, from: this);

  @override
  String toString() => r'matchFeedProvider';
}

abstract class _$MatchFeed extends $AsyncNotifier<List<MatchModel>> {
  late final _$args = ref.$arg as String?;
  String? get matchId => _$args;

  FutureOr<List<MatchModel>> build({String? matchId});
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(matchId: _$args);
    final ref =
        this.ref as $Ref<AsyncValue<List<MatchModel>>, List<MatchModel>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<MatchModel>>, List<MatchModel>>,
              AsyncValue<List<MatchModel>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
