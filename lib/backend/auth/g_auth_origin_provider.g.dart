// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'g_auth_origin_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(GAuthOrigin)
const gAuthOriginProvider = GAuthOriginProvider._();

final class GAuthOriginProvider extends $NotifierProvider<GAuthOrigin, String> {
  const GAuthOriginProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'gAuthOriginProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$gAuthOriginHash();

  @$internal
  @override
  GAuthOrigin create() => GAuthOrigin();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$gAuthOriginHash() => r'b2cfc1fb1541194b5431a17f2673a45ada40b352';

abstract class _$GAuthOrigin extends $Notifier<String> {
  String build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<String, String>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<String, String>,
              String,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
