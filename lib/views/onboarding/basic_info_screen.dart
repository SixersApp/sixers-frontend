import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:sixers/backend/auth/onboarding_provider.dart';
import 'package:sixers/utils/logger.dart';

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

  int _selectedDay = 1;
  String _selectedMonth = 'January';
  int _selectedYear = 2000;

  String? _selectedCountry;
  bool _isLoading = false;

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

  final List<String> _months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];

  @override
  void initState() {
    super.initState();
    _selectedCountry = 'United States';
    final defaultDate = DateTime.now().subtract(const Duration(days: 365 * 25));
    _selectedDay = defaultDate.day;
    _selectedMonth = _months[defaultDate.month - 1];
    _selectedYear = defaultDate.year;
    _loadExisting();
  }

  Future<void> _loadExisting() async {
    try {
      final userId = Supabase.instance.client.auth.currentUser?.id;
      if (userId == null) return;
      final response = await Supabase.instance.client
          .from('profiles')
          .select('full_name, country, dob')
          .eq('user_id', userId)
          .maybeSingle();
      if (!mounted || response == null) return;
      final fullName = response['full_name'] as String?;
      final country = response['country'] as String?;
      final dobStr = response['dob'] as String?;
      if (fullName != null && fullName.isNotEmpty) {
        _nameController.text = fullName;
      }
      if (country != null && country.isNotEmpty && _countries.contains(country)) {
        setState(() => _selectedCountry = country);
      }
      if (dobStr != null && dobStr.isNotEmpty) {
        final dob = DateTime.tryParse(dobStr);
        if (dob != null) {
          setState(() {
            _selectedDay = dob.day;
            _selectedMonth = _months[dob.month - 1];
            _selectedYear = dob.year;
          });
        }
      }
    } catch (_) {
      // ignore prefill errors
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  Future<void> _handleNext() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      final userId = Supabase.instance.client.auth.currentUser!.id;

      await Supabase.instance.client
          .from('profiles')
          .upsert({
            'user_id': userId,
            'full_name': _nameController.text.trim(),
            'country': _selectedCountry,
            'dob': DateTime(_selectedYear, _months.indexOf(_selectedMonth) + 1, _selectedDay).toIso8601String(),
            'onboarding_stage': 1,
          })
          .select('user_id')
          .single();

      await ref.read(onboardingStageProvider(userId).notifier).advanceTo(1);
    } catch (e, st) {
      logError('BasicInfoScreen error: $e', st);
      if (e is PostgrestException) {
        logWarning('PostgrestException: ${e.code} ${e.message} ${e.details}');
      }
      if (mounted) _showErrorSnackBar('Failed to save information. Please try again.');
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
              Text(
                'BASIC INFO',
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                  letterSpacing: 1.5,
                  fontSize: 36,
                ),
              ),
              const SizedBox(height: 32),
              Expanded(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildFieldLabel('Name'),
                      const SizedBox(height: 12),
                      _buildNameField(),
                      const SizedBox(height: 32),
                      _buildFieldLabel('Date of Birth'),
                      const SizedBox(height: 12),
                      _buildDateSelectors(),
                      const SizedBox(height: 32),
                      _buildFieldLabel('Country'),
                      const SizedBox(height: 12),
                      _buildCountryDropdown(),
                      const Spacer(),
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
    return Column(
      children: [
        Row(
          children: [
            const Spacer(),
            Text(
              '1 of 2',
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
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(3), color: Colors.grey.withValues(alpha: 0.3)),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.horizontal(left: Radius.circular(3)),
                    color: const Color(0xFF4CAF50),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.horizontal(right: Radius.circular(3)),
                    color: Colors.grey.withValues(alpha: 0.3),
                  ),
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
      style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 18),
    );
  }

  Widget _buildNameField() {
    return TextFormField(
      controller: _nameController,
      style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white, fontSize: 16),
      decoration: InputDecoration(
        hintText: 'John Doe',
        hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white.withValues(alpha: 0.6)),
        filled: true,
        fillColor: const Color(0xFF2C2C2C),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      ),
      validator: (value) {
        if (value == null || value.trim().isEmpty) return 'Name is required';
        if (value.trim().length < 2) return 'Name must be at least 2 characters';
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
            value: _selectedDay.toString(),
            items: List.generate(31, (i) => (i + 1).toString()),
            onChanged: (value) => setState(() => _selectedDay = int.parse(value!)),
            fontSize: 14, // slightly smaller for day
          ),
        ),
        const SizedBox(width: 12),
        // Month dropdown
        Expanded(
          flex: 4,
          child: _buildDropdownField(
            value: _selectedMonth,
            items: _months,
            onChanged: (value) => setState(() => _selectedMonth = value!),
          ),
        ),
        const SizedBox(width: 12),
        // Year dropdown
        Expanded(
          flex: 3,
          child: _buildDropdownField(
            value: _selectedYear.toString(),
            items: List.generate(80, (i) => (DateTime.now().year - i).toString()),
            onChanged: (value) => setState(() => _selectedYear = int.parse(value!)),
          ),
        ),
      ],
    );
  }

  Widget _buildCountryDropdown() {
    return DropdownButtonFormField<String>(
      value: _selectedCountry,
      items: _countries.map((c) {
        return DropdownMenuItem(
          value: c,
          child: Text(c, style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white)),
        );
      }).toList(),
      onChanged: (value) => setState(() => _selectedCountry = value),
      style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white),
      dropdownColor: const Color(0xFF2C2C2C),
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFF2C2C2C),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      ),
      icon: const Icon(Icons.keyboard_arrow_down, color: Colors.white),
    );
  }

  Widget _buildDropdownField({
    required String value,
    required List<String> items,
    required void Function(String?) onChanged,
    double fontSize = 16,
  }) {
    return DropdownButtonFormField<String>(
      value: value,
      items: items.map((item) {
        return DropdownMenuItem(
          value: item,
          child: Text(
            item,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white, fontSize: fontSize),
          ),
        );
      }).toList(),
      onChanged: onChanged,
      dropdownColor: const Color(0xFF2C2C2C),
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFF2C2C2C),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
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
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          elevation: 0,
        ),
        child: _isLoading
            ? const SizedBox(width: 24, height: 24, child: CircularProgressIndicator(color: Colors.black, strokeWidth: 2))
            : const Text('Next', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
      ),
    );
  }
}
