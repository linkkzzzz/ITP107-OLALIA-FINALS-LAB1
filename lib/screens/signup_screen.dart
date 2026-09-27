import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/watercolor_background.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/primary_button.dart';
import '../widgets/glow_avatar.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmController.dispose();
    super.dispose();
  }

  void _handleSignUp() {
    if (_formKey.currentState!.validate()) {
      // Navigator method (3): pushReplacementNamed — Sign-Up is replaced by
      // Home, carrying the entered full name forward as route arguments.
      Navigator.pushReplacementNamed(
        context,
        '/home',
        arguments: _nameController.text.trim(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WatercolorBackground(
        child: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 24),
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight - 48),
                  child: Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 440),
                      child: TweenAnimationBuilder<double>(
                        tween: Tween(begin: 0, end: 1),
                        duration: const Duration(milliseconds: 650),
                        curve: Curves.easeOutCubic,
                        builder: (context, value, child) => Opacity(
                          opacity: value,
                          child: Transform.translate(
                            offset: Offset(0, (1 - value) * 24),
                            child: child,
                          ),
                        ),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                          InkWell(
                            borderRadius: BorderRadius.circular(20),
                            // Navigator method (4): pop — returns to whatever
                            // screen pushed Sign-Up (Login), preserving its state.
                            onTap: () => Navigator.pop(context),
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white.withValues(alpha: 0.6),
                              ),
                              child: const Icon(Icons.arrow_back, color: AppColors.charcoal, size: 20),
                            ),
                          ),
                          const SizedBox(height: 16),
                          const Align(
                            alignment: Alignment.center,
                            child: GlowAvatar(
                              size: 52,
                              child: Icon(Icons.person_add_alt_1, color: Colors.white, size: 24),
                            ),
                          ),
                          const SizedBox(height: 18),
                          const Align(
                            alignment: Alignment.center,
                            child: Text(
                              'Create Account',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 26, fontWeight: FontWeight.w700, color: AppColors.charcoal),
                            ),
                          ),
                          const SizedBox(height: 6),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              'Join us and get started',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 14, color: AppColors.graphite.withValues(alpha: 0.9)),
                            ),
                          ),
                          const SizedBox(height: 24),
                          CustomTextField(
                            controller: _nameController,
                            label: 'Full Name',
                            icon: Icons.badge_outlined,
                            validator: (v) =>
                                (v == null || v.trim().isEmpty) ? 'Please enter your full name' : null,
                          ),
                          const SizedBox(height: 16),
                          CustomTextField(
                            controller: _emailController,
                            label: 'Email',
                            icon: Icons.email_outlined,
                            keyboardType: TextInputType.emailAddress,
                            validator: (v) {
                              if (v == null || v.trim().isEmpty) return 'Please enter your email';
                              final regex = RegExp(r'^[\w\.-]+@[\w\.-]+\.\w+$');
                              if (!regex.hasMatch(v.trim())) return 'Enter a valid email address';
                              return null;
                            },
                          ),
                          const SizedBox(height: 16),
                          CustomTextField(
                            controller: _passwordController,
                            label: 'Password',
                            icon: Icons.lock_outline,
                            obscureText: true,
                            validator: (v) =>
                                (v == null || v.length < 6) ? 'Password must be at least 6 characters' : null,
                          ),
                          const SizedBox(height: 16),
                          CustomTextField(
                            controller: _confirmController,
                            label: 'Confirm Password',
                            icon: Icons.lock_reset_outlined,
                            obscureText: true,
                            validator: (v) =>
                                (v != _passwordController.text) ? 'Passwords do not match' : null,
                          ),
                          const SizedBox(height: 28),
                          PrimaryButton(label: 'Sign Up', icon: Icons.check, onPressed: _handleSignUp),
                          const SizedBox(height: 22),
                          Center(
                            child: Wrap(
                              alignment: WrapAlignment.center,
                              children: [
                                Text(
                                  'Already have an account? ',
                                  style: TextStyle(color: AppColors.graphite.withValues(alpha: 0.9)),
                                ),
                                GestureDetector(
                                  onTap: () => Navigator.pop(context),
                                  child: const Text(
                                    'Login',
                                    style: TextStyle(color: AppColors.slateBlueDark, fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ],
                            ),
                          ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
