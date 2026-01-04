// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(MatchFeed)
const matchFeedProvider = MatchFeedProvider._();

final class MatchFeedProvider
    extends $AsyncNotifierProvider<MatchFeed, List<FeedGroupModel>> {
  const MatchFeedProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'matchFeedProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$matchFeedHash();

  @$internal
  @override
  MatchFeed create() => MatchFeed();
}

String _$matchFeedHash() => r'47d8464d116d02c22c048783a7e7baec472903b4';

abstract class _$MatchFeed extends $AsyncNotifier<List<FeedGroupModel>> {
  FutureOr<List<FeedGroupModel>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref
            as $Ref<AsyncValue<List<FeedGroupModel>>, List<FeedGroupModel>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<List<FeedGroupModel>>,
                List<FeedGroupModel>
              >,
              AsyncValue<List<FeedGroupModel>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
