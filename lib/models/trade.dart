import 'package:freezed_annotation/freezed_annotation.dart';

part 'trade.freezed.dart';
part 'trade.g.dart';

@freezed
class Trade with _$Trade {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Trade({
    required String id,
    required String leagueId,
    required String proposerTeamId,
    required String recipientTeamId,
    required String status,
    required DateTime createdAt,
    DateTime? expiresAt,
    String? response,
    DateTime? respondedAt,
  }) = _Trade;

  factory Trade.fromJson(Map<String, dynamic> json) => _$TradeFromJson(json);
}
