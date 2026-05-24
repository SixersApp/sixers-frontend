import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sixers/backend/fantasy_team/fantasy_team_model.dart';
import 'package:sixers/backend/fantasy_team_instance/fantasy_team_instance_model.dart';
import 'package:sixers/backend/fantasy_team_instance/fantasy_team_instance_provider.dart';
import 'package:sixers/backend/fantasy_team_instance/fantasy_team_instance_service.dart';
import 'package:sixers/backend/leagues/league_model.dart';
import 'package:sixers/backend/trades/trade_provider.dart';
import 'package:sixers/theme/colors.dart';
import 'package:sixers/views/league/components/player_stats_bottom_sheet.dart';

final _opponentRosterProvider = FutureProvider.autoDispose.family<FantasyTeamInstance?, String>(
  (ref, teamId) => FantasyTeamInstanceService().getRosterForTeam(fantasy_team_id: teamId),
);

class ProposeTradeScreen extends ConsumerStatefulWidget {
  const ProposeTradeScreen({super.key, required this.league});
  final League league;

  @override
  ConsumerState<ProposeTradeScreen> createState() => _ProposeTradeScreenState();
}

class _ProposeTradeScreenState extends ConsumerState<ProposeTradeScreen> {
  String? _selectedOpponentTeamId;
  final Set<String> _offeredPlayerIds = {};
  final Set<String> _requestedPlayerIds = {};
  bool _isSubmitting = false;

  List<RosterPlayerData> _rosterPlayers(RosterPlayers? players) {
    if (players == null) return [];
    return [
      players.bat1, players.bat2,
      players.wicket1,
      players.bowl1, players.bowl2, players.bowl3,
      players.all1, players.flex1,
      players.bench1, players.bench2, players.bench3,
    ].whereType<RosterPlayerData>().toList();
  }

  FantasyTeamInstance? get _myCurrentInstance {
    final instances = ref.watch(fantasyTeamInstancesProvider).value ?? [];
    if (instances.isEmpty) return null;
    return instances.reduce((a, b) => a.match_num > b.match_num ? a : b);
  }

  List<FantasyTeam> get _opponentTeams =>
      widget.league.teams.where((t) => t.id != widget.league.userTeamId).toList();

  Future<void> _submit() async {
    if (_selectedOpponentTeamId == null ||
        _offeredPlayerIds.isEmpty ||
        _requestedPlayerIds.isEmpty) return;

    setState(() => _isSubmitting = true);
    final result = await ref.read(tradesProvider.notifier).propose(
      leagueId: widget.league.id,
      proposerTeamId: widget.league.userTeamId,
      recipientTeamId: _selectedOpponentTeamId!,
      offeredPlayerIds: _offeredPlayerIds.toList(),
      requestedPlayerIds: _requestedPlayerIds.toList(),
    );
    if (!mounted) return;
    setState(() => _isSubmitting = false);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(result['message'] ?? (result['ok'] == true ? 'Trade proposed!' : 'Failed to propose trade')),
      backgroundColor: result['ok'] == true ? Colors.green.shade800 : Colors.red.shade800,
    ));
    if (result['ok'] == true) context.pop();
  }

  @override
  Widget build(BuildContext context) {
    final myPlayers = _rosterPlayers(_myCurrentInstance?.players);
    final opponentRosterAsync = _selectedOpponentTeamId != null
        ? ref.watch(_opponentRosterProvider(_selectedOpponentTeamId!))
        : null;
    final opponentPlayers = opponentRosterAsync?.value != null
        ? _rosterPlayers(opponentRosterAsync!.value!.players)
        : <RosterPlayerData>[];

    final canSubmit = _selectedOpponentTeamId != null &&
        _offeredPlayerIds.isNotEmpty &&
        _requestedPlayerIds.isNotEmpty &&
        !_isSubmitting;

    return Scaffold(
      backgroundColor: AppColors.black100,
      appBar: AppBar(
        backgroundColor: AppColors.black100,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, size: 20, color: Colors.white),
          onPressed: () => context.pop(),
        ),
        title: const Text('Propose Trade', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600)),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 100),
        children: [
          _SectionLabel(title: 'Select Opponent'),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            decoration: BoxDecoration(
              color: AppColors.black200,
              borderRadius: BorderRadius.circular(10),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: _selectedOpponentTeamId,
                hint: Text('Choose a team', style: TextStyle(color: AppColors.black500)),
                dropdownColor: AppColors.black200,
                style: const TextStyle(color: Colors.white, fontSize: 14),
                isExpanded: true,
                onChanged: (v) => setState(() {
                  _selectedOpponentTeamId = v;
                  _requestedPlayerIds.clear();
                }),
                items: _opponentTeams.map((t) => DropdownMenuItem(
                  value: t.id,
                  child: Text(t.teamName),
                )).toList(),
              ),
            ),
          ),

          const SizedBox(height: 24),

          _SectionLabel(title: 'Players You Offer'),
          const SizedBox(height: 8),
          if (myPlayers.isEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text('No roster loaded', style: TextStyle(color: AppColors.black500, fontSize: 13)),
            )
          else
            ...myPlayers.map((p) => _CheckablePlayerRow(
              player: p,
              selected: _offeredPlayerIds.contains(p.id),
              onToggle: () => setState(() {
                if (_offeredPlayerIds.contains(p.id)) {
                  _offeredPlayerIds.remove(p.id);
                } else {
                  _offeredPlayerIds.add(p.id);
                }
              }),
            )),

          const SizedBox(height: 24),

          _SectionLabel(title: 'Players You Request'),
          const SizedBox(height: 8),
          if (_selectedOpponentTeamId == null)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text('Select an opponent first', style: TextStyle(color: AppColors.black500, fontSize: 13)),
            )
          else if (opponentRosterAsync == null || opponentRosterAsync.isLoading)
            const Center(child: Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: CircularProgressIndicator(),
            ))
          else if (opponentPlayers.isEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text('Opponent has no players on their roster', style: TextStyle(color: AppColors.black500, fontSize: 13)),
            )
          else
            ...opponentPlayers.map((p) => _CheckablePlayerRow(
              player: p,
              selected: _requestedPlayerIds.contains(p.id),
              onToggle: () => setState(() {
                if (_requestedPlayerIds.contains(p.id)) {
                  _requestedPlayerIds.remove(p.id);
                } else {
                  _requestedPlayerIds.add(p.id);
                }
              }),
            )),

          const SizedBox(height: 32),

          ElevatedButton(
            onPressed: canSubmit ? _submit : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: canSubmit ? AppColors.black300 : AppColors.black200,
              foregroundColor: canSubmit ? Colors.white : AppColors.black500,
              disabledBackgroundColor: AppColors.black200,
              disabledForegroundColor: AppColors.black500,
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
            child: _isSubmitting
                ? const SizedBox(height: 18, width: 18, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white))
                : const Text('Send Trade Proposal', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
          ),
        ],
      ),
    );
  }
}

class _SectionLabel extends StatelessWidget {
  const _SectionLabel({required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title.toUpperCase(),
      style: TextStyle(color: AppColors.black600, fontSize: 11, fontWeight: FontWeight.w700, letterSpacing: 1.2),
    );
  }
}

class _CheckablePlayerRow extends StatelessWidget {
  const _CheckablePlayerRow({required this.player, required this.selected, required this.onToggle});
  final RosterPlayerData player;
  final bool selected;
  final VoidCallback onToggle;

  String _initials(String name) {
    final parts = name.trim().split(' ');
    if (parts.length >= 2) {
      return '${parts[0][0]}${parts[parts.length - 1][0]}'.toUpperCase();
    }
    return name.isNotEmpty ? name[0].toUpperCase() : '?';
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onToggle,
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: selected ? AppColors.black300 : AppColors.black200,
          borderRadius: BorderRadius.circular(10),
          border: selected ? Border.all(color: AppColors.black600, width: 1) : null,
        ),
        child: Row(
          children: [
            Icon(
              selected ? Icons.check_circle : Icons.radio_button_unchecked,
              size: 18,
              color: selected ? Colors.white : AppColors.black500,
            ),
            const SizedBox(width: 10),
            // Avatar — tapping opens player profile without toggling selection
            GestureDetector(
              onTap: () => showPlayerStatsSheet(
                context,
                playerId: player.id,
                playerName: player.fullName,
              ),
              child: CircleAvatar(
                radius: 16,
                backgroundColor: AppColors.black400,
                backgroundImage: player.image.isNotEmpty ? NetworkImage(player.image) : null,
                child: player.image.isEmpty
                    ? Text(
                        _initials(player.fullName),
                        style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w600),
                      )
                    : null,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(player.fullName, style: const TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w500)),
                  Text(player.role, style: TextStyle(color: AppColors.black500, fontSize: 11)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
