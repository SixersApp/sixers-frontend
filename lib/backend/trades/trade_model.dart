import 'package:freezed_annotation/freezed_annotation.dart';

part 'trade_model.freezed.dart';
part 'trade_model.g.dart';

@freezed
sealed class TradePlayer with _$TradePlayer {
  const factory TradePlayer({
    required String id,
    required String name,
  }) = _TradePlayer;

  factory TradePlayer.fromJson(Map<String, dynamic> json) =>
      _$TradePlayerFromJson(json);
}

@freezed
sealed class Trade with _$Trade {
  const factory Trade({
    required String id,
    required String status,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'expires_at') String? expiresAt,
    @JsonKey(name: 'responded_at') String? respondedAt,
    @JsonKey(name: 'from_team') required String fromTeam,
    @JsonKey(name: 'to_team') required String toTeam,
    @JsonKey(name: 'proposer_name') String? proposerName,
    @JsonKey(name: 'recipient_name') String? recipientName,
    @JsonKey(name: 'offered_players') @Default([]) List<TradePlayer> offeredPlayers,
    @JsonKey(name: 'requested_players') @Default([]) List<TradePlayer> requestedPlayers,
  }) = _Trade;

  factory Trade.fromJson(Map<String, dynamic> json) => _$TradeFromJson(json);
}
