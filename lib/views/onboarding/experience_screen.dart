import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sixers/backend/auth/auth_provider.dart';
import 'package:sixers/backend/auth/onboarding_provider.dart';
import 'package:sixers/utils/logger.dart';

class ExperienceScreen extends ConsumerStatefulWidget {
  const ExperienceScreen({super.key});

  @override
  ConsumerState<ExperienceScreen> createState() => _ExperienceScreenState();
}

class _ExperienceScreenState extends ConsumerState<ExperienceScreen> {
  String? _selectedExperience;
  bool _isLoading = false;

  final List<Map<String, dynamic>> _experiences = [
    {
      'id': 'new_to_cricket',
      'title': 'New to Cricket',
      'description': 'Just started out. Still learning teams and rules.',
      'icon': Icons.star_outline,
      'color': Color(0xFF2196F3),
    },
    {
      'id': 'casual_fan',
      'title': 'Casual Fan',
      'description': 'I watch the big games and follow the popular players.',
      'icon': Icons.sports_cricket,
      'color': Color(0xFFFFC107),
    },
    {
      'id': 'die_hard_fan',
      'title': 'Die-Hard Fan',
      'description': 'I know the squads and stats by heart.',
      'icon': Icons.favorite,
      'color': Color(0xFFE91E63),
    },
  ];

  @override
  void initState() {
    super.initState();
    _restoreAfterAuthReady();
  }

  /// ⚡ Wait for AuthProvider -> THEN load profile
  Future<void> _restoreAfterAuthReady() async {
    await Future.delayed(const Duration(milliseconds: 100));

    final authAsync = ref.read(authProviderProvider);

    if (authAsync.isLoading) {
      await Future.delayed(const Duration(milliseconds: 150));
      return _restoreAfterAuthReady();
    }

    final session = authAsync.value;
    if (session == null) return;

    _loadExisting();
  }

  Future<void> _loadExisting() async {
    try {
      final profile =
          await ref.read(onboardingStageProvider.notifier).fetchProfile();

      if (!mounted || profile.isEmpty) return;

      final exp = profile['experience'];

      final experienceId = {
        1: 'new_to_cricket',
        2: 'casual_fan',
        3: 'die_hard_fan'
      }[exp];

      if (experienceId != null) {
        setState(() => _selectedExperience = experienceId);
      }
    } catch (e) {
      print("Prefill experience failed: $e");
    }
  }

  /// ⚡ Back button → set onboarding stage to 0
  void _handleBack() async {
    await ref.read(onboardingStageProvider.notifier).advanceTo(0);
  }

  /// ⚡ Next button → update experience and stage
  Future<void> _handleNext() async {
    if (_selectedExperience == null) {
      _showErrorSnackBar('Please select your cricket experience level');
      return;
    }

    setState(() => _isLoading = true);

    try {
      final expValue = {
        'new_to_cricket': 1,
        'casual_fan': 2,
        'die_hard_fan': 3,
      }[_selectedExperience]!;

      await ref
          .read(onboardingStageProvider.notifier)
          .updateExperience(expValue);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Onboarding completed! Welcome!'),
            backgroundColor: Colors.green,
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    } catch (e, st) {
      logError('ExperienceScreen error: $e', st);
      if (mounted) {
        _showErrorSnackBar('Failed to complete setup. Please try again.');
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1C1C1C),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              const SizedBox(height: 32),
              Text(
                'EXPERIENCE',
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                    letterSpacing: 1.5,
                    fontSize: 36),
              ),
              const SizedBox(height: 8),
              Text(
                'How much cricket do you know?',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: Colors.white70, fontSize: 18),
              ),
              const SizedBox(height: 32),

              // Experience list
              Column(
                children: _experiences.asMap().entries.map((entry) {
                  final index = entry.key;
                  final ex = entry.value;
                  return Padding(
                    padding: EdgeInsets.only(
                        bottom: index < _experiences.length - 1 ? 12 : 0),
                    child: _buildExperienceOption(ex),
                  );
                }).toList(),
              ),

              const Spacer(),
              _buildNavigationButtons(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        Row(
          children: [
            GestureDetector(
              onTap: _handleBack,
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(20)),
                child: const Icon(Icons.arrow_back_ios,
                    color: Colors.white, size: 20),
              ),
            ),
            const Spacer(),
            Text(
              '2 of 2',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: Colors.white, fontSize: 16),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          height: 6,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3),
              color: const Color(0xFF4CAF50)),
        ),
      ],
    );
  }

  Widget _buildExperienceOption(Map<String, dynamic> exp) {
    final isSelected = _selectedExperience == exp['id'];

    return GestureDetector(
      onTap: () => setState(() => _selectedExperience = exp['id']),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF2C2C2C),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
              color: isSelected ? const Color(0xFF4CAF50) : Colors.transparent,
              width: 2),
        ),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: (exp['color'] as Color).withOpacity(0.2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(exp['icon'], color: exp['color'], size: 20),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    exp['title'],
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(color: Colors.white, fontSize: 18),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    exp['description'],
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.white70, fontSize: 14),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavigationButtons() {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 56,
            child: ElevatedButton(
              onPressed: _isLoading ? null : _handleNext,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                elevation: 0,
              ),
              child: _isLoading
                  ? const SizedBox(
                      width: 24,
                      height: 24,
                      child: CircularProgressIndicator(
                          color: Colors.black, strokeWidth: 2),
                    )
                  : const Text('Next',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
            ),
          ),
        ),
      ],
    );
  }
}