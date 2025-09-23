import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sixers/navbar/main_scaffold.dart';
import 'package:sixers/views/home_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

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

  // Experience options matching the design
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

  /// Handle back navigation
  void _handleBack() {
    Navigator.of(context).pop();
  }

  /// Handle next button - complete onboarding
  Future<void> _handleNext() async {
    if (_selectedExperience == null) {
      _showErrorSnackBar('Please select your cricket experience level');
      return;
    }

    setState(() => _isLoading = true);

    try {
      final userId = Supabase.instance.client.auth.currentUser!.id;

      // Write to  `profiles` table
      await Supabase.instance.client.from('profiles').upsert({
        'user_id': userId, 
        'experience': {'new_to_cricket': 1, 'casual_fan': 2, 'die_hard_fan': 3}[_selectedExperience],
        'onboarding_done': true
      });
      await Supabase.instance.client.auth.refreshSession();
      if (mounted) {
        // Navigate to main app - you'll need to handle this in your AuthGate
        // For now, just show success message
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Onboarding completed! Welcome to the app!'),
            backgroundColor: Colors.green,
            behavior: SnackBarBehavior.floating,
          ),
          
        );
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const MainScaffold()),
        );
        // In a real app, you'd navigate to your main scaffold or trigger auth refresh
        // Navigator.of(context).pushNamedAndRemoveUntil('/home', (route) => false);
      }
    } catch (e) {
      if (mounted) {
        _showErrorSnackBar('Failed to complete setup. Please try again.');
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
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
              // Header with progress
              _buildHeader(),
              
              const SizedBox(height: 32),
              
              // Title and subtitle
              const Text(
                'EXPERIENCE',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                  letterSpacing: 1,
                ),
              ),
              
              const SizedBox(height: 8),
              
              const Text(
                'How much cricket do you know?',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white70,
                  fontWeight: FontWeight.w400,
                ),
              ),
              
              const SizedBox(height: 40),
              
              // Experience options
              Expanded(
                child: Column(
                  children: [
                    ..._experiences.map((experience) => 
                      _buildExperienceOption(experience)
                    ).expand((widget) => [widget, const SizedBox(height: 16)]).take(_experiences.length * 2 - 1),
                    
                    const Spacer(),
                    
                    // Navigation buttons
                    _buildNavigationButtons(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        // Back button
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
        
        // Progress indicator
        Column(
          children: [
            const Text(
              '2 of 2',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            // Progress bar
            Container(
              width: 60,
              height: 4,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                color: const Color(0xFF4CAF50),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildExperienceOption(Map<String, dynamic> experience) {
    final isSelected = _selectedExperience == experience['id'];
    
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedExperience = experience['id'];
        });
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: isSelected 
              ? const Color(0xFF4CAF50).withOpacity(0.15)
              : Colors.black.withOpacity(0.4),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected 
                ? const Color(0xFF4CAF50)
                : Colors.transparent,
            width: 2,
          ),
        ),
        child: Row(
          children: [
            // Icon container
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: (experience['color'] as Color).withOpacity(0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                experience['icon'] as IconData,
                color: experience['color'] as Color,
                size: 24,
              ),
            ),
            
            const SizedBox(width: 16),
            
            // Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    experience['title'] as String,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    experience['description'] as String,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.7),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            
            // Selection indicator
            Icon(
              isSelected ? Icons.check_circle : Icons.radio_button_unchecked,
              color: isSelected 
                  ? const Color(0xFF4CAF50)
                  : Colors.white.withOpacity(0.3),
              size: 24,
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
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'Back',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
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
                backgroundColor: const Color(0xFF4CAF50),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 0,
              ),
              child: _isLoading
                  ? const SizedBox(
                      width: 24,
                      height: 24,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 2,
                      ),
                    )
                  : const Text(
                      'Next',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
            ),
          ),
        ),
      ],
    );
  }
}