import 'package:sixers/backend/fantasy_team/fantasy_team_model.dart';

/// Returns [teams] ordered by leaderboard rules:
/// 1. wins desc
/// 2. losses asc
/// 3. avg_points_per_game desc
///
/// Missing fields are treated as zero so unranked teams sort last.
List<FantasyTeam> sortedStandings(List<FantasyTeam> teams) {
  final copy = [...teams];
  copy.sort((a, b) {
    final aw = a.wins ?? 0;
    final bw = b.wins ?? 0;
    if (aw != bw) return bw.compareTo(aw);

    final al = a.losses ?? 0;
    final bl = b.losses ?? 0;
    if (al != bl) return al.compareTo(bl);

    final aAvg = a.avgPointsPerGame ?? 0;
    final bAvg = b.avgPointsPerGame ?? 0;
    return bAvg.compareTo(aAvg);
  });
  return copy;
}

/// Builds a `teamId -> rank (1-based)` map from the team list.
Map<String, int> rankByTeamId(List<FantasyTeam> teams) {
  final sorted = sortedStandings(teams);
  return {
    for (var i = 0; i < sorted.length; i++) sorted[i].id: i + 1,
  };
}
