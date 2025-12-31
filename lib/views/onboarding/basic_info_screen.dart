import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sixers/backend/auth/auth_provider.dart';
import 'package:sixers/backend/onboarding/onboarding_provider.dart';
import 'package:sixers/utils/logger.dart';
import 'package:sixers/views/onboarding/experience_screen.dart';

class BasicInfoScreen extends ConsumerStatefulWidget {
  static final String route = '/onboarding/1';
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
  bool _loadingProfile = true;

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

  final List<String> _months = const [
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

    _waitForAuthAndRestore();
  }

  Future<void> _waitForAuthAndRestore() async {
    await Future.delayed(const Duration(milliseconds: 60));

    final authAsync = ref.read(authProviderProvider);

    if (authAsync.isLoading) {
      return _waitForAuthAndRestore();
    }

    final session = authAsync.value;
    if (session != null) {
      await _loadExisting();
    }

    if (mounted) setState(() => _loadingProfile = false);
  }

  Future<void> _loadExisting() async {
    try {
      final profileData = await ref.watch(onboardingStageProvider.future);
      if (!mounted) return;

      if (profileData != null) {
        _nameController.text = profileData.fullName;
      }

      final country = profileData?.country;
      if (country != null && _countries.contains(country)) {
        _selectedCountry = country;
      }

      final dob = profileData?.dob;
      if (dob != null) {
        _selectedDay = dob.day;
        _selectedMonth = _months[dob.month - 1];
        _selectedYear = dob.year;
      }
    } catch (e) {
      print("Profile restore failed: $e");
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  Future<void> _handleNext(BuildContext context) async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      final notifier = ref.read(onboardingStageProvider.notifier);
      final profileData = await ref.watch(onboardingStageProvider.future);
      final newProfile = profileData!.copyWith(
        fullName: _nameController.text,
        country: _selectedCountry!,
        dob: DateTime(
          _selectedYear,
          _months.indexOf(_selectedMonth) + 1,
          _selectedDay,
        ),
        onboardingStage: max(profileData.onboardingStage, 1),
      );
      await notifier.updateProfileInfo(profileData: newProfile);
      if (context.mounted) {
        context.go(ExperienceScreen.route);
      }
    } catch (e, st) {
      logError('BasicInfoScreen error: $e', st);
      _showErrorSnackBar('Failed to save information. Please try again.');
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
    if (_loadingProfile) {
      return const Scaffold(
        backgroundColor: Color(0xFF1C1C1C),
        body: Center(child: CircularProgressIndicator(color: Colors.white)),
      );
    }

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
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  fontSize: 48,
                ),
              ),
              const SizedBox(height: 15),
              Expanded(
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildFieldLabel('Name'),
                        const SizedBox(height: 6),
                        TextFormField(
                          controller: _nameController,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                          decoration: InputDecoration(hintText: 'John Doe'),
                          textInputAction: TextInputAction.next,
                          autofillHints: const [AutofillHints.name],
                          validator: (value) {
                            if (value == null || value.trim().isEmpty)
                              return 'Name is required';
                            if (value.trim().length < 2)
                              return 'Name must be at least 2 characters';
                            return null;
                          },
                        ),
                        const SizedBox(height: 12),
                        _buildFieldLabel('Date of Birth'),
                        const SizedBox(height: 6),
                        _buildDateSelectors(),
                        const SizedBox(height: 12),
                        _buildFieldLabel('Country'),
                        const SizedBox(height: 6),
                        _buildCountryDropdown(),
                        const SizedBox(height: 48),
                        SizedBox(
                          width: double.infinity,
                          height: 56,
                          child: ElevatedButton(
                            onPressed: _isLoading
                                ? null
                                : () => _handleNext(context),
                            child: _isLoading
                                ? const SizedBox(
                                    width: 24,
                                    height: 24,
                                    child: CircularProgressIndicator(
                                      color: Colors.black,
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
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFieldLabel(String label) {
    return Text(label, style: Theme.of(context).textTheme.labelSmall);
  }

  Widget _buildDateSelectors() {
    return Row(
      children: [
        Flexible(
          flex: 2,
          child: _buildDropdownField(
            value: _selectedDay.toString(),
            items: List.generate(31, (i) => (i + 1).toString()),
            onChanged: (value) {
              setState(() => _selectedDay = int.parse(value!));
              FocusScope.of(context).nextFocus();
            },
          ),
        ),
        const SizedBox(width: 8),
        Flexible(
          flex: 4,
          child: _buildDropdownField(
            value: _selectedMonth,
            items: _months,
            onChanged: (value) {
              setState(() => _selectedMonth = value!);
              FocusScope.of(context).nextFocus();
            },
          ),
        ),
        const SizedBox(width: 8),
        Flexible(
          flex: 3,
          child: _buildDropdownField(
            value: _selectedYear.toString(),
            items: List.generate(
              80,
              (i) => (DateTime.now().year - i).toString(),
            ),
            onChanged: (value) {
              setState(() => _selectedYear = int.parse(value!));
              FocusScope.of(context).nextFocus();
            },
          ),
        ),
      ],
    );
  }

  Widget _buildCountryDropdown() {
    final safeValue =
        (_selectedCountry != null && _countries.contains(_selectedCountry))
        ? _selectedCountry
        : null;

    return DropdownButtonFormField<String>(
      value: safeValue,
      items: _countries
          .map(
            (c) => DropdownMenuItem(
              value: c,
              child: Text(c, style: Theme.of(context).textTheme.bodyLarge),
            ),
          )
          .toList(),
      onChanged: (value) {
        setState(() => _selectedCountry = value);
        FocusScope.of(context).nextFocus();
      },
      dropdownColor: const Color(0xFF2C2C2C),
      icon: const Icon(Icons.keyboard_arrow_down, color: Colors.white),
    );
  }

  Widget _buildDropdownField({
    required String? value,
    required List<String> items,
    required void Function(String?) onChanged,
    double fontSize = 16,
  }) {
    return DropdownButtonFormField<String>(
      value: items.contains(value) ? value : null,
      isExpanded: true,
      items: items
          .map(
            (item) => DropdownMenuItem(
              value: item,
              child: Text(
                item,
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

  Widget _buildHeader() {
    return Column(
      children: [
        Row(
          children: const [
            Spacer(),
            Text('1 of 2', style: TextStyle(color: Colors.white)),
          ],
        ),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          height: 6,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3),
            color: Colors.grey.withOpacity(0.3),
          ),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(3),
                    ),
                    color: Color(0xFF4CAF50),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.horizontal(
                      right: Radius.circular(3),
                    ),
                    color: Colors.grey.withOpacity(0.3),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
