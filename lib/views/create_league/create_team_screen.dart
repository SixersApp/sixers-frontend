import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:sixers/backend/leagues/league_model.dart';
import 'package:sixers/backend/leagues/league_provider.dart';
import 'package:sixers/backend/leagues/league_scoring_rule_model.dart';
import 'package:sixers/backend/leagues/league_service.dart';
import 'package:sixers/theme/colors.dart';
import 'package:sixers/utils/logger.dart';
import 'package:sixers/utils/string_to_avatar.dart';
import 'package:sixers/views/create_league/commissioner_pre_draft_screen.dart';

class CreateTeamScreen extends ConsumerStatefulWidget {
  static const String route = '/create-team';

  // For creating a new league
  final String? leagueName;
  final String? tournamentId;
  final List<LeagueScoringRule>? scoringRules;

  // For joining an existing league
  final League? leagueToJoin;
  final String? joinCode;

  const CreateTeamScreen({
    super.key,
    this.leagueName,
    this.tournamentId,
    this.scoringRules,
    this.leagueToJoin,
    this.joinCode,
  });

  bool get isJoining => leagueToJoin != null && joinCode != null;

  @override
  ConsumerState<CreateTeamScreen> createState() => _CreateTeamScreenState();
}

class _CreateTeamScreenState extends ConsumerState<CreateTeamScreen> {
  final _nameController = TextEditingController();
  final _abbrController = TextEditingController();
  final _leagueService = LeagueService();

  late Color _selectedColor;
  late String _selectedMascot;
  bool _isCreating = false;

  Set<String> get _takenColorNames {
    if (!widget.isJoining) return {};
    return widget.leagueToJoin!.teams
        .map((t) => t.teamColor)
        .whereType<String>()
        .toSet();
  }

  bool _isColorTaken(String colorName) => _takenColorNames.contains(colorName);

  @override
  void initState() {
    super.initState();
    // Select first available (non-taken) color
    _selectedColor = _getFirstAvailableColor();
    _selectedMascot = availableAvatars.first;
    _nameController.addListener(_onFieldChanged);
    _abbrController.addListener(_onFieldChanged);
  }

  Color _getFirstAvailableColor() {
    for (final entry in avatarColors.entries) {
      if (!_isColorTaken(entry.key)) {
        return entry.value;
      }
    }
    return avatarColors.values.first;
  }

  void _onFieldChanged() {
    setState(() {});
  }

  @override
  void dispose() {
    _nameController.removeListener(_onFieldChanged);
    _abbrController.removeListener(_onFieldChanged);
    _nameController.dispose();
    _abbrController.dispose();
    super.dispose();
  }

  String _getColorName(Color color) {
    for (final entry in avatarColors.entries) {
      if (entry.value.value == color.value) {
        return entry.key;
      }
    }
    return 'red'; // fallback
  }

  Future<void> _createLeagueAndTeam() async {
    final teamName = _nameController.text.trim();
    final teamAbbr = _abbrController.text.trim();

    if (teamName.isEmpty || teamAbbr.isEmpty) return;

    setState(() => _isCreating = true);

    try {
      League league;

      if (widget.isJoining) {
        // Join existing league
        league = await _leagueService.joinLeague(
          joinCode: widget.joinCode!,
          teamName: teamName,
          teamColor: _getColorName(_selectedColor),
          teamAbbreviation: teamAbbr,
          teamIcon: _selectedMascot,
        );
      } else {
        // Create new league
        league = await _leagueService.createLeague(
          name: widget.leagueName!,
          tournamentId: widget.tournamentId!,
          teamName: teamName,
          teamColor: _getColorName(_selectedColor),
          teamAbbreviation: teamAbbr,
          teamIcon: _selectedMascot,
          scoringRules: widget.scoringRules,
        );
      }

      ref.read(leaguesProvider.notifier).refresh();

      if (mounted) {
        context.go('/leagues/${league.id}');
      }
    } catch (e, st) {
      logError('Failed to ${widget.isJoining ? 'join' : 'create'} league: $e', st);
      if (mounted) {
        setState(() => _isCreating = false);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to ${widget.isJoining ? 'join' : 'create'} league: $e')),
        );
      }
    }
  }

  Widget _buildFieldLabel(String label) {
    return Text(
      label, 
      style: Theme.of(context).textTheme.labelSmall?.copyWith(
        color: AppColors.black600,
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
    int? maxLength,
    TextCapitalization textCapitalization = TextCapitalization.none,
  }) {
    return TextFormField(
      controller: controller,
      maxLength: maxLength,
      textCapitalization: textCapitalization,
      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
        color: AppColors.black800,
      ),
      decoration: InputDecoration(
        hintText: hint,
        counterText: '',
      ),
      cursorColor: AppColors.black800,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1C1C1C),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                children: [
                  GestureDetector(
                    onTap: () => context.pop(),
                    child: PhosphorIcon(PhosphorIcons.caretLeft(), size: 24, color: AppColors.black800),
                  ),
                  const SizedBox(width: 20),
                  Text(
                    widget.isJoining ? "JOIN TEAM" : "CREATE TEAM",
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: AppColors.black800,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              
              // Preview
              Center(
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: _selectedColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.asset(
                    'assets/images/mascots/$_selectedMascot.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(height: 32),

              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Team Name & Abbreviation Row
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _buildFieldLabel('Team Name'),
                                const SizedBox(height: 6),
                                _buildTextField(
                                  controller: _nameController,
                                  hint: "Alex's Awesome Avengers",
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            flex: 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _buildFieldLabel('Abbr.'),
                                const SizedBox(height: 6),
                                _buildTextField(
                                  controller: _abbrController,
                                  hint: 'AAA',
                                  maxLength: 3,
                                  textCapitalization: TextCapitalization.characters,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),

                      // Color Picker
                      _buildFieldLabel('Team Color'),
                      const SizedBox(height: 12),
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 6,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 1.0,
                        ),
                        itemCount: avatarColors.length,
                        itemBuilder: (context, index) {
                          final colorName = avatarColors.keys.elementAt(index);
                          final color = avatarColors.values.elementAt(index);
                          final isSelected = _selectedColor.value == color.value;
                          final isTaken = _isColorTaken(colorName);
                          return GestureDetector(
                            onTap: isTaken ? null : () => setState(() => _selectedColor = color),
                            child: Stack(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: isTaken ? color.withOpacity(0.3) : color,
                                    borderRadius: BorderRadius.circular(8),
                                    border: isSelected
                                        ? Border.all(color: AppColors.black800, width: 2)
                                        : null,
                                  ),
                                ),
                                if (isTaken)
                                  Positioned.fill(
                                    child: Center(
                                      child: PhosphorIcon(
                                        PhosphorIcons.prohibit(),
                                        size: 24,
                                        color: AppColors.black600,
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 24),

                      // Mascot Picker
                      _buildFieldLabel('Team Avatar'),
                      const SizedBox(height: 12),
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 5,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 1.0,
                        ),
                        itemCount: availableAvatars.length,
                        itemBuilder: (context, index) {
                          final mascot = availableAvatars[index];
                          final isSelected = _selectedMascot == mascot;
                          return GestureDetector(
                            onTap: () => setState(() => _selectedMascot = mascot),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                border: isSelected 
                                  ? Border.all(color: _selectedColor, width: 2)
                                  : Border.all(color: Colors.transparent),
                              ),
                              child: Image.asset(
                                'assets/images/mascots/$mascot.png',
                                fit: BoxFit.contain,
                              ),
                            ),
                          );
                        },
                      ),
                      
                      const SizedBox(height: 48),

                      SizedBox(
                        width: double.infinity,
                        height: 56,
                        child: ElevatedButton(
                          onPressed: (_isCreating ||
                                      _nameController.text.trim().isEmpty ||
                                      _abbrController.text.trim().isEmpty)
                              ? null
                              : _createLeagueAndTeam,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.black800,
                            foregroundColor: const Color(0xFF1C1C1C),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            elevation: 0,
                          ),
                          child: _isCreating
                              ? const SizedBox(
                                  width: 24,
                                  height: 24,
                                  child: CircularProgressIndicator(
                                    color: Color(0xFF1C1C1C),
                                    strokeWidth: 2,
                                  ),
                                )
                              : Text(
                                  widget.isJoining ? 'Join' : 'Create',
                                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                                ),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}
