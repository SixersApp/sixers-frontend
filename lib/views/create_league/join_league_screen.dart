import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:sixers/backend/leagues/league_model.dart';
import 'package:sixers/backend/leagues/league_service.dart';
import 'package:sixers/theme/colors.dart';
import 'package:sixers/views/create_league/league_preview_screen.dart';

class JoinLeagueScreen extends ConsumerStatefulWidget {
  static const String route = '/join-league';

  const JoinLeagueScreen({super.key});

  @override
  ConsumerState<JoinLeagueScreen> createState() => _JoinLeagueScreenState();
}

class _JoinLeagueScreenState extends ConsumerState<JoinLeagueScreen> {
  final _leagueService = LeagueService();
  final List<TextEditingController> _controllers = List.generate(
    6,
    (_) => TextEditingController(),
  );
  final List<FocusNode> _focusNodes = List.generate(6, (_) => FocusNode());

  bool _isSearching = false;
  String? _errorMessage;

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  String get _fullCode {
    return _controllers.map((c) => c.text).join();
  }

  bool get _isCodeComplete => _fullCode.length == 6;

  void _onCodeChanged(int index, String value) {
    // Handle paste - if value is longer than 1 character, distribute across fields
    if (value.length > 1) {
      _handlePaste(value, index);
      return;
    }

    // Ensure only 1 character in the field (truncate if needed)
    if (value.length == 1) {
      _controllers[index].text = value.toUpperCase();
      _controllers[index].selection = TextSelection.fromPosition(
        TextPosition(offset: 1),
      );
    }

    if (value.isNotEmpty && index < 5) {
      // Move to next field
      _focusNodes[index + 1].requestFocus();
    }

    // Reset error when typing
    if (_errorMessage != null) {
      setState(() {
        _errorMessage = null;
      });
    }

    setState(() {});
  }

  void _handlePaste(String pastedText, int startIndex) {
    // Clean the pasted text - only alphanumeric, uppercase
    final cleanText = pastedText
        .toUpperCase()
        .replaceAll(RegExp(r'[^A-Z0-9]'), '')
        .substring(0, pastedText.length.clamp(0, 6));

    // Distribute characters starting from first box
    for (int i = 0; i < 6; i++) {
      if (i < cleanText.length) {
        _controllers[i].text = cleanText[i];
      } else {
        _controllers[i].clear();
      }
    }

    // Focus on the next empty field or the last field
    final nextIndex = cleanText.length.clamp(0, 5);
    _focusNodes[nextIndex].requestFocus();

    // Reset error
    if (_errorMessage != null) {
      setState(() {
        _errorMessage = null;
      });
    }

    setState(() {});
  }

  void _onKeyPressed(int index, KeyEvent event) {
    if (event is KeyDownEvent &&
        event.logicalKey == LogicalKeyboardKey.backspace &&
        _controllers[index].text.isEmpty &&
        index > 0) {
      // Move to previous field on backspace when current is empty
      _focusNodes[index - 1].requestFocus();
      _controllers[index - 1].clear();
    }
  }

  Future<void> _joinLeague() async {
    if (!_isCodeComplete) return;

    setState(() {
      _isSearching = true;
      _errorMessage = null;
    });

    try {
      final league = await _leagueService.findLeagueByCode(_fullCode);

      if (mounted) {
        if (league != null) {
          // Navigate to league preview screen
          setState(() => _isSearching = false);
          context.push(
            LeaguePreviewScreen.route,
            extra: {'league': league},
          );
        } else {
          setState(() {
            _isSearching = false;
            _errorMessage = 'No league found with this code';
          });
        }
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _isSearching = false;
          _errorMessage = 'Failed to find league';
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black100,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => context.pop(),
                    child: PhosphorIcon(
                      PhosphorIcons.caretLeft(),
                      size: 24,
                      color: AppColors.black800,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Text(
                    "FIND LEAGUE",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),

            // Enter Join Code label
            Text(
              'Enter Join Code',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.black500,
                  ),
            ),

            const SizedBox(height: 16),

            // 6 Code Input Boxes
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(6, (index) {
                  return Padding(
                    padding: EdgeInsets.only(left: index > 0 ? 10 : 0),
                    child: _buildCodeBox(index),
                  );
                }),
              ),
            ),

            // Error message
            if (_errorMessage != null) ...[
              const SizedBox(height: 24),
              Text(
                _errorMessage!,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.redAccent,
                    ),
              ),
            ],

            const Spacer(),

            // Join Button
            Padding(
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: _isCodeComplete && !_isSearching ? _joinLeague : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.black800,
                    disabledBackgroundColor: AppColors.black400,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: _isSearching
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: AppColors.black100,
                          ),
                        )
                      : Text(
                          'Join',
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                fontWeight: FontWeight.w600,
                                color: AppColors.black100,
                              ),
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCodeBox(int index) {
    return SizedBox(
      width: 52,
      height: 52,
      child: KeyboardListener(
        focusNode: FocusNode(),
        onKeyEvent: (event) => _onKeyPressed(index, event),
        child: TextField(
          controller: _controllers[index],
          focusNode: _focusNodes[index],
          textAlign: TextAlign.center,
          textAlignVertical: TextAlignVertical.center,
          textCapitalization: TextCapitalization.characters,
          style: Theme.of(context).textTheme.headlineMedium,
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9]')),
            UpperCaseTextFormatter(),
          ],
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(bottom: 10),
            filled: true,
            fillColor: AppColors.black200,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: AppColors.black400),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: AppColors.black400),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: AppColors.black600, width: 2),
            ),
          ),
          onChanged: (value) => _onCodeChanged(index, value),
        ),
      ),
    );
  }
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}
