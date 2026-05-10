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
  proposerTeamId: json['proposer_fantasy_team_id'] as String,
  recipientTeamId: json['recipient_fantasy_team_id'] as String,
  fromTeam: json['from_team'] as String,
  toTeam: json['to_team'] as String,
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
  createdAt: json['created_at'] as String,
  respondedAt: json['responded_at'] as String?,
);

Map<String, dynamic> _$TradeToJson(_Trade instance) => <String, dynamic>{
  'id': instance.id,
  'status': instance.status,
  'proposer_fantasy_team_id': instance.proposerTeamId,
  'recipient_fantasy_team_id': instance.recipientTeamId,
  'from_team': instance.fromTeam,
  'to_team': instance.toTeam,
  'offered_players': instance.offeredPlayers,
  'requested_players': instance.requestedPlayers,
  'created_at': instance.createdAt,
  'responded_at': instance.respondedAt,
};
