// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'draft_state_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(draftStateStream)
const draftStateStreamProvider = DraftStateStreamFamily._();

final class DraftStateStreamProvider
    extends
        $FunctionalProvider<
          AsyncValue<DraftState?>,
          DraftState?,
          Stream<DraftState?>
        >
    with $FutureModifier<DraftState?>, $StreamProvider<DraftState?> {
  const DraftStateStreamProvider._({
    required DraftStateStreamFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'draftStateStreamProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$draftStateStreamHash();

  @override
  String toString() {
    return r'draftStateStreamProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $StreamProviderElement<DraftState?> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<DraftState?> create(Ref ref) {
    final argument = this.argument as String;
    return draftStateStream(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is DraftStateStreamProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$draftStateStreamHash() => r'97aac7e8ebac0d765fd9b1fcebc1454af3804593';

final class DraftStateStreamFamily extends $Family
    with $FunctionalFamilyOverride<Stream<DraftState?>, String> {
  const DraftStateStreamFamily._()
    : super(
        retry: null,
        name: r'draftStateStreamProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  DraftStateStreamProvider call(String leagueId) =>
      DraftStateStreamProvider._(argument: leagueId, from: this);

  @override
  String toString() => r'draftStateStreamProvider';
}
