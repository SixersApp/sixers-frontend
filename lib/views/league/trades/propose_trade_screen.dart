import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sixers/backend/fantasy_team/fantasy_team_model.dart';
import 'package:sixers/backend/fantasy_team_instance/fantasy_team_instance_model.dart';
import 'package:sixers/backend/fantasy_team_instance/fantasy_team_instance_provider.dart';
import 'package:sixers/backend/leagues/league_model.dart';
import 'package:sixers/backend/trades/trade_provider.dart';
import 'package:sixers/backend/fantasy_team_instance/fantasy_team_instance_service.dart';
import 'package:sixers/theme/colors.dart';

class ProposeTradeScreen extends ConsumerStatefulWidget {
  const ProposeTradeScreen({super.key, required this.league});

  final League league;

  @override
  ConsumerState<ProposeTradeScreen> createState() => _ProposeTradeScreenState();
}

class _ProposeTradeScreenState extends ConsumerState<ProposeTradeScreen> {
  FantasyTeam? _selectedOpponent;
  FantasyTeamInstance? _opponentInstance;
  bool _loadingOpponent = false;

  final Set<String> _offeredPlayerIds = {};
  final Set<String> _requestedPlayerIds = {};

  List<FantasyTeam> get _opponents => widget.league.teams
      .where((t) => t.id != widget.league.userTeamId)
      .toList();

  FantasyTeamInstance? get _myCurrentInstance {
    final instances = ref.read(fantasyTeamInstancesProvider).value ?? [];
    if (instances.isEmpty) return null;
    return instances.reduce((a, b) => a.match_num > b.match_num ? a : b);
  }

  FantasyTeamInstance? get _opponentCurrentInstance => _opponentInstance;

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

  Future<void> _selectOpponent(FantasyTeam team) async {
    setState(() {
      _selectedOpponent = team;
      _opponentInstance = null;
      _requestedPlayerIds.clear();
      _loadingOpponent = true;
    });

    final service = FantasyTeamInstanceService();
    final instance = await service.getRosterForTeam(fantasy_team_id: team.id);
    setState(() {
      _opponentInstance = instance;
      _loadingOpponent = false;
    });
  }

  Future<void> _submit() async {
    if (_offeredPlayerIds.isEmpty || _requestedPlayerIds.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Select at least one player to offer and one to request'),
      ));
      return;
    }

    final result = await ref.read(tradesProvider.notifier).propose(
      leagueId: widget.league.id,
      proposerTeamId: widget.league.userTeamId,
      recipientTeamId: _selectedOpponent!.id,
      offeredPlayerIds: _offeredPlayerIds.toList(),
      requestedPlayerIds: _requestedPlayerIds.toList(),
    );

    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(result['message'] ?? (result['ok'] == true ? 'Trade proposed!' : 'Failed')),
      backgroundColor: result['ok'] == true ? Colors.green.shade800 : Colors.red.shade800,
    ));
    if (result['ok'] == true) context.pop();
  }

  @override
  Widget build(BuildContext context) {
    final myInstance = _myCurrentInstance;
    final myPlayers = _rosterPlayers(myInstance?.players);
    final opponentPlayers = _rosterPlayers(_opponentCurrentInstance?.players);

    final canSubmit = _selectedOpponent != null &&
        _offeredPlayerIds.isNotEmpty &&
        _requestedPlayerIds.isNotEmpty;

    return Scaffold(
      backgroundColor: AppColors.black100,
      appBar: AppBar(
        backgroundColor: AppColors.black100,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, size: 20),
          onPressed: () => context.pop(),
        ),
        title: const Text(
          'PROPOSE TRADE',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
              children: [
                // Opponent selector
                _SectionHeader(title: 'Select opponent'),
                const SizedBox(height: 10),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: _opponents.map((team) {
                      final selected = _selectedOpponent?.id == team.id;
                      return GestureDetector(
                        onTap: () => _selectOpponent(team),
                        child: Container(
                          margin: const EdgeInsets.only(right: 8),
                          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                          decoration: BoxDecoration(
                            color: selected ? AppColors.black400 : AppColors.black200,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: selected ? AppColors.black600 : Colors.transparent,
                            ),
                          ),
                          child: Text(
                            team.teamName,
                            style: TextStyle(
                              color: selected ? Colors.white : AppColors.black600,
                              fontSize: 13,
                              fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(height: 28),

                // Your players to offer
                _SectionHeader(title: 'Your offer'),
                const SizedBox(height: 4),
                Text(
                  'Tap to select players you\'re giving away',
                  style: TextStyle(color: AppColors.black500, fontSize: 12),
                ),
                const SizedBox(height: 10),
                if (myPlayers.isEmpty)
                  Text('No roster loaded', style: TextStyle(color: AppColors.black500, fontSize: 13))
                else
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: myPlayers.map((p) => _PlayerChip(
                      name: p.fullName,
                      role: p.role,
                      selected: _offeredPlayerIds.contains(p.id),
                      onTap: () => setState(() {
                        _offeredPlayerIds.contains(p.id)
                            ? _offeredPlayerIds.remove(p.id)
                            : _offeredPlayerIds.add(p.id);
                      }),
                    )).toList(),
                  ),
                const SizedBox(height: 28),

                // Opponent's players to request
                _SectionHeader(title: 'You request'),
                const SizedBox(height: 4),
                Text(
                  'Tap to select players you want from them',
                  style: TextStyle(color: AppColors.black500, fontSize: 12),
                ),
                const SizedBox(height: 10),
                if (_selectedOpponent == null)
                  Text('Select an opponent first', style: TextStyle(color: AppColors.black500, fontSize: 13))
                else if (_loadingOpponent)
                  const Center(child: CircularProgressIndicator())
                else if (opponentPlayers.isEmpty)
                  Text('No roster data available', style: TextStyle(color: AppColors.black500, fontSize: 13))
                else
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: opponentPlayers.map((p) => _PlayerChip(
                      name: p.fullName,
                      role: p.role,
                      selected: _requestedPlayerIds.contains(p.id),
                      onTap: () => setState(() {
                        _requestedPlayerIds.contains(p.id)
                            ? _requestedPlayerIds.remove(p.id)
                            : _requestedPlayerIds.add(p.id);
                      }),
                    )).toList(),
                  ),
              ],
            ),
          ),

          // Bottom submit bar
          Container(
            padding: const EdgeInsets.fromLTRB(20, 12, 20, 32),
            decoration: BoxDecoration(
              color: AppColors.black200,
              border: Border(top: BorderSide(color: AppColors.black300)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (_offeredPlayerIds.isNotEmpty || _requestedPlayerIds.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Text(
                      'Offering ${_offeredPlayerIds.length} · Requesting ${_requestedPlayerIds.length}',
                      style: TextStyle(color: AppColors.black600, fontSize: 13),
                    ),
                  ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: canSubmit ? _submit : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: canSubmit ? Colors.white : AppColors.black300,
                      foregroundColor: AppColors.black100,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      textStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                    ),
                    child: const Text('Propose Trade'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title.toUpperCase(),
      style: TextStyle(
        color: AppColors.black600,
        fontSize: 11,
        fontWeight: FontWeight.w700,
        letterSpacing: 1.2,
      ),
    );
  }
}

class _PlayerChip extends StatelessWidget {
  const _PlayerChip({
    required this.name,
    required this.role,
    required this.selected,
    required this.onTap,
  });

  final String name;
  final String role;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: selected ? Colors.white.withOpacity(0.12) : AppColors.black200,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: selected ? Colors.white.withOpacity(0.5) : AppColors.black300,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: TextStyle(
                color: selected ? Colors.white : AppColors.black700,
                fontSize: 13,
                fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
              ),
            ),
            Text(
              role,
              style: TextStyle(color: AppColors.black500, fontSize: 11),
            ),
          ],
        ),
      ),
    );
  }
}
