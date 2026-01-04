import 'package:dio/dio.dart';
import 'package:sixers/backend/auth/dio_client.dart';
import 'package:sixers/backend/match/feed_group_model.dart';
import 'match_model.dart';

class MatchService {
  final Dio _dio;

  MatchService() : _dio = ApiClient.dio;

  /// Get home feed matches (list)
  Future<List<FeedGroupModel>> fetchHomeFeed() async {
    final response = await _dio.get("/matches/feed");

    final data = response.data as List;
    return data.map((e) => FeedGroupModel.fromJson(e["tournament_data"])).toList();
  }

  /// Get match by ID (single)
  Future<MatchModel> fetchMatchById(String id) async {
    final response = await _dio.get("/matches/$id");

    return MatchModel.fromJson(response.data);
  }
}