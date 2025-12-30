import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:sixers/backend/auth/auth_provider.dart';
import 'package:sixers/backend/auth/g_auth_origin_provider.dart';
import 'package:sixers/theme/colors.dart';
import 'package:sixers/views/auth/sign_in_screen.dart';
import 'package:sixers/views/auth/verify_code_page.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  static final String route = "/sign-up";
  const SignUpScreen({super.key});

  @override
  ConsumerState<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  String? error;
  bool _isLoading = false;

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter your email";
    }
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    // 1. Check if input is empty
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    }

    // 2. Check for Minimum Length
    if (value.length < 8) {
      return 'Password must be at least 8 characters';
    }

    // 3. Check for Uppercase Letter
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'Password must contain at least one uppercase letter';
    }

    // 4. Check for Lowercase Letter
    if (!value.contains(RegExp(r'[a-z]'))) {
      return 'Password must contain at least one lowercase letter';
    }

    // 5. Check for Numbers
    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Password must contain at least one number';
    }

    // 6. Check for Special Characters
    // This regex checks for common special characters. You can add more if needed.
    if (!value.contains(RegExp(r'[!@#\$%^&*(),.?":{}|<>]'))) {
      return 'Password must contain at least one special character';
    }

    // Return null if all checks pass
    return null;
  }

  String? _validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) return 'Please confirm your password';
    if (value != passwordController.text) return 'Passwords do not match';
    return null;
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

  Future<void> _signUp() async {
    setState(() => _isLoading = true);
    try {
      await ref
          .read(authProviderProvider.notifier)
          .signUp(emailController.text.trim(), passwordController.text);
      if (mounted) {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          builder: (context) => VerifyCodeSheet(
            email: emailController.text.trim(),
            password: passwordController.text,
          ),
        );
      }
    } catch (e) {
      setState(() => _showError(e.toString()));
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _signInGoogle() async {
    setState(() => _isLoading = true);
    try {
      await ref.read(authProviderProvider.notifier).signInWithGoogle();
    } catch (e) {
      setState(() => _showError(e.toString()));
    } finally {
      setState(() => _isLoading = false);
    }
  }

  void _submit() {
    // Hide keyboard
    FocusScope.of(context).unfocus();

    // Trigger validation
    if (_formKey.currentState!.validate()) {
      // Save autofill context (ask user to save password)
      TextInput.finishAutofillContext();

      // Proceed with login
      _signUp();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Image Section - Smaller top section
            AspectRatio(
              aspectRatio: 5 / 4,
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/cricket_stadium.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withValues(alpha: 0.7),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            // Content Section - Larger bottom section
            Container(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: _formKey,
                child: AutofillGroup(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min, // VERY IMPORTANT
                    children: [
                      // Title
                      Text(
                        'SIGN UP',
                        style: Theme.of(context).textTheme.headlineLarge
                            ?.copyWith(color: Colors.white),
                      ),

                      const SizedBox(height: 20),

                      Text(
                        "Email",
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                      const SizedBox(height: 6),
                      TextFormField(
                        controller: emailController,
                        obscureText: false,
                        keyboardType: TextInputType.emailAddress,
                        autofillHints: const [
                          AutofillHints.email,
                          AutofillHints.username,
                        ],
                        textInputAction: TextInputAction.next,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        style: Theme.of(
                          context,
                        ).textTheme.bodyLarge?.copyWith(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: "someone@example.com",
                        ),
                        validator: _validateEmail,
                      ),

                      const SizedBox(height: 12),

                      // Password Field
                      Text(
                        "Password",
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                      const SizedBox(height: 6),
                      TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        keyboardType: TextInputType.visiblePassword,
                        autofillHints: const [AutofillHints.password],
                        textInputAction: TextInputAction.next,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        style: Theme.of(
                          context,
                        ).textTheme.bodyLarge?.copyWith(color: Colors.white),
                        decoration: InputDecoration(hintText: "••••••••••••"),
                        validator: _validatePassword,
                      ),

                      const SizedBox(height: 12),

                      // Confirm Password Field
                      Text(
                        "Confirm Password",
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                      const SizedBox(height: 6),
                      TextFormField(
                        controller: confirmPasswordController,
                        obscureText: true,
                        keyboardType: TextInputType.visiblePassword,
                        autofillHints: const [AutofillHints.password],
                        textInputAction: TextInputAction.done,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        onFieldSubmitted: (_) => _submit(),
                        style: Theme.of(
                          context,
                        ).textTheme.bodyLarge?.copyWith(color: Colors.white),
                        decoration: InputDecoration(hintText: "••••••••••••"),
                        validator: _validateConfirmPassword,
                      ),

                      const SizedBox(height: 20),
                      // Submit Button
                      SizedBox(
                        width: double.infinity,
                        height: 56,
                        child: ElevatedButton(
                          onPressed: _isLoading ? null : _signUp,
                          child: _isLoading
                              ? const SizedBox(
                                  width: 24,
                                  height: 24,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                  ),
                                )
                              : Text('Submit'),
                        ),
                      ),

                      const SizedBox(height: 16),

                      // Social Login Buttons
                      _buildSocialButton(
                        image: Image.asset('assets/images/google.png'),
                        label: 'Continue with Google',
                        onPressed: _signInGoogle,
                      ),

                      const SizedBox(height: 12),

                      // Already Have Account Button
                      Center(
                        child: TextButton(
                          onPressed: () {
                            ref
                                .read(gAuthOriginProvider.notifier)
                                .changeOrigin(SignInScreen.route);
                            context.go(SignInScreen.route);
                          },
                          child: Text('Already Have an Account'),
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
    );
  }

  Widget _buildSocialButton({
    required Widget image,
    required String label,
    required VoidCallback onPressed,
  }) {
    return FilledButton(
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [image, const SizedBox(width: 12), Text(label)],
      ),
    );
  }
}
