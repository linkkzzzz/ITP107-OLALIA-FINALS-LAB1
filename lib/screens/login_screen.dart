import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/watercolor_background.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/primary_button.dart';
import '../widgets/glow_avatar.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleLogin() {
    if (_formKey.currentState!.validate()) {
      final typed = _emailController.text.trim();
      final displayName = typed.contains('@') ? typed.split('@').first : typed;

      // Navigator method (1): pushReplacementNamed — Login is replaced by
      // Home so the user can't navigate "back" into the login form.
      Navigator.pushReplacementNamed(
        context,
        '/home',
        arguments: displayName.isEmpty ? 'Guest' : displayName,
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
                padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 32),
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight - 64),
                  child: Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 420),
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
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                          const GlowAvatar(
                            size: 56,
                            child: Icon(Icons.login, color: Colors.white, size: 28),
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            'Welcome Back',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 26, fontWeight: FontWeight.w700, color: AppColors.charcoal),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            'Sign in to continue',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 14, color: AppColors.graphite.withValues(alpha: 0.9)),
                          ),
                          const SizedBox(height: 28),
                          CustomTextField(
                            controller: _emailController,
                            label: 'Email or Username',
                            icon: Icons.person_outline,
                            keyboardType: TextInputType.emailAddress,
                            validator: (v) =>
                                (v == null || v.trim().isEmpty) ? 'Please enter your email or username' : null,
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
                          const SizedBox(height: 28),
                          PrimaryButton(label: 'Login', icon: Icons.arrow_forward, onPressed: _handleLogin),
                          const SizedBox(height: 22),
                          Center(
                            child: Wrap(
                              alignment: WrapAlignment.center,
                              children: [
                                Text(
                                  "Don't have an account? ",
                                  style: TextStyle(color: AppColors.graphite.withValues(alpha: 0.9)),
                                ),
                                GestureDetector(
                                  // Navigator method (2): pushNamed — Login stays on
                                  // the stack so Sign-Up's back arrow can pop to it.
                                  onTap: () => Navigator.pushNamed(context, '/signup'),
                                  child: const Text(
                                    'Sign Up',
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
