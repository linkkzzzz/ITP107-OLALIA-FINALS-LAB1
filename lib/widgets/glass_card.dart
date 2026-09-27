import 'dart:ui';
import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

/// A frosted "glass" panel that sits on top of [WatercolorBackground],
/// giving every screen a consistent, professional glassmorphism look.
/// Adds a slim gradient accent bar along the top edge as a signature touch,
/// and an optional large, very faint watermark icon behind the content.
class GlassCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;
  final bool showAccentBar;
  final IconData? watermarkIcon;

  const GlassCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.fromLTRB(28, 32, 28, 28),
    this.showAccentBar = true,
    this.watermarkIcon,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(28),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(28),
            color: Colors.white.withValues(alpha: 0.55),
            border: Border.all(color: Colors.white.withValues(alpha: 0.65), width: 1.2),
            boxShadow: [
              BoxShadow(
                color: AppColors.charcoal.withValues(alpha: 0.10),
                blurRadius: 34,
                offset: const Offset(0, 16),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (showAccentBar)
                Container(
                  height: 5,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [AppColors.slateBlue, AppColors.slateBlueDark, AppColors.cloud],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                  ),
                ),
              Expanded(
                child: Stack(
                  children: [
                    if (watermarkIcon != null)
                      Positioned(
                        top: 4,
                        left: 0,
                        right: 0,
                        child: Center(
                          child: Icon(
                            watermarkIcon,
                            size: 130,
                            color: AppColors.slateBlueDark.withValues(alpha: 0.06),
                          ),
                        ),
                      ),
                    Padding(padding: padding, child: child),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
