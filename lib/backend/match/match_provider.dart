import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sixers/backend/auth/auth_provider.dart';
import 'match_service.dart';
import 'match_model.dart';

part 'match_provider.g.dart';

@riverpod
class MatchFeed extends _$MatchFeed {
  late final MatchService _service;

  @override
  Future<List<MatchModel>> build({String? matchId}) async {
    final auth = await ref.watch(authProviderProvider.future);

    if (auth == null || auth.idToken == null) {
      return [];
    }

    _service = MatchService();

    // FEED MODE
    if (matchId == null) {
      return await _service.fetchHomeFeed();
    }

    // SPECIFIC MATCH MODE
    final match = await _service.fetchMatchById(matchId);
    return [match];
  }

  /// Force refresh feed
  Future<void> refreshFeed() async {
    state = const AsyncLoading();
    state = AsyncData(await _service.fetchHomeFeed());
  }

  /// Force refresh one match
  Future<void> refreshMatch(String matchId) async {
    state = const AsyncLoading();
    final data = await _service.fetchMatchById(matchId);
    state = AsyncData([data]);
  }
}