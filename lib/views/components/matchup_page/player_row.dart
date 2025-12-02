import 'package:flutter/material.dart';
import 'package:sixers/backend/fantasy_player/fantasy_player_model.dart';

class PlayerRow extends StatelessWidget {
  final FantasyPlayer p;

  const PlayerRow({super.key, required this.p});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      decoration: BoxDecoration(
        color: const Color(0xff121212),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          // Player name + placeholder badge
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("PLAYER NAME",    // placeholder
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              Text("${p.homeTeamName} vs ${p.awayTeamName}",
                  style: TextStyle(fontSize: 12, color: Colors.grey)),
            ],
          ),
          Spacer(),

          // Fantasy points (big green arrow in screenshot)
          Row(
            children: [
              Text(
                "${p.fantasyPoints}",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.greenAccent,
                ),
              ),
              const SizedBox(width: 4),
              Icon(Icons.arrow_upward, color: Colors.greenAccent, size: 18),
            ],
          ),
        ],
      ),
    );
  }
}