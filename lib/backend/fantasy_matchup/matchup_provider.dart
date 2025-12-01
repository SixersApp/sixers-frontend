import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sixers/backend/auth/auth_provider.dart';
import 'package:sixers/backend/fantasy_matchup/matchup_model.dart';
import 'package:sixers/backend/fantasy_matchup/matchup_service.dart';

part 'matchup_provider.g.dart';

@riverpod
Future<List<Matchup>> userMatchups(
  Ref ref, {
  required int matchNum,
}) async {
  // Read auth session
  final authAsync = ref.watch(authProviderProvider);

  // Wait for auth to load
  if (authAsync.isLoading) {
    return [];
  }

  final session = authAsync.value;
  if (session == null) {
    return []; // user not logged in
  }

  final userId = session.userId;
  if (userId.isEmpty) return [];

  final service = MatchupService();

  return service.getMatchups(
    matchNum: matchNum,
  );
}