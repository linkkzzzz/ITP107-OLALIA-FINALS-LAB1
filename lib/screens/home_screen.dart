import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/watercolor_background.dart';
import '../widgets/primary_button.dart';
import '../widgets/schedule_list.dart';
import '../widgets/glow_avatar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  String _greeting() {
    final hour = DateTime.now().hour;
    if (hour < 12) return 'Good morning';
    if (hour < 18) return 'Good afternoon';
    return 'Good evening';
  }

  @override
  Widget build(BuildContext context) {
    // Read the name passed via route arguments (from Login or Sign-Up).
    final args = ModalRoute.of(context)?.settings.arguments;
    String name = 'Guest';
    if (args is String && args.trim().isNotEmpty) {
      name = args.trim();
    }

    return Scaffold(
      body: WatercolorBackground(
        child: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 28),
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight - 56),
                  child: Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 420),
                      child: TweenAnimationBuilder<double>(
                        tween: Tween(begin: 0, end: 1),
                        duration: const Duration(milliseconds: 700),
                        curve: Curves.easeOutCubic,
                        builder: (context, value, child) => Opacity(
                          opacity: value,
                          child: Transform.scale(scale: 0.94 + (0.06 * value), child: child),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                        GlowAvatar(
                          child: Text(
                            name.isNotEmpty ? name[0].toUpperCase() : 'G',
                            style: const TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.w700),
                          ),
                        ),
                        const SizedBox(height: 22),
                        Text(
                          'Welcome, $name!',
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w700, color: AppColors.charcoal),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '${_greeting()} — here\'s your schedule for this semester.',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 14, color: AppColors.graphite.withValues(alpha: 0.9)),
                        ),
                        const SizedBox(height: 30),
                        Row(
                          children: [
                            Expanded(
                              child: Divider(color: AppColors.slateBlue.withValues(alpha: 0.25), thickness: 1),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 12),
                              child: Row(
                                children: [
                                  Icon(Icons.calendar_today_outlined, color: AppColors.slateBlue, size: 16),
                                  SizedBox(width: 6),
                                  Text(
                                    'Class Schedule',
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w700,
                                      letterSpacing: 0.3,
                                      color: AppColors.charcoal,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Divider(color: AppColors.slateBlue.withValues(alpha: 0.25), thickness: 1),
                            ),
                          ],
                        ),
                        const ScheduleList(),
                        const SizedBox(height: 8),
                        PrimaryButton(
                          label: 'Logout',
                          icon: Icons.logout,
                          onPressed: () {
                            // Navigator method (5): pushNamedAndRemoveUntil —
                            // clears the whole stack and returns fresh to Login.
                            Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
                          },
                        ),
                          ],
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
