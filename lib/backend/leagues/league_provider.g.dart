// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'league_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$leaguesHash() => r'0eff00259ad6fbcffd52ae9166ad91b96207a194';

/// See also [Leagues].
@ProviderFor(Leagues)
final leaguesProvider =
    AutoDisposeAsyncNotifierProvider<Leagues, List<League>>.internal(
      Leagues.new,
      name: r'leaguesProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$leaguesHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$Leagues = AutoDisposeAsyncNotifier<List<League>>;
String _$leagueActionsHash() => r'df225bb98f1cfc5cadf552cc4285a8be5bb93daa';

/// See also [LeagueActions].
@ProviderFor(LeagueActions)
final leagueActionsProvider =
    AutoDisposeNotifierProvider<LeagueActions, void>.internal(
      LeagueActions.new,
      name: r'leagueActionsProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$leagueActionsHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$LeagueActions = AutoDisposeNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
