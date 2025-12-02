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
    extends $AsyncNotifierProvider<AuthProvider, AppSession?> {
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
}

String _$authProviderHash() => r'2bf1d34387bc77fcb13a396b67ab9823d9c762ab';

abstract class _$AuthProvider extends $AsyncNotifier<AppSession?> {
  FutureOr<AppSession?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<AppSession?>, AppSession?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<AppSession?>, AppSession?>,
              AsyncValue<AppSession?>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
