import 'package:freezed_annotation/freezed_annotation.dart';

part 'trade_offered_player.freezed.dart';
part 'trade_offered_player.g.dart';

@freezed
class TradeOfferedPlayer with _$TradeOfferedPlayer {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory TradeOfferedPlayer({
    required String tradeId,
    required String playerId,
  }) = _TradeOfferedPlayer;

  factory TradeOfferedPlayer.fromJson(Map<String, dynamic> json) =>
      _$TradeOfferedPlayerFromJson(json);
}
