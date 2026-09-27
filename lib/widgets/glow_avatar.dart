import 'dart:ui';
import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

/// A circular gradient badge with a soft blurred glow behind it — used for
/// the icon/avatar at the top of Login, Sign-Up, and Home for a bit more
/// visual polish than a plain flat icon.
class GlowAvatar extends StatelessWidget {
  final double size;
  final Widget child;

  const GlowAvatar({super.key, required this.child, this.size = 56});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size * 1.8,
      height: size * 1.8,
      child: Stack(
        alignment: Alignment.center,
        children: [
          ImageFiltered(
            imageFilter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
            child: Container(
              width: size * 1.5,
              height: size * 1.5,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.slateBlue.withValues(alpha: 0.35),
              ),
            ),
          ),
          Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: const LinearGradient(
                colors: [AppColors.slateBlue, AppColors.slateBlueDark],
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.slateBlue.withValues(alpha: 0.35),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Center(child: child),
          ),
        ],
      ),
    );
  }
}
