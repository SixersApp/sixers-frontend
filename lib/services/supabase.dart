import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/models.dart';

part 'supabase.g.dart';

@riverpod
Future<List<Player>> playersFuture(Ref ref) async {
  final supabase = Supabase.instance.client;
  final data =
      await supabase.from('players').select('*, tournaments(*), real_teams(*)');
  return (data as List).map((e) => Player.fromJson(e)).toList();
}

@riverpod
Future<List<DeviceToken>> deviceTokensFuture(Ref ref) async {
  final supabase = Supabase.instance.client;
  final data = await supabase.from('device_tokens').select();
  return (data as List).map((e) => DeviceToken.fromJson(e)).toList();
}

@riverpod
Future<List<DraftPick>> draftPicksFuture(Ref ref) async {
  final supabase = Supabase.instance.client;
  final data = await supabase.from('draft_picks').select();
  return (data as List).map((e) => DraftPick.fromJson(e)).toList();
}

@riverpod
Future<List<FantasyTeamInstance>> fantasyTeamInstancesFuture(Ref ref) async {
  final supabase = Supabase.instance.client;
  final data = await supabase.from('fantasy_team_instance').select();
  return (data as List)
      .map((e) => FantasyTeamInstance.fromJson(e))
      .toList();
}

@riverpod
Future<List<FantasyTeamPlayer>> fantasyTeamPlayersFuture(Ref ref) async {
  final supabase = Supabase.instance.client;
  final data = await supabase.from('fantasy_team_players').select();
  return (data as List)
      .map((e) => FantasyTeamPlayer.fromJson(e))
      .toList();
}

@riverpod
Future<List<FantasyTeam>> fantasyTeamsFuture(Ref ref) async {
  final supabase = Supabase.instance.client;
  final data = await supabase.from('fantasy_teams').select();
  return (data as List).map((e) => FantasyTeam.fromJson(e)).toList();
}

@riverpod
Future<List<LeagueDraftSetting>> leagueDraftSettingsFuture(Ref ref) async {
  final supabase = Supabase.instance.client;
  final data = await supabase.from('league_draft_settings').select();
  return (data as List)
      .map((e) => LeagueDraftSetting.fromJson(e))
      .toList();
}

@riverpod
Future<List<LeagueDraftState>> leagueDraftStatesFuture(Ref ref) async {
  final supabase = Supabase.instance.client;
  final data = await supabase.from('league_draft_state').select();
  return (data as List)
      .map((e) => LeagueDraftState.fromJson(e))
      .toList();
}

@riverpod
Future<List<LeaguePositionRule>> leaguePositionRulesFuture(Ref ref) async {
  final supabase = Supabase.instance.client;
  final data = await supabase.from('league_position_rules').select();
  return (data as List)
      .map((e) => LeaguePositionRule.fromJson(e))
      .toList();
}

@riverpod
Future<List<League>> leaguesFuture(Ref ref) async {
  final supabase = Supabase.instance.client;
  final data = await supabase.from('leagues').select();
  return (data as List).map((e) => League.fromJson(e)).toList();
}

@riverpod
Future<List<MatchModel>> matchesFuture(Ref ref) async {
  final supabase = Supabase.instance.client;
  final data = await supabase.from('matches').select();
  return (data as List).map((e) => MatchModel.fromJson(e)).toList();
}

@riverpod
Future<List<Matchup>> matchupsFuture(Ref ref) async {
  final supabase = Supabase.instance.client;
  final data = await supabase.from('matchups').select();
  return (data as List).map((e) => Matchup.fromJson(e)).toList();
}

@riverpod
Future<List<NotificationModel>> notificationsFuture(Ref ref) async {
  final supabase = Supabase.instance.client;
  final data = await supabase.from('notifications').select();
  return (data as List)
      .map((e) => NotificationModel.fromJson(e))
      .toList();
}

@riverpod
Future<List<PlayerStat>> playerStatsFuture(Ref ref) async {
  final supabase = Supabase.instance.client;
  final data = await supabase.from('player_stats').select();
  return (data as List).map((e) => PlayerStat.fromJson(e)).toList();
}

@riverpod
Future<List<Profile>> profilesFuture(Ref ref) async {
  final supabase = Supabase.instance.client;
  final data = await supabase.from('profiles').select();
  return (data as List).map((e) => Profile.fromJson(e)).toList();
}

@riverpod
Future<List<RealTeam>> realTeamsFuture(Ref ref) async {
  final supabase = Supabase.instance.client;
  final data = await supabase.from('real_teams').select();
  return (data as List).map((e) => RealTeam.fromJson(e)).toList();
}

@riverpod
Future<List<ScoringRule>> scoringRulesFuture(Ref ref) async {
  final supabase = Supabase.instance.client;
  final data = await supabase.from('scoring_rules').select();
  return (data as List).map((e) => ScoringRule.fromJson(e)).toList();
}

@riverpod
Future<List<Tournament>> tournamentsFuture(Ref ref) async {
  final supabase = Supabase.instance.client;
  final data = await supabase.from('tournaments').select();
  return (data as List).map((e) => Tournament.fromJson(e)).toList();
}

@riverpod
Future<List<TradeOfferedPlayer>> tradeOfferedPlayersFuture(Ref ref) async {
  final supabase = Supabase.instance.client;
  final data = await supabase.from('trade_offered_players').select();
  return (data as List)
      .map((e) => TradeOfferedPlayer.fromJson(e))
      .toList();
}

@riverpod
Future<List<TradeRequestedPlayer>> tradeRequestedPlayersFuture(Ref ref) async {
  final supabase = Supabase.instance.client;
  final data = await supabase.from('trade_requested_players').select();
  return (data as List)
      .map((e) => TradeRequestedPlayer.fromJson(e))
      .toList();
}

@riverpod
Future<List<Trade>> tradesFuture(Ref ref) async {
  final supabase = Supabase.instance.client;
  final data = await supabase.from('trades').select();
  return (data as List).map((e) => Trade.fromJson(e)).toList();
}
