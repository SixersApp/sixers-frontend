class DraftPlayer {
  final String id;
  final String playerName;
  final String? fullName;
  final String? image;
  final String role;
  final String? countryName;
  final String? countryImage;
  final int rank;
  final double? initialProjection;
  final String? teamName;

  const DraftPlayer({
    required this.id,
    required this.playerName,
    this.fullName,
    this.image,
    required this.role,
    this.countryName,
    this.countryImage,
    required this.rank,
    this.initialProjection,
    this.teamName,
  });

  factory DraftPlayer.fromJson(Map<String, dynamic> json) => DraftPlayer(
        id: json['id'] as String,
        playerName: json['player_name'] as String,
        fullName: json['full_name'] as String?,
        image: json['image'] as String?,
        role: json['role'] as String? ?? 'Unknown',
        countryName: json['country_name'] as String?,
        countryImage: json['country_image'] as String?,
        rank: json['rank'] as int? ?? 0,
        initialProjection: json['initial_projection'] != null
            ? double.tryParse(json['initial_projection'].toString())
            : null,
        teamName: json['team_name'] as String?,
      );

  String get roleAbbr {
    final r = role.toLowerCase();
    if (r.contains('allrounder') || r.contains('all-rounder')) return 'AR';
    if (r.contains('batter') || r == 'batsman') return 'BAT';
    if (r.contains('bowler')) return 'BWL';
    if (r.contains('wicket') || r.contains('keeper')) return 'WK';
    return role.substring(0, role.length.clamp(0, 3)).toUpperCase();
  }
}
