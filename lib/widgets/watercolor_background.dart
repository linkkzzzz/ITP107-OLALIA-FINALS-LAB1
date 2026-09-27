import 'dart:ui';
import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

/// Recreates the soft, misty watercolor-marble look of the reference
/// screenshot using layered blurred blobs + a heavy backdrop blur,
/// gently drifting to feel alive without being distracting.
class WatercolorBackground extends StatefulWidget {
  final Widget child;
  const WatercolorBackground({super.key, required this.child});

  @override
  State<WatercolorBackground> createState() => _WatercolorBackgroundState();
}

class _WatercolorBackgroundState extends State<WatercolorBackground>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 18),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppColors.mist1, AppColors.mist2, AppColors.mist3],
        ),
      ),
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, _) {
          final t = _controller.value;
          return Stack(
            children: [
              _blob(
                top: -size.width * 0.30 + (t * 24),
                left: -size.width * 0.22 - (t * 18),
                diameter: size.width * 0.95,
                color: AppColors.cloud.withValues(alpha: 0.55),
              ),
              _blob(
                top: size.height * 0.10 - (t * 20),
                right: -size.width * 0.32 + (t * 14),
                diameter: size.width * 0.85,
                color: AppColors.slateBlue.withValues(alpha: 0.16),
              ),
              _blob(
                bottom: -size.width * 0.32 - (t * 16),
                left: -size.width * 0.18 + (t * 20),
                diameter: size.width * 1.0,
                color: AppColors.mist3.withValues(alpha: 0.9),
              ),
              _blob(
                bottom: size.height * 0.06 + (t * 12),
                right: -size.width * 0.22 - (t * 10),
                diameter: size.width * 0.62,
                color: AppColors.slateBlueDark.withValues(alpha: 0.10),
              ),
              Positioned.fill(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 70, sigmaY: 70),
                  child: const SizedBox.expand(),
                ),
              ),
              // Crisp decorative layers on top of the blur: a faint dot
              // texture across the whole page, and soft layered "hills"
              // along the bottom, both in the warm cozy-grey palette.
              const Positioned.fill(
                child: CustomPaint(painter: _DotGridPainter()),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                height: size.height * 0.38,
                child: CustomPaint(
                  size: Size(size.width, size.height * 0.38),
                  painter: const _HillsPainter(),
                ),
              ),
              widget.child,
            ],
          );
        },
      ),
    );
  }

  Widget _blob({
    double? top,
    double? left,
    double? right,
    double? bottom,
    required double diameter,
    required Color color,
  }) {
    return Positioned(
      top: top,
      left: left,
      right: right,
      bottom: bottom,
      child: Container(
        width: diameter,
        height: diameter,
        decoration: BoxDecoration(shape: BoxShape.circle, color: color),
      ),
    );
  }
}

/// A faint, evenly-spaced dot texture scattered across the page.
class _DotGridPainter extends CustomPainter {
  const _DotGridPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = AppColors.graphite.withValues(alpha: 0.10);
    const spacing = 26.0;
    const radius = 1.3;
    for (double y = 16; y < size.height; y += spacing) {
      for (double x = 16; x < size.width; x += spacing) {
        canvas.drawCircle(Offset(x, y), radius, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

/// Three soft, overlapping "hill" shapes along the bottom of the page,
/// in the same warm cozy-grey tones as the rest of the theme.
class _HillsPainter extends CustomPainter {
  const _HillsPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;

    final back = Paint()..color = AppColors.mist3.withValues(alpha: 0.9);
    final backPath = Path()
      ..moveTo(0, h * 0.35)
      ..cubicTo(w * 0.25, h * 0.15, w * 0.75, h * 0.55, w, h * 0.30)
      ..lineTo(w, h)
      ..lineTo(0, h)
      ..close();
    canvas.drawPath(backPath, back);

    final mid = Paint()..color = AppColors.cloud.withValues(alpha: 0.85);
    final midPath = Path()
      ..moveTo(0, h * 0.55)
      ..cubicTo(w * 0.30, h * 0.75, w * 0.70, h * 0.40, w, h * 0.60)
      ..lineTo(w, h)
      ..lineTo(0, h)
      ..close();
    canvas.drawPath(midPath, mid);

    final front = Paint()..color = AppColors.slateBlue.withValues(alpha: 0.55);
    final frontPath = Path()
      ..moveTo(0, h * 0.75)
      ..cubicTo(w * 0.35, h * 0.60, w * 0.65, h * 0.90, w, h * 0.72)
      ..lineTo(w, h)
      ..lineTo(0, h)
      ..close();
    canvas.drawPath(frontPath, front);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
