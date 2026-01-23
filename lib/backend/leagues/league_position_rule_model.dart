import 'package:freezed_annotation/freezed_annotation.dart';

part 'league_position_rule_model.freezed.dart';
part 'league_position_rule_model.g.dart';

@freezed
sealed class LeaguePositionRule with _$LeaguePositionRule {
  const factory LeaguePositionRule({
    @JsonKey(name: "id") required String id,
    @JsonKey(name: "league_id") required String leagueId,
    @JsonKey(name: "min_count") required int minCount,
    @JsonKey(name: "max_count") required int maxCount,
    @JsonKey(name: "roles") required List<String> roles,
    @JsonKey(name: "role_details") required List<PositionDetail> roleDetails,
  }) = _LeaguePositionRule;

  factory LeaguePositionRule.fromJson(Map<String, dynamic> json) =>
      _$LeaguePositionRuleFromJson(json);
}

@freezed
sealed class PositionDetail with _$PositionDetail {
  const factory PositionDetail({
    @JsonKey(name: "id") required String id,
    @JsonKey(name: "name") required String name,
  }) = _PositionDetail;

  factory PositionDetail.fromJson(Map<String, dynamic> json) =>
      _$PositionDetailFromJson(json);
}

/// Position types enum for type safety
enum PositionType {
  batsman,
  bowler,
  allRounder,
  wicketKeeper,
  flex,
  bench;

  String get apiValue {
    switch (this) {
      case PositionType.batsman:
        return 'batsman';
      case PositionType.bowler:
        return 'bowler';
      case PositionType.allRounder:
        return 'all_rounder';
      case PositionType.wicketKeeper:
        return 'wicket_keeper';
      case PositionType.flex:
        return 'flex';
      case PositionType.bench:
        return 'bench';
    }
  }

  String get displayName {
    switch (this) {
      case PositionType.batsman:
        return 'BATTING';
      case PositionType.bowler:
        return 'BOWLING';
      case PositionType.allRounder:
        return 'ALL-ROUNDERS';
      case PositionType.wicketKeeper:
        return 'WICKET-KEEPERS';
      case PositionType.flex:
        return 'FLEX';
      case PositionType.bench:
        return 'BENCH';
    }
  }

  static PositionType? fromApiValue(String value) {
    switch (value.toLowerCase()) {
      case 'batsman':
      case 'batting':
        return PositionType.batsman;
      case 'bowler':
      case 'bowling':
        return PositionType.bowler;
      case 'all_rounder':
      case 'allrounder':
      case 'all-rounder':
        return PositionType.allRounder;
      case 'wicket_keeper':
      case 'wicketkeeper':
      case 'wicket-keeper':
        return PositionType.wicketKeeper;
      case 'flex':
        return PositionType.flex;
      case 'bench':
        return PositionType.bench;
      default:
        return null;
    }
  }
}

