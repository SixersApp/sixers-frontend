import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'experience_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

/// Basic Info Screen - First onboarding step
/// Collects user's name, date of birth, and country
class BasicInfoScreen extends ConsumerStatefulWidget {
  const BasicInfoScreen({super.key});

  @override
  ConsumerState<BasicInfoScreen> createState() => _BasicInfoScreenState();
}

class _BasicInfoScreenState extends ConsumerState<BasicInfoScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  
  // Date components
  int _selectedDay = 1;
  String _selectedMonth = 'January';
  int _selectedYear = 2000;
  
  // Country selection
  String? _selectedCountry;
  bool _isLoading = false;

  // Country list - you can expand this
  final List<String> _countries = [
    'United States',
    'India',
    'Australia',
    'United Kingdom',
    'Canada',
    'Pakistan',
    'Bangladesh',
    'South Africa',
    'New Zealand',
    'Sri Lanka',
    'Afghanistan',
    'West Indies',
  ];

  // Month names
  final List<String> _months = [
    'January', 'February', 'March', 'April', 'May', 'June',
    'July', 'August', 'September', 'October', 'November', 'December'
  ];

  @override
  void initState() {
    super.initState();
    // Set default country to United States (matching design)
    _selectedCountry = 'United States';
    // Set default date to reasonable age (e.g., 25 years old)
    final defaultDate = DateTime.now().subtract(const Duration(days: 365 * 25));
    _selectedDay = defaultDate.day;
    _selectedMonth = _months[defaultDate.month - 1];
    _selectedYear = defaultDate.year;
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  /// Handle next button press
  Future<void> _handleNext() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      final userId = Supabase.instance.client.auth.currentUser!.id;

      // Write to  `profiles` table
      await Supabase.instance.client.from('profiles').upsert({
        'user_id': userId, 
        'full_name': _nameController.text.trim(),
        'country': _selectedCountry,
        'dob': DateTime(
          _selectedYear,
          _months.indexOf(_selectedMonth) + 1,
          _selectedDay,
        ).toIso8601String()
      });

      if (mounted) {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const ExperienceScreen()),
        );
      }
    } catch (e) {
      if (mounted) {
        _showErrorSnackBar('Failed to save information. Please try again.');
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
              // Header with progress indicator
              _buildHeader(),
              
              const SizedBox(height: 32),
              
              // Title
              const Text(
                'BASIC INFO',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                  letterSpacing: 1,
                ),
              ),
              
              const SizedBox(height: 40),
              
              // Form content
              Expanded(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Name field
                      _buildFieldLabel('Name'),
                      const SizedBox(height: 12),
                      _buildNameField(),
                      
                      const SizedBox(height: 32),
                      
                      // Date of Birth
                      _buildFieldLabel('Date of Birth'),
                      const SizedBox(height: 12),
                      _buildDateSelectors(),
                      
                      const SizedBox(height: 32),
                      
                      // Country
                      _buildFieldLabel('Country'),
                      const SizedBox(height: 12),
                      _buildCountryDropdown(),
                      
                      const Spacer(),
                      
                      // Next Button
                      _buildNextButton(),
                    ],
                  ),
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
        // Back arrow (disabled for first screen)
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.grey,
            size: 20,
          ),
        ),
        
        const Spacer(),
        
        // Progress indicator
        Container(
          child: Column(
            children: [
              const Text(
                '1 of 2',
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
                  color: Colors.grey.withOpacity(0.3),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          color: const Color(0xFF4CAF50),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          color: Colors.grey.withOpacity(0.3),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFieldLabel(String label) {
    return Text(
      label,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget _buildNameField() {
    return TextFormField(
      controller: _nameController,
      style: const TextStyle(color: Colors.white, fontSize: 16),
      decoration: InputDecoration(
        hintText: 'John Doe',
        hintStyle: TextStyle(
          color: Colors.white.withOpacity(0.6),
          fontSize: 16,
        ),
        filled: true,
        fillColor: Colors.black.withOpacity(0.4),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 18,
        ),
      ),
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'Name is required';
        }
        if (value.trim().length < 2) {
          return 'Name must be at least 2 characters';
        }
        return null;
      },
    );
  }

  Widget _buildDateSelectors() {
    return Row(
      children: [
        // Day dropdown
        Expanded(
          flex: 2,
          child: _buildDropdownField(
            value: _selectedDay.toString().padLeft(2, '0'),
            items: List.generate(31, (index) => (index + 1).toString().padLeft(2, '0')),
            onChanged: (value) {
              setState(() {
                _selectedDay = int.parse(value!);
              });
            },
          ),
        ),
        
        const SizedBox(width: 12),
        
        // Month dropdown
        Expanded(
          flex: 3,
          child: _buildDropdownField(
            value: _selectedMonth,
            items: _months,
            onChanged: (value) {
              setState(() {
                _selectedMonth = value!;
              });
            },
          ),
        ),
        
        const SizedBox(width: 12),
        
        // Year dropdown
        Expanded(
          flex: 3,
          child: _buildDropdownField(
            value: _selectedYear.toString(),
            items: List.generate(80, (index) => (DateTime.now().year - index).toString()),
            onChanged: (value) {
              setState(() {
                _selectedYear = int.parse(value!);
              });
            },
          ),
        ),
      ],
    );
  }

  Widget _buildCountryDropdown() {
    return DropdownButtonFormField<String>(
      value: _selectedCountry,
      items: _countries.map((country) {
        return DropdownMenuItem<String>(
          value: country,
          child: Text(
            country,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
        );
      }).toList(),
      onChanged: (value) {
        setState(() {
          _selectedCountry = value;
        });
      },
      style: const TextStyle(color: Colors.white, fontSize: 16),
      dropdownColor: const Color(0xFF2C2C2C),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.black.withOpacity(0.4),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 18,
        ),
      ),
      icon: const Icon(Icons.keyboard_arrow_down, color: Colors.white),
    );
  }

  Widget _buildDropdownField({
    required String value,
    required List<String> items,
    required void Function(String?) onChanged,
  }) {
    return DropdownButtonFormField<String>(
      value: value,
      items: items.map((item) {
        return DropdownMenuItem<String>(
          value: item,
          child: Text(
            item,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
        );
      }).toList(),
      onChanged: onChanged,
      style: const TextStyle(color: Colors.white, fontSize: 16),
      dropdownColor: const Color(0xFF2C2C2C),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.black.withOpacity(0.4),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 18,
        ),
      ),
      icon: const Icon(Icons.keyboard_arrow_down, color: Colors.white),
    );
  }

  Widget _buildNextButton() {
    return SizedBox(
      width: double.infinity,
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
    );
  }
}
