import 'package:dio/dio.dart';
import 'package:sixers/backend/auth/dio_client.dart';
import 'package:sixers/backend/leagues/league_model.dart';

class LeagueService {
  final Dio _dio = ApiClient.dio;

  Future<List<League>> getLeagues() async {
    final res = await _dio.get("/leagues");

    if (res.statusCode != 200) return [];

    final list = res.data as List<dynamic>;
    return list.map((json) => League.fromJson(json)).toList();
  }
}