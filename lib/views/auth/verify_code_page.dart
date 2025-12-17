import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:sixers/backend/auth/auth_provider.dart';
import 'package:sixers/views/auth/auth_gate.dart';
import 'package:sixers/views/auth/sign_in_screen.dart';
import 'package:sixers/views/home/home_screen.dart';

class VerifyCodePage extends ConsumerStatefulWidget {
  final String email;
  final String password; // <-- IMPORTANT: pass in password from SignUp

  const VerifyCodePage({
    super.key,
    required this.email,
    required this.password,
  });

  @override
  ConsumerState<VerifyCodePage> createState() => _VerifyCodePageState();
}

class _VerifyCodePageState extends ConsumerState<VerifyCodePage> {
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
      await ref.read(authProviderProvider.notifier).signIn(widget.email, widget.password, true);

      Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AuthGate(),
            ),
          );

    } on AuthException catch (e) {
      setState(() => error = e.message);
    } finally {
      setState(() => loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Verify Your Email",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 16),

              Text(
                "A verification code was sent to\n${widget.email}",
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16),
              ),

              const SizedBox(height: 32),

              // 🔥 Thin gray border input field
              TextField(
                controller: codeController,
                keyboardType: TextInputType.number,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: "Verification Code",
                  hintStyle: TextStyle(color: Colors.grey.shade600),
                  filled: true,
                  fillColor: const Color(0xFF1A1A1A),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(
                      color: Colors.grey.shade700,
                      width: 1,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(
                      color: Colors.grey.shade500,
                      width: 1.2,
                    ),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 18,
                    horizontal: 20,
                  ),
                ),
              ),

              if (error != null) ...[
                const SizedBox(height: 12),
                Text(error!, style: const TextStyle(color: Colors.red)),
              ],

              const SizedBox(height: 24),

              ElevatedButton(
                onPressed: loading ? null : verifyCode,
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: loading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text("Verify"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}