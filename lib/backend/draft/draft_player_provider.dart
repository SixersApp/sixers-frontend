import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'draft_player_model.dart';
import 'draft_player_service.dart';

part 'draft_player_provider.g.dart';

class DraftPlayersState {
  final List<DraftPlayer> players;
  final bool isLoading;
  final bool hasMore;
  final String? error;

  const DraftPlayersState({
    this.players = const [],
    this.isLoading = false,
    this.hasMore = true,
    this.error,
  });

  DraftPlayersState copyWith({
    List<DraftPlayer>? players,
    bool? isLoading,
    bool? hasMore,
    String? error,
  }) =>
      DraftPlayersState(
        players: players ?? this.players,
        isLoading: isLoading ?? this.isLoading,
        hasMore: hasMore ?? this.hasMore,
        error: error,
      );
}

@riverpod
class DraftPlayers extends _$DraftPlayers {
  static const _pageSize = 50;
  final _service = DraftPlayerService();

  @override
  DraftPlayersState build(String leagueId) {
    Future.microtask(() => fetchNextPage());
    return const DraftPlayersState(isLoading: true);
  }

  Future<void> fetchNextPage() async {
    final current = state;
    if (current.isLoading && current.players.isNotEmpty) return;
    if (!current.hasMore) return;

    state = current.copyWith(isLoading: true);

    try {
      final newPlayers = await _service.fetchPlayers(
        leagueId: leagueId,
        limit: _pageSize,
        offset: current.players.length,
      );

      state = state.copyWith(
        players: [...state.players, ...newPlayers],
        isLoading: false,
        hasMore: newPlayers.length >= _pageSize,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString().replaceFirst('Exception: ', ''),
      );
    }
  }

  void reset() {
    state = const DraftPlayersState(isLoading: true);
    Future.microtask(() => fetchNextPage());
  }
}
