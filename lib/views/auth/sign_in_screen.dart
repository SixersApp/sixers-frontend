import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:sixers/backend/auth/auth_provider.dart';
import 'package:sixers/theme/colors.dart';
import 'package:sixers/views/auth/sign_up_page.dart';

class SignInScreen extends ConsumerStatefulWidget {
  static final String route = '/auth';
  const SignInScreen({super.key});

  @override
  ConsumerState<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String? error;
  bool _isLoading = false;

  void _submit() {
    // Hide keyboard
    FocusScope.of(context).unfocus();

    // Trigger validation
    if (_formKey.currentState!.validate()) {
      // Save autofill context (ask user to save password)
      TextInput.finishAutofillContext();

      // Proceed with login
      _signIn();
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

  Future<void> _signIn() async {
    setState(() => _isLoading = true);
    try {
      await ref
          .read(authProviderProvider.notifier)
          .signIn(emailController.text.trim(), passwordController.text, false);
    } catch (e) {
      setState(() {
        error = e.toString();
        _showError(e.toString());
      });
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _signInGoogle() async {
    setState(() => _isLoading = true);
    try {
      await ref.read(authProviderProvider.notifier).signInWithGoogle();
    } catch (e) {
      setState(() {
        error = e.toString();
        _showError(e.toString());
      });
    } finally {
      setState(() => _isLoading = false);
    }
  }

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
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
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
                      colors: [Colors.transparent, Colors.black87],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min, // VERY IMPORTANT
                  children: [
                    Text(
                      'LOGIN',
                      style: Theme.of(context).textTheme.headlineLarge
                          ?.copyWith(letterSpacing: 1.5, color: Colors.white),
                    ),

                    const SizedBox(height: 20),
                    AutofillGroup(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            style: Theme.of(context).textTheme.bodyLarge
                                ?.copyWith(color: Colors.white),
                            decoration: InputDecoration(
                              hintText: "someone@example.com",
                            ),
                            validator: _validateEmail,
                          ),
                          const SizedBox(height: 12),

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
                            textInputAction: TextInputAction.done,
                            onFieldSubmitted: (_) => _submit(),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            style: Theme.of(context).textTheme.bodyLarge
                                ?.copyWith(color: Colors.white),
                            decoration: InputDecoration(
                              hintText: "••••••••••••",
                            ),
                            validator: _validatePassword,
                          ),
                          const SizedBox(height: 12),
                        ],
                      ),
                    ),

                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'Forget Password',
                          style: Theme.of(context).textTheme.labelLarge
                              ?.copyWith(color: const Color(0xFF79E089)),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: ElevatedButton(
                        onPressed: _isLoading ? null : _submit,
                        child: _isLoading
                            ? const SizedBox(
                                width: 24,
                                height: 24,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 2,
                                ),
                              )
                            : Text('Submit'),
                      ),
                    ),

                    const SizedBox(height: 16),

                    _buildSocialButton(
                      image: Image.asset('assets/images/google.png'),
                      label: 'Continue with Google',
                      onPressed: _signInGoogle,
                    ),

                    const SizedBox(height: 12),

                    Center(
                      child: TextButton(
                        onPressed: () {
                          context.go(SignUpScreen.route);
                        },
                        child: Text('Create an Account'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    required String label,
    required FormFieldValidator<String?> validator,
    bool isPassword = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: Theme.of(context).textTheme.labelSmall),
        const SizedBox(height: 6),
        TextFormField(
          controller: controller,
          obscureText: isPassword,
          style: Theme.of(
            context,
          ).textTheme.bodyLarge?.copyWith(color: Colors.white),
          decoration: InputDecoration(hintText: hintText),
          validator: validator,
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
