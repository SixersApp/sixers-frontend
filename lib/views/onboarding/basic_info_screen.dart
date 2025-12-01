import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sixers/backend/auth/auth_provider.dart';
import 'package:sixers/backend/auth/onboarding_provider.dart';
import 'package:sixers/utils/logger.dart';

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

    final defaultDate =
        DateTime.now().subtract(const Duration(days: 365 * 25));
    _selectedDay = defaultDate.day;
    _selectedMonth = _months[defaultDate.month - 1];
    _selectedYear = defaultDate.year;

    _waitForAuthAndRestore();
  }

  /// Ensures AuthProvider has finished async loading
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
      final response =
          await ref.read(onboardingStageProvider.notifier).fetchProfile();

      if (!mounted || response.isEmpty) return;

      if (response['full_name'] != null) {
        _nameController.text = response['full_name'];
      }

      final country = response['country'];
      if (country != null && _countries.contains(country)) {
        _selectedCountry = country;
      }

      final dobStr = response['dob'];
      if (dobStr != null) {
        final dob = DateTime.tryParse(dobStr);
        if (dob != null) {
          _selectedDay = dob.day;
          _selectedMonth = _months[dob.month - 1];
          _selectedYear = dob.year;
        }
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

  Future<void> _handleNext() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      await ref.read(onboardingStageProvider.notifier).updateBasicInfo(
            fullName: _nameController.text,
            country: _selectedCountry!,
            dob: DateTime(
              _selectedYear,
              _months.indexOf(_selectedMonth) + 1,
              _selectedDay,
            ).toIso8601String(),
          );
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
        body: Center(
          child: CircularProgressIndicator(color: Colors.white),
        ),
      );
    }

    return Scaffold(
      backgroundColor: const Color(0xFF1C1C1C),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: _buildBody(context),
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Column(
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

        /// ⭐ Limit the scrollable form height
        Expanded(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: constraints.maxHeight * 0.8,
                ),
                child: SingleChildScrollView(
                  child: _buildForm(),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildForm() {
    return Form(
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
          const SizedBox(height: 48),
          _buildNextButton(),
        ],
      ),
    );
  }

  Widget _buildFieldLabel(String label) {
    return Text(
      label,
      style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 18,
          ),
    );
  }

  Widget _buildNameField() {
    return TextFormField(
      controller: _nameController,
      style: const TextStyle(color: Colors.white, fontSize: 16),
      decoration: InputDecoration(
        hintText: 'John Doe',
        hintStyle: TextStyle(color: Colors.white.withOpacity(0.6)),
        filled: true,
        fillColor: const Color(0xFF2C2C2C),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
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
        Flexible(
          flex: 2,
          child: _buildDropdownField(
            value: _selectedDay.toString(),
            items: List.generate(31, (i) => (i + 1).toString()),
            onChanged: (value) =>
                setState(() => _selectedDay = int.parse(value!)),
            fontSize: 14,
          ),
        ),
        const SizedBox(width: 8),
        Flexible(
          flex: 4,
          child: _buildDropdownField(
            value: _selectedMonth,
            items: _months,
            onChanged: (value) => setState(() => _selectedMonth = value!),
            fontSize: 14,
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
            onChanged: (value) =>
                setState(() => _selectedYear = int.parse(value!)),
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  Widget _buildCountryDropdown() {
    final safeValue = (_selectedCountry != null &&
            _countries.contains(_selectedCountry))
        ? _selectedCountry
        : null;

    return DropdownButtonFormField<String>(
      value: safeValue,
      items: _countries
          .map((c) => DropdownMenuItem(
                value: c,
                child: Text(c, style: const TextStyle(color: Colors.white)),
              ))
          .toList(),
      onChanged: (value) => setState(() => _selectedCountry = value),
      dropdownColor: const Color(0xFF2C2C2C),
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFF2C2C2C),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      ),
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
                style: TextStyle(color: Colors.white, fontSize: fontSize),
              ),
            ),
          )
          .toList(),
      onChanged: onChanged,
      dropdownColor: const Color(0xFF2C2C2C),
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFF2C2C2C),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
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
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          elevation: 0,
        ),
        child: _isLoading
            ? const SizedBox(
                width: 24,
                height: 24,
                child:
                    CircularProgressIndicator(color: Colors.black, strokeWidth: 2),
              )
            : const Text('Next',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
      ),
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
                    borderRadius:
                        BorderRadius.horizontal(left: Radius.circular(3)),
                    color: Color(0xFF4CAF50),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius:
                        const BorderRadius.horizontal(right: Radius.circular(3)),
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