import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:sixers/backend/auth/auth_provider.dart';
import 'package:sixers/backend/leagues/league_scoring_rule_model.dart';
import 'package:sixers/backend/leagues/league_service.dart';
import 'package:sixers/theme/colors.dart';
import 'package:sixers/utils/logger.dart';
import 'package:sixers/views/create_league/create_team_screen.dart';
import 'package:sixers/views/create_league/customize_scoring_screen.dart';

class CreateLeagueScreen extends ConsumerStatefulWidget {
  static const String route = '/create-league';

  const CreateLeagueScreen({super.key});

  @override
  ConsumerState<CreateLeagueScreen> createState() => _CreateLeagueScreenState();
}

class _CreateLeagueScreenState extends ConsumerState<CreateLeagueScreen> {
  final _nameController = TextEditingController();
  final _leagueService = LeagueService();

  List<Tournament>? _tournaments;
  Tournament? _selectedTournament;
  bool _isLoading = true;
  List<LeagueScoringRule>? _scoringRules;

  @override
  void initState() {
    super.initState();
    _nameController.addListener(_onNameChanged);
    _waitForAuthAndLoad();
  }

  void _onNameChanged() {
    setState(() {});
  }

  Future<void> _waitForAuthAndLoad() async {
    await Future.delayed(const Duration(milliseconds: 60));

    final authAsync = ref.read(authProviderProvider);

    if (authAsync.isLoading) {
      return _waitForAuthAndLoad();
    }

    if (authAsync.value != null) {
      await _loadTournaments();
    } else {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  Future<void> _loadTournaments() async {
    try {
      logInfo('Loading tournaments...');
      final tournaments = await _leagueService.getTournaments();
      logInfo('Loaded ${tournaments.length} tournaments');
      if (mounted) {
        setState(() {
          _tournaments = tournaments;
          _isLoading = false;
          if (tournaments.isNotEmpty) {
            _selectedTournament = tournaments.first;
          }
        });
      }
    } catch (e, st) {
      logError('Failed to load tournaments: $e', st);
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  void dispose() {
    _nameController.removeListener(_onNameChanged);
    _nameController.dispose();
    super.dispose();
  }

  Future<void> _navigateToCustomizeScoring() async {
    if (_selectedTournament == null) return;

    final result = await context.push<List<LeagueScoringRule>>(
      CustomizeScoringScreen.route,
      extra: {
        'leagueName': _nameController.text,
        'tournamentId': _selectedTournament!.id,
        'tournamentName': _selectedTournament!.name,
        'scoringRules': _scoringRules,
      },
    );

    if (result != null && mounted) {
      setState(() {
        _scoringRules = result;
      });
    }
  }

  void _navigateToCreateTeam() {
    if (_selectedTournament == null || _nameController.text.trim().isEmpty)
      return;

    context.push(
      CreateTeamScreen.route,
      extra: {
        'leagueName': _nameController.text.trim(),
        'tournamentId': _selectedTournament!.id,
        'scoringRules': _scoringRules,
      },
    );
  }

  Widget _buildDropdownField<T>({
    required T? value,
    required List<T> items,
    required String Function(T) labelBuilder,
    required void Function(T?) onChanged,
  }) {
    return DropdownButtonFormField<T>(
      value: items.contains(value) ? value : null,
      isExpanded: true,
      items: items
          .map(
            (item) => DropdownMenuItem<T>(
              value: item,
              child: Text(
                labelBuilder(item),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          )
          .toList(),
      onChanged: onChanged,
      dropdownColor: const Color(0xFF2C2C2C),
      icon: const Icon(Icons.keyboard_arrow_down, color: Colors.white),
    );
  }

  Widget _buildFieldLabel(String label) {
    return Text(label, style: Theme.of(context).textTheme.labelSmall);
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(
        backgroundColor: Color(0xFF1C1C1C),
        body: Center(child: CircularProgressIndicator(color: Colors.white)),
      );
    }

    return Scaffold(
      backgroundColor: const Color(0xFF1C1C1C),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Header
              Row(
                children: [
                  GestureDetector(
                    onTap: () => context.pop(),
                    child: PhosphorIcon(PhosphorIcons.caretLeft(), size: 24),
                  ),
                  const SizedBox(width: 20),
                  Text(
                    "CREATE LEAGUE",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ],
              ),
              const SizedBox(height: 32),
              Expanded(
                child: Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // League Name
                      _buildFieldLabel('League Name'),
                      const SizedBox(height: 6),
                      TextFormField(
                        controller: _nameController,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                        decoration: const InputDecoration(
                          hintText: 'Awesome People League',
                        ),
                      ),
                      const SizedBox(height: 12),

                      // Tournament
                      _buildFieldLabel('Tournament'),
                      const SizedBox(height: 6),
                      _buildDropdownField<Tournament>(
                        value: _selectedTournament,
                        items: _tournaments ?? [],
                        labelBuilder: (t) => t.abbreviation != null
                            ? '${t.name} (${t.abbreviation})'
                            : t.name,
                        onChanged: (value) {
                          setState(() => _selectedTournament = value);
                          FocusScope.of(context).nextFocus();
                        },
                      ),
                      const SizedBox(height: 24),

                      // Scoring
                      _buildFieldLabel('Scoring'),
                      const SizedBox(height: 6),
                      GestureDetector(
                        onTap: _navigateToCustomizeScoring,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 32,
                            vertical: 16,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.black300,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              PhosphorIcon(
                                PhosphorIcons.slidersHorizontal(),
                                size: 24,
                                color: AppColors.black800,
                              ),
                              const SizedBox(width: 16),
                              Text(
                                'Customize Scoring',
                                style: Theme.of(context).textTheme.bodyMedium
                                    ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.black800,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ElevatedButton(
                onPressed:
                    (_nameController.text.trim().isEmpty ||
                        _selectedTournament == null)
                    ? null
                    : _navigateToCreateTeam,
                child: const Text(
                  'Next',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
