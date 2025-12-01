// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AuthProvider)
const authProviderProvider = AuthProviderProvider._();

final class AuthProviderProvider
    extends $NotifierProvider<AuthProvider, AppSession?> {
  const AuthProviderProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authProviderProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authProviderHash();

  @$internal
  @override
  AuthProvider create() => AuthProvider();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppSession? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppSession?>(value),
    );
  }
}

String _$authProviderHash() => r'd1c093d1e54eee4078561e66e0d4af2cbc5ab252';

abstract class _$AuthProvider extends $Notifier<AppSession?> {
  AppSession? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AppSession?, AppSession?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AppSession?, AppSession?>,
              AppSession?,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
