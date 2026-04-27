// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trade_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TradePlayer _$TradePlayerFromJson(Map<String, dynamic> json) =>
    _TradePlayer(id: json['id'] as String, name: json['name'] as String);

Map<String, dynamic> _$TradePlayerToJson(_TradePlayer instance) =>
    <String, dynamic>{'id': instance.id, 'name': instance.name};

_Trade _$TradeFromJson(Map<String, dynamic> json) => _Trade(
  id: json['id'] as String,
  status: json['status'] as String,
  createdAt: json['created_at'] as String,
  expiresAt: json['expires_at'] as String?,
  respondedAt: json['responded_at'] as String?,
  fromTeam: json['from_team'] as String,
  toTeam: json['to_team'] as String,
  proposerName: json['proposer_name'] as String?,
  recipientName: json['recipient_name'] as String?,
  offeredPlayers:
      (json['offered_players'] as List<dynamic>?)
          ?.map((e) => TradePlayer.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  requestedPlayers:
      (json['requested_players'] as List<dynamic>?)
          ?.map((e) => TradePlayer.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$TradeToJson(_Trade instance) => <String, dynamic>{
  'id': instance.id,
  'status': instance.status,
  'created_at': instance.createdAt,
  'expires_at': instance.expiresAt,
  'responded_at': instance.respondedAt,
  'from_team': instance.fromTeam,
  'to_team': instance.toTeam,
  'proposer_name': instance.proposerName,
  'recipient_name': instance.recipientName,
  'offered_players': instance.offeredPlayers,
  'requested_players': instance.requestedPlayers,
};
