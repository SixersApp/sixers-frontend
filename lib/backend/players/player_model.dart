import 'package:freezed_annotation/freezed_annotation.dart';

part 'player_model.freezed.dart';
part 'player_model.g.dart';

@freezed
sealed class Player with _$Player {
  const factory Player({
    required String id,
    required String name,

    
    @JsonKey(name: 'role') required String role,

    
    @JsonKey(name: 'tournament_id') required String tournamentId,

   
    @JsonKey(name: 'real_team_id') required String realTeamId,

  
    @JsonKey(name: 'created_at') required DateTime createdAt,


    @JsonKey(name: 'user_id') String? userId,
  }) = _Player;

  factory Player.fromJson(Map<String, dynamic> json) => _$PlayerFromJson(json);
}


enum PositionFilter { all, batsman, bowler, wicketKeeper, allRounder }
