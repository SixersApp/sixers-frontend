// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'live_match_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(LiveMatches)
const liveMatchesProvider = LiveMatchesProvider._();

final class LiveMatchesProvider
    extends $AsyncNotifierProvider<LiveMatches, Map<String, ActiveMatch>> {
  const LiveMatchesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'liveMatchesProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$liveMatchesHash();

  @$internal
  @override
  LiveMatches create() => LiveMatches();
}

String _$liveMatchesHash() => r'df82613cbba5090a549caa6a5ccd7167edfe9835';

abstract class _$LiveMatches extends $AsyncNotifier<Map<String, ActiveMatch>> {
  FutureOr<Map<String, ActiveMatch>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref
            as $Ref<
              AsyncValue<Map<String, ActiveMatch>>,
              Map<String, ActiveMatch>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<Map<String, ActiveMatch>>,
                Map<String, ActiveMatch>
              >,
              AsyncValue<Map<String, ActiveMatch>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
