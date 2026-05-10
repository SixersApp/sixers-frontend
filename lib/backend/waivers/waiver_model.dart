import 'package:freezed_annotation/freezed_annotation.dart';

part 'waiver_model.freezed.dart';
part 'waiver_model.g.dart';

@freezed
sealed class WaiverPlayer with _$WaiverPlayer {
  const factory WaiverPlayer({
    required String id,
    @Default('') String name,
    @Default('') String role,
    @JsonKey(name: 'match_status') @Default('NS') String matchStatus,
  }) = _WaiverPlayer;

  factory WaiverPlayer.fromJson(Map<String, dynamic> json) =>
      _$WaiverPlayerFromJson(json);
}

class WaiverPage {
  final List<WaiverPlayer> players;
  final int page;
  final int totalPages;
  final int total;

  const WaiverPage({
    required this.players,
    required this.page,
    required this.totalPages,
    required this.total,
  });

  factory WaiverPage.empty() =>
      const WaiverPage(players: [], page: 1, totalPages: 1, total: 0);
}
