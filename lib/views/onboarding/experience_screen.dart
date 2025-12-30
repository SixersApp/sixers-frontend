import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:sixers/backend/auth/auth_provider.dart';
import 'package:sixers/backend/onboarding/onboarding_provider.dart';
import 'package:sixers/theme/colors.dart';
import 'package:sixers/utils/logger.dart';
import 'package:sixers/views/onboarding/basic_info_screen.dart';

class ExperienceScreen extends ConsumerStatefulWidget {
  static final String route = '/onboarding/2';
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
      'description': 'Just starting out.',
      'icon': PhosphorIcons.personSimpleThrow(),
      'color': AppColors.green300,
    },
    {
      'id': 'casual_fan',
      'title': 'Casual Fan',
      'description': 'I follow big games & players.',
      'icon': PhosphorIcons.cricket(),
      'color': AppColors.yellow300,
    },
    {
      'id': 'die_hard_fan',
      'title': 'Die-Hard Fan',
      'description': 'I know the squads and stats.',
      'icon': PhosphorIcons.trophy(),
      'color': AppColors.red100,
    },
  ];

  @override
  void initState() {
    super.initState();
    _restoreAfterAuthReady();
  }

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
      final notifier = ref.read(onboardingStageProvider.notifier);
      final profile = await ref.read(onboardingStageProvider.future);

      if (!mounted || profile == null) return;

      final exp = profile.experience;

      final experienceId = {
        1: 'new_to_cricket',
        2: 'casual_fan',
        3: 'die_hard_fan',
      }[exp];

      if (experienceId != null) {
        setState(() => _selectedExperience = experienceId);
      }
    } catch (e) {
      print("Prefill experience failed: $e");
    }
  }

  void _handleBack() {
    context.go(BasicInfoScreen.route);
  }

  Future<void> _handleNext() async {
    if (_selectedExperience == null) {
      _showErrorSnackBar('Please select your cricket experience level');
      return;
    }

    setState(() => _isLoading = true);

    try {
      final notifier = ref.read(onboardingStageProvider.notifier);

      final profile = await ref.read(onboardingStageProvider.future);

      final expValue = {
        'new_to_cricket': 1,
        'casual_fan': 2,
        'die_hard_fan': 3,
      }[_selectedExperience]!;

      final profileData = profile!.copyWith(
        experience: expValue,
        onboardingStage: 2,
      );

      await notifier.updateProfileInfo(profileData: profileData);

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
                'ABOUT YOU',
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  fontSize: 48,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                'How much cricket do you know?',
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge?.copyWith(color: Colors.white70),
              ),
              const SizedBox(height: 20),

              Column(
                children: _experiences.asMap().entries.map((entry) {
                  final index = entry.key;
                  final ex = entry.value;
                  return Padding(
                    padding: EdgeInsets.only(
                      bottom: index < _experiences.length - 1 ? 12 : 0,
                    ),
                    child: _buildExperienceOption(ex),
                  );
                }).toList(),
              ),

              const Spacer(),
              _buildNavigationButtons(context),
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
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
            const Spacer(),
            Text(
              '2 of 2',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          height: 6,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3),
            color: Color(0xFF4CAF50),
          ),
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
          color: isSelected ? AppColors.black300 : AppColors.black200,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected ? exp['color'] : AppColors.black400,
            width: 2,
          ),
        ),
        child: Row(
          children: [
            PhosphorIcon(exp['icon'], color: exp['color'], size: 24),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    exp['title'],
                    style: Theme.of(
                      context,
                    ).textTheme.headlineSmall?.copyWith(color: Colors.white),
                  ),
                  Text(
                    exp['description'],
                    style: Theme.of(
                      context,
                    ).textTheme.bodyLarge?.copyWith(color: Colors.white70),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavigationButtons(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 56,
            child: FilledButton(
              onPressed: () => context.go(BasicInfoScreen.route),
              child: const Text('Back'),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: SizedBox(
            height: 56,
            child: ElevatedButton(
              onPressed: _isLoading ? null : _handleNext,
              child: _isLoading
                  ? const SizedBox(
                      width: 24,
                      height: 24,
                      child: CircularProgressIndicator(
                        color: Colors.black,
                        strokeWidth: 2,
                      ),
                    )
                  : const Text('Next'),
            ),
          ),
        ),
      ],
    );
  }
}
