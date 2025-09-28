import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:sixers/backend/auth/onboarding_provider.dart';
import 'package:sixers/utils/logger.dart';

/// Experience Screen - Second onboarding step
/// Allows users to select their cricket experience level
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
      'color': const Color(0xFF2196F3),
    },
    {
      'id': 'casual_fan',
      'title': 'Casual Fan',
      'description': 'I watch the big games and follow the popular players.',
      'icon': Icons.sports_cricket,
      'color': const Color(0xFFFFC107),
    },
    {
      'id': 'die_hard_fan',
      'title': 'Die-Hard Fan',
      'description': 'I know the squads and stats by heart.',
      'icon': Icons.favorite,
      'color': const Color(0xFFE91E63),
    },
  ];

  @override
  void initState() {
    super.initState();
    _loadExisting();
  }

  Future<void> _loadExisting() async {
    try {
      final userId = Supabase.instance.client.auth.currentUser?.id;
      if (userId == null) return;
      final response = await Supabase.instance.client.from('profiles').select('experience').eq('user_id', userId).maybeSingle();
      if (!mounted || response == null) return;
      final exp = response['experience'];
      final id = {1: 'new_to_cricket', 2: 'casual_fan', 3: 'die_hard_fan'}[exp];
      if (id != null) {
        setState(() => _selectedExperience = id);
      }
    } catch (_) {
      // ignore errors silently for prefill
    }
  }

  void _handleBack() async {
    final userId = Supabase.instance.client.auth.currentUser?.id;
    if (userId == null) return;
    await ref.read(onboardingStageProvider(userId).notifier).advanceTo(0);
  }

  Future<void> _handleNext() async {
    if (_selectedExperience == null) {
      _showErrorSnackBar('Please select your cricket experience level');
      return;
    }

    setState(() => _isLoading = true);

    try {
      final userId = Supabase.instance.client.auth.currentUser!.id;
      final experienceValue = {'new_to_cricket': 1, 'casual_fan': 2, 'die_hard_fan': 3}[_selectedExperience]!;

      // Write and force return to surface server errors
      await Supabase.instance.client
          .from('profiles')
          .upsert({'user_id': userId, 'experience': experienceValue, 'onboarding_stage': 2})
          .select('user_id')
          .single();

      await ref.read(onboardingStageProvider(userId).notifier).complete();

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Onboarding completed! Welcome to the app!'),
            backgroundColor: Colors.green,
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    } catch (e, st) {
      // Log detailed error for debugging
      logError('ExperienceScreen error: $e', st);
      if (e is PostgrestException) {
        logWarning('PostgrestException: ${e.code} ${e.message} ${e.details}');
      }
      if (mounted) {
        _showErrorSnackBar('Failed to complete setup. Please try again.');
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message), backgroundColor: Colors.red, behavior: SnackBarBehavior.floating));
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

              // Title and subtitle
              Text(
                'EXPERIENCE',
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                  letterSpacing: 1.5,
                  fontSize: 36,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'How much cricket do you know?',
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge?.copyWith(color: Colors.white70, fontWeight: FontWeight.w400, fontSize: 18),
              ),
              const SizedBox(height: 32),

              // Experience options (compact)
              Column(
                children: _experiences.asMap().entries.map((entry) {
                  final index = entry.key;
                  final experience = entry.value;
                  return Padding(
                    padding: EdgeInsets.only(bottom: index < _experiences.length - 1 ? 12 : 0),
                    child: _buildExperienceOption(experience),
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
                decoration: BoxDecoration(color: Colors.transparent, borderRadius: BorderRadius.circular(20)),
                child: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 20),
              ),
            ),
            const Spacer(),
            Text(
              '2 of 2',
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 16),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          height: 6,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(3), color: const Color(0xFF4CAF50)),
        ),
      ],
    );
  }

  Widget _buildExperienceOption(Map<String, dynamic> experience) {
    final isSelected = _selectedExperience == experience['id'];
    return GestureDetector(
      onTap: () => setState(() => _selectedExperience = experience['id']),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF2C2C2C),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: isSelected ? const Color(0xFF4CAF50) : Colors.transparent, width: 2),
        ),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: (experience['color'] as Color).withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(experience['icon'] as IconData, color: experience['color'] as Color, size: 20),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    experience['title'] as String,
                    style: Theme.of(
                      context,
                    ).textTheme.titleMedium?.copyWith(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    experience['description'] as String,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.white.withValues(alpha: 0.7),
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
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
        // Back Button
        Expanded(
          child: SizedBox(
            height: 56,
            child: OutlinedButton(
              onPressed: _isLoading ? null : _handleBack,
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.white, width: 1.5),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                backgroundColor: Colors.black,
              ),
              child: const Text(
                'Back',
                style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ),
        const SizedBox(width: 16),
        // Next Button
        Expanded(
          child: SizedBox(
            height: 56,
            child: ElevatedButton(
              onPressed: _isLoading ? null : _handleNext,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                elevation: 0,
              ),
              child: _isLoading
                  ? const SizedBox(width: 24, height: 24, child: CircularProgressIndicator(color: Colors.black, strokeWidth: 2))
                  : const Text('Next', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
            ),
          ),
        ),
      ],
    );
  }
}
