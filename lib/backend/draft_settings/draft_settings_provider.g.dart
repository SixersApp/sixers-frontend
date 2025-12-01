// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'draft_settings_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(DraftSettings)
const draftSettingsProvider = DraftSettingsFamily._();

final class DraftSettingsProvider
    extends $AsyncNotifierProvider<DraftSettings, model.DraftSettings?> {
  const DraftSettingsProvider._({
    required DraftSettingsFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'draftSettingsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$draftSettingsHash();

  @override
  String toString() {
    return r'draftSettingsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  DraftSettings create() => DraftSettings();

  @override
  bool operator ==(Object other) {
    return other is DraftSettingsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$draftSettingsHash() => r'c1fc2d8f98e9bb47fa8ae3571a228cc804b3b1b8';

final class DraftSettingsFamily extends $Family
    with
        $ClassFamilyOverride<
          DraftSettings,
          AsyncValue<model.DraftSettings?>,
          model.DraftSettings?,
          FutureOr<model.DraftSettings?>,
          String
        > {
  const DraftSettingsFamily._()
    : super(
        retry: null,
        name: r'draftSettingsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  DraftSettingsProvider call(String leagueId) =>
      DraftSettingsProvider._(argument: leagueId, from: this);

  @override
  String toString() => r'draftSettingsProvider';
}

abstract class _$DraftSettings extends $AsyncNotifier<model.DraftSettings?> {
  late final _$args = ref.$arg as String;
  String get leagueId => _$args;

  FutureOr<model.DraftSettings?> build(String leagueId);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref =
        this.ref
            as $Ref<AsyncValue<model.DraftSettings?>, model.DraftSettings?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<model.DraftSettings?>,
                model.DraftSettings?
              >,
              AsyncValue<model.DraftSettings?>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
