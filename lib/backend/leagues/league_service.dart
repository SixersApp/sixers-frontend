import 'package:sixers/backend/auth/dio_client.dart';
import 'league_model.dart';

class LeagueService {
  final _dio = ApiClient.dio;

  Future<List<League>> getLeagues() async {
    final res = await _dio.get("/leagues");

    if (res.statusCode != 200 || res.data is! List) return [];

    return (res.data as List)
        .map((e) => League.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}