import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sixers/backend/auth/auth_provider.dart';
import 'package:sixers/views/auth/verify_code_page.dart';
import 'package:sixers/theme/colors.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  static final String route = "/sign-up";
  const SignUpScreen({super.key});

  @override
  ConsumerState<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  String? error;
  bool _isLoading = false;

  Future<void> _signUp() async {
    if (passwordController.text != confirmPasswordController.text) {
      setState(() => error = "Passwords do not match");
      return;
    }

    setState(() => _isLoading = true);
    try {
      await ref
          .read(authProviderProvider.notifier)
          .signUp(emailController.text.trim(), passwordController.text);
      if (mounted) {
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
      }
    } catch (e) {
      setState(() => error = e.toString());
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          // Image Section - Smaller top section
          Expanded(
            flex: 3,
            child: Container(
              width: double.infinity,
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
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Back Button
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.black.withValues(alpha: 0.3),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Content Section - Larger bottom section
          Expanded(
            flex: 7,
            child: Container(
              width: double.infinity,
              color: Colors.black,
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    Text(
                      'SIGN UP',
                      style: Theme.of(
                        context,
                      ).textTheme.headlineLarge?.copyWith(color: Colors.white),
                    ),

                    const SizedBox(height: 20),

                    // Email Field
                    _buildTextField(
                      controller: emailController,
                      hintText: 'someone@example.com',
                      label: 'Email',
                    ),

                    const SizedBox(height: 12),

                    // Password Field
                    _buildTextField(
                      controller: passwordController,
                      hintText: '••••••••••••',
                      label: 'Password',
                      isPassword: true,
                    ),

                    const SizedBox(height: 12),

                    // Confirm Password Field
                    _buildTextField(
                      controller: confirmPasswordController,
                      hintText: '••••••••••••',
                      label: 'Confirm Password',
                      isPassword: true,
                    ),

                    const SizedBox(height: 8),

                    // Error Message
                    if (error != null) ...[
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(12),
                        margin: const EdgeInsets.only(bottom: 8),
                        decoration: BoxDecoration(
                          color: Colors.red.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: Colors.red.withValues(alpha: 0.3),
                          ),
                        ),
                        child: Text(
                          error!,
                          style: Theme.of(
                            context,
                          ).textTheme.bodyMedium?.copyWith(color: Colors.red),
                        ),
                      ),
                    ],

                    const Spacer(),

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
                      onPressed: () {
                        // Handle Google sign up
                      },
                    ),

                    const SizedBox(height: 12),

                    // Already Have Account Button
                    Center(
                      child: TextButton(
                        onPressed: () {
                          Navigator.pop(context);
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
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    required String label,
    bool isPassword = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: Theme.of(context).textTheme.labelSmall),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          obscureText: isPassword,
          style: Theme.of(
            context,
          ).textTheme.bodyLarge?.copyWith(color: Colors.white),
          decoration: InputDecoration(hintText: hintText),
        ),
      ],
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
