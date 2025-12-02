
import 'package:sixers/backend/auth/dio_client.dart';
import 'package:sixers/backend/scoring_rule/scoring_rule_model.dart';

class ScoringRuleService {
  Future<List<ScoringRule>> getScoringRules(String ftiId) async {
    try {
      final res = await ApiClient.dio.get(
        "/league/scoringRules/$ftiId",
      );

      final list = (res.data as List<dynamic>)
          .map((json) => ScoringRule.fromJson(json))
          .toList();

      return list;
    } catch (e) {
      rethrow;
    }
  }
}