import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:sixers/backend/auth/auth_provider.dart';
import 'package:sixers/theme/colors.dart';

class VerifyCodeSheet extends ConsumerStatefulWidget {
  final String email;
  final String password;

  const VerifyCodeSheet({
    super.key,
    required this.email,
    required this.password,
  });

  @override
  ConsumerState<VerifyCodeSheet> createState() => _VerifyCodeSheetState();
}

class _VerifyCodeSheetState extends ConsumerState<VerifyCodeSheet> {
  final codeController = TextEditingController();
  bool loading = false;
  String? error;

  Future<void> verifyCode() async {
    setState(() {
      loading = true;
      error = null;
    });

    try {
      // 1️⃣ Confirm verification code
      final result = await Amplify.Auth.confirmSignUp(
        username: widget.email,
        confirmationCode: codeController.text.trim(),
      );

      if (!result.isSignUpComplete) {
        setState(() => error = "Verification not completed.");
        return;
      }

      // 2️⃣ Sign user in automatically after confirm
      await ref
          .read(authProviderProvider.notifier)
          .signIn(widget.email, widget.password, true);
    } catch (e) {
      if (mounted) {
        _showError(e.toString());
      }
    } finally {
      if (mounted) {
        setState(() => loading = false);
      }
    }
  }

  void _showError(String message) {
    // Clear any existing snackbars first (optional but recommended for errors)
    ScaffoldMessenger.of(context).clearSnackBars();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Expanded(child: Text(message)),
            GestureDetector(
              onTap: () {
                ScaffoldMessenger.of(context).clearSnackBars();
              },
              child: PhosphorIcon(PhosphorIcons.x(), color: AppColors.black100),
            ),
          ],
        ),
        backgroundColor: AppColors.red100,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      decoration: const BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Handle bar
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.3),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 32),

          Text(
            "Verify Your Email",
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 16),

          Text(
            "A verification code was sent to\n${widget.email}",
            textAlign: TextAlign.center,
            style: Theme.of(
              context,
            ).textTheme.bodyLarge?.copyWith(color: Colors.grey),
          ),

          const SizedBox(height: 32),

          TextField(
            controller: codeController,
            keyboardType: TextInputType.number,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: "Verification Code",
              hintStyle: TextStyle(color: Colors.grey.shade600),
              filled: true,
              fillColor: const Color(0xFF2C2C2C),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Colors.white, width: 1),
              ),
              contentPadding: const EdgeInsets.symmetric(
                vertical: 18,
                horizontal: 20,
              ),
            ),
          ),

          const SizedBox(height: 24),

          SizedBox(
            width: double.infinity,
            height: 56,
            child: ElevatedButton(
              onPressed: loading ? null : verifyCode,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 0,
              ),
              child: loading
                  ? const SizedBox(
                      width: 24,
                      height: 24,
                      child: CircularProgressIndicator(
                        color: Colors.black,
                        strokeWidth: 2,
                      ),
                    )
                  : const Text(
                      "Verify",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).viewInsets.bottom + 24),
        ],
      ),
    );
  }
}
