import 'package:dio/dio.dart';
import 'package:sixers/backend/auth/dio_client.dart';
import 'match_model.dart';

class MatchService {
  final Dio _dio;

  MatchService() : _dio = ApiClient.dio;

  /// Get home feed matches (list)
  Future<List<MatchModel>> fetchHomeFeed() async {
    final response = await _dio.get("/matches/homeFeed");

    final data = response.data as List;
    return data.map((e) => MatchModel.fromJson(e)).toList();
  }

  /// Get match by ID (single)
  Future<MatchModel> fetchMatchById(String id) async {
    final response = await _dio.get("/matches/$id");

    return MatchModel.fromJson(response.data);
  }
}