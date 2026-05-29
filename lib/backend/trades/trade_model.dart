import 'package:freezed_annotation/freezed_annotation.dart';

part 'trade_model.freezed.dart';
part 'trade_model.g.dart';

@freezed
sealed class TradePlayer with _$TradePlayer {
  const factory TradePlayer({
    required String id,
    required String name,
    @Default('') String image,
  }) = _TradePlayer;

  factory TradePlayer.fromJson(Map<String, dynamic> json) =>
      _$TradePlayerFromJson(json);
}

@freezed
sealed class Trade with _$Trade {
  const factory Trade({
    required String id,
    required String status,
    @JsonKey(name: 'proposer_fantasy_team_id') required String proposerTeamId,
    @JsonKey(name: 'recipient_fantasy_team_id') required String recipientTeamId,
    @JsonKey(name: 'from_team') required String fromTeam,
    @JsonKey(name: 'to_team') required String toTeam,
    @JsonKey(name: 'offered_players') @Default([]) List<TradePlayer> offeredPlayers,
    @JsonKey(name: 'requested_players') @Default([]) List<TradePlayer> requestedPlayers,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'responded_at') String? respondedAt,
  }) = _Trade;

  factory Trade.fromJson(Map<String, dynamic> json) => _$TradeFromJson(json);
}
