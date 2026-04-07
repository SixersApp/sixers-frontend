import 'package:dio/dio.dart';
import 'package:sixers/backend/auth/dio_client.dart';
import 'package:sixers/utils/logger.dart';
import 'active_match_model.dart';

class ActiveMatchService {
  final Dio _dio = ApiClient.dio;

  Future<List<ActiveMatch>> fetchActiveMatches() async {
    final response = await _dio.get("/matches/active");
    if (response.data is! List) {
      logError('ActiveMatchService: expected List but got ${response.data.runtimeType}: ${response.data}');
      return [];
    }

    final data = response.data as List;
    final results = <ActiveMatch>[];
    for (var i = 0; i < data.length; i++) {
      try {
        results.add(ActiveMatch.fromJson(data[i] as Map<String, dynamic>));
      } catch (e, st) {
        logError('ActiveMatchService: failed to parse match at index $i: $e\nraw: ${data[i]}', st);
      }
    }
    return results;
  }
}
