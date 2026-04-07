import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../auth/auth_provider.dart';
import 'matchup_model.dart';
import 'matchup_service.dart';

part 'matchup_provider.g.dart';

@riverpod
class UserMatchups extends _$UserMatchups {
  @override
  Future<List<LeagueMatchupGroup>> build() async {
    final auth = await ref.watch(authProviderProvider.future);
    if (auth == null) return [];

    return MatchupService().getMatchups();
  }

  Future<void> refresh() async {
    final auth = await ref.watch(authProviderProvider.future);

    final newState = await AsyncValue.guard(() async {
      if (auth == null) return <LeagueMatchupGroup>[];
      return MatchupService().getMatchups();
    });

    state = newState;
  }
}

@riverpod
Future<WeekMatchupGroup?> weekMatchups(
  Ref ref,
  String leagueId,
  int matchNum,
) async {
  final auth = await ref.watch(authProviderProvider.future);
  if (auth == null) return null;

  return MatchupService().getWeekMatchups(leagueId, matchNum);
}
