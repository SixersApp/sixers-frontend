
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sixers/backend/match/match_model.dart';

part 'feed_group_model.g.dart';
part 'feed_group_model.freezed.dart';

@freezed
sealed class FeedGroupModel with _$FeedGroupModel {
  const factory FeedGroupModel({
    @JsonKey(name: 'tournament_id') required String tournamentId,
    @JsonKey(name: 'tournament_name') required String tournamentName,
    @JsonKey(name: 'matches') required List<MatchModel> matches,
    @JsonKey(name: 'abbreviation') required String abbreviation
  }) = _FeedGroupModel;

  factory FeedGroupModel.fromJson(Map<String, dynamic> json) =>
      _$FeedGroupModelFromJson(json);
}