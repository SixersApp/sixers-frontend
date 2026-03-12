import 'dart:async';
import 'dart:convert';

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:sixers/backend/draft/draft_pick_result_model.dart';
import 'package:sixers/backend/draft/draft_start_result_model.dart';
import 'package:sixers/backend/draft_pick/draft_pick_model.dart';
import 'package:sixers/backend/draft_state/draft_state_model.dart';
import 'package:sixers/utils/logger.dart';

class AppSyncDraftService {
  static const String _apiName = 'DraftAPI';

  // ── Queries ──────────────────────────────────────────────────────────

  static const String _getDraftPicksDoc = '''
    query GetDraftPicks(\$leagueId: String!) {
      getDraftPicks(leagueId: \$leagueId) {
        teamId
        playerId
        roundNumber
        pickNumber
        leagueId
        timestamp
      }
    }
  ''';

  static const String _getDraftStateDoc = '''
    query GetDraftState(\$leagueId: String!) {
      getDraftState(leagueId: \$leagueId) {
        leagueId
        picks {
          teamId
          playerId
          roundNumber
          pickNumber
          leagueId
          timestamp
        }
        currentTeamId
        currentRound
        currentPick
        pickExpiresAt
        status
      }
    }
  ''';

  // ── Mutations ────────────────────────────────────────────────────────

  static const String _startDraftDoc = '''
    mutation StartDraft(\$input: StartDraftInput!) {
      startDraft(input: \$input) {
        leagueId
        currentTeamId
        currentRound
        currentPick
        pickExpiresAt
        draftOrder {
          teamId
          order
        }
      }
    }
  ''';

  static const String _postDraftPickDoc = '''
    mutation PostDraftPick(\$input: DraftPickInput!) {
      postDraftPick(input: \$input) {
        pick {
          teamId
          playerId
          roundNumber
          pickNumber
          leagueId
          timestamp
        }
        leagueId
        nextTeamId
        nextPickExpiresAt
      }
    }
  ''';

  // ── Subscriptions ────────────────────────────────────────────────────

  static const String _onDraftPickDoc = '''
    subscription OnDraftPick(\$leagueId: String!) {
      onDraftPick(leagueId: \$leagueId) {
        pick {
          teamId
          playerId
          roundNumber
          pickNumber
          leagueId
          timestamp
        }
        leagueId
        nextTeamId
        nextPickExpiresAt
      }
    }
  ''';

  static const String _onDraftStartDoc = '''
    subscription OnDraftStart(\$leagueId: String!) {
      onDraftStart(leagueId: \$leagueId) {
        leagueId
        currentTeamId
        currentRound
        currentPick
        pickExpiresAt
        draftOrder {
          teamId
          order
        }
      }
    }
  ''';

  // ── Query Methods ────────────────────────────────────────────────────

  Future<List<DraftPick>> getDraftPicks(String leagueId) async {
    final request = GraphQLRequest<String>(
      document: _getDraftPicksDoc,
      variables: {'leagueId': leagueId},
      apiName: _apiName,
    );

    final response = await Amplify.API.query(request: request).response;

    if (response.errors.isNotEmpty) {
      logError('getDraftPicks errors: ${response.errors}');
      throw Exception(response.errors.first.message);
    }

    final data = jsonDecode(response.data!) as Map<String, dynamic>;
    final picks = data['getDraftPicks'] as List<dynamic>;
    return picks
        .map((p) => DraftPick.fromGraphQL(p as Map<String, dynamic>))
        .toList();
  }

  Future<DraftState?> getDraftState(String leagueId) async {
    final request = GraphQLRequest<String>(
      document: _getDraftStateDoc,
      variables: {'leagueId': leagueId},
      apiName: _apiName,
    );

    final response = await Amplify.API.query(request: request).response;

    if (response.errors.isNotEmpty) {
      logError('getDraftState errors: ${response.errors}');
      throw Exception(response.errors.first.message);
    }

    final data = jsonDecode(response.data!) as Map<String, dynamic>;
    final stateJson = data['getDraftState'];
    if (stateJson == null) return null;
    return DraftState.fromGraphQL(stateJson as Map<String, dynamic>);
  }

  // ── Mutation Methods ─────────────────────────────────────────────────

  Future<DraftStartResult> startDraft({
    required String leagueId,
    required List<Map<String, dynamic>> draftOrder,
  }) async {
    final request = GraphQLRequest<String>(
      document: _startDraftDoc,
      variables: {
        'input': {
          'leagueId': leagueId,
          'draftOrder': draftOrder,
        },
      },
      apiName: _apiName,
    );

    final response = await Amplify.API.mutate(request: request).response;

    if (response.errors.isNotEmpty) {
      logError('startDraft errors: ${response.errors}');
      throw Exception(response.errors.first.message);
    }

    final data = jsonDecode(response.data!) as Map<String, dynamic>;
    return DraftStartResult.fromJson(
        data['startDraft'] as Map<String, dynamic>);
  }

  Future<DraftPickResult> postDraftPick({
    required String teamId,
    required String playerId,
    required int roundNumber,
    required int pickNumber,
    required String leagueId,
  }) async {
    final request = GraphQLRequest<String>(
      document: _postDraftPickDoc,
      variables: {
        'input': {
          'teamId': teamId,
          'playerId': playerId,
          'roundNumber': roundNumber,
          'pickNumber': pickNumber,
          'leagueId': leagueId,
        },
      },
      apiName: _apiName,
    );

    final response = await Amplify.API.mutate(request: request).response;

    if (response.errors.isNotEmpty) {
      logError('postDraftPick errors: ${response.errors}');
      throw Exception(response.errors.first.message);
    }

    final data = jsonDecode(response.data!) as Map<String, dynamic>;
    return DraftPickResult.fromJson(
        data['postDraftPick'] as Map<String, dynamic>);
  }

  // ── Subscription Methods ─────────────────────────────────────────────

  Stream<DraftPickResult> onDraftPick(String leagueId) {
    final request = GraphQLRequest<String>(
      document: _onDraftPickDoc,
      variables: {'leagueId': leagueId},
      apiName: _apiName,
    );

    final operation = Amplify.API.subscribe(
      request,
      onEstablished: () {
        logInfo('onDraftPick subscription established for league: $leagueId');
      },
    );

    return operation.map((event) {
      if (event.hasErrors) {
        logError('onDraftPick subscription error: ${event.errors}');
        throw Exception(event.errors.first.message);
      }
      final data = jsonDecode(event.data!) as Map<String, dynamic>;
      return DraftPickResult.fromJson(
          data['onDraftPick'] as Map<String, dynamic>);
    });
  }

  Stream<DraftStartResult> onDraftStart(String leagueId) {
    final request = GraphQLRequest<String>(
      document: _onDraftStartDoc,
      variables: {'leagueId': leagueId},
      apiName: _apiName,
    );

    final operation = Amplify.API.subscribe(
      request,
      onEstablished: () {
        logInfo('onDraftStart subscription established for league: $leagueId');
      },
    );

    return operation.map((event) {
      if (event.hasErrors) {
        logError('onDraftStart subscription error: ${event.errors}');
        throw Exception(event.errors.first.message);
      }
      final data = jsonDecode(event.data!) as Map<String, dynamic>;
      return DraftStartResult.fromJson(
          data['onDraftStart'] as Map<String, dynamic>);
    });
  }
}
