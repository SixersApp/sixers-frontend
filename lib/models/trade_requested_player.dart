import 'package:freezed_annotation/freezed_annotation.dart';

part 'trade_requested_player.freezed.dart';
part 'trade_requested_player.g.dart';

@freezed
class TradeRequestedPlayer with _$TradeRequestedPlayer {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory TradeRequestedPlayer({
    required String tradeId,
    required String playerId,
  }) = _TradeRequestedPlayer;

  factory TradeRequestedPlayer.fromJson(Map<String, dynamic> json) =>
      _$TradeRequestedPlayerFromJson(json);
}
