import 'package:freezed_annotation/freezed_annotation.dart';

part 'waiver_model.freezed.dart';
part 'waiver_model.g.dart';

double _ppgFromJson(dynamic value) {
  if (value == null) return 0.0;
  if (value is num) return value.toDouble();
  if (value is String) return double.tryParse(value) ?? 0.0;
  return 0.0;
}

@freezed
sealed class WaiverPlayer with _$WaiverPlayer {
  const factory WaiverPlayer({
    required String id,
    @Default('') String name,
    @Default('') String role,
    @Default('') String image,
    @JsonKey(fromJson: _ppgFromJson) @Default(0.0) double ppg,
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
