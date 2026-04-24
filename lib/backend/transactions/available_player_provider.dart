import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'available_player_model.dart';
import 'available_player_service.dart';

part 'available_player_provider.g.dart';

class AvailablePlayersState {
  final List<AvailablePlayer> players;
  final bool isLoading;
  final bool hasMore;
  final String? error;

  const AvailablePlayersState({
    this.players = const [],
    this.isLoading = false,
    this.hasMore = true,
    this.error,
  });

  AvailablePlayersState copyWith({
    List<AvailablePlayer>? players,
    bool? isLoading,
    bool? hasMore,
    String? error,
  }) =>
      AvailablePlayersState(
        players: players ?? this.players,
        isLoading: isLoading ?? this.isLoading,
        hasMore: hasMore ?? this.hasMore,
        error: error,
      );
}

@riverpod
class AvailablePlayers extends _$AvailablePlayers {
  static const _pageSize = 50;
  final _service = AvailablePlayerService();

  @override
  AvailablePlayersState build(String leagueId) {
    Future.microtask(() => fetchNextPage());
    return const AvailablePlayersState(isLoading: true);
  }

  Future<void> fetchNextPage() async {
    final current = state;
    if (current.isLoading && current.players.isNotEmpty) return;
    if (!current.hasMore) return;

    state = current.copyWith(isLoading: true);

    try {
      final newPlayers = await _service.fetchAvailablePlayers(
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
    state = const AvailablePlayersState(isLoading: true);
    Future.microtask(() => fetchNextPage());
  }
}
