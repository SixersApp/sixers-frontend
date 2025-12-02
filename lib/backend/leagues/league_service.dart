import 'package:sixers/backend/auth/dio_client.dart';
import 'league_model.dart';

class LeagueService {
  Future<List<League>> getLeagues() async {
    final res = await ApiClient.dio.get("/leagues");
    final data = res.data as List;
    return data.map((json) => League.fromJson(json)).toList();
  }
}