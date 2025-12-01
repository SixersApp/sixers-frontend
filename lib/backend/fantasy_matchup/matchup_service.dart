import 'package:sixers/backend/fantasy_matchup/matchup_model.dart';
import 'package:sixers/backend/auth/dio_client.dart';

class MatchupService {
  Future<List<Matchup>> getMatchups({
    required int matchNum
  }) async {
    final res = await ApiClient.dio.get(
      "/matchups",
      queryParameters: {"match_num": matchNum},
    );

    final List data = res.data as List;
    return data.map((e) => Matchup.fromJson(e)).toList();
  }
}