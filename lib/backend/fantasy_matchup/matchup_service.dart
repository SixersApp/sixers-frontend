import '../auth/dio_client.dart';
import 'matchup_model.dart';

class MatchupService {
  final _dio = ApiClient.dio;

  Future<List<Matchup>> getMatchups({required int matchNum}) async {
    final res = await _dio.get("/matchups", queryParameters: {
      "match_num": matchNum,
    });

    if (res.statusCode != 200 || res.data is! List) return [];

    return (res.data as List)
        .map((e) => Matchup.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}