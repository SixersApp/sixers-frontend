import '../auth/dio_client.dart';
import 'matchup_model.dart';

class MatchupService {
  Future<List<Matchup>> getUserMatchups(int matchNum) async {
    final res = await ApiClient.dio.get(
      "/matchups/match_num",
      queryParameters: { "match_num": matchNum },
    );
    return (res.data as List)
        .map((e) => Matchup.fromJson(e))
        .toList();
  }
}