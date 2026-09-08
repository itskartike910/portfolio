// ignore_for_file: deprecated_member_use

import 'dart:math' as math;
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:portfolio/constants/consts.dart';

/// Apple/iOS + CodeHelp-style frosted glass card with subtle animated neon borders.
class NeonGlassCard extends StatefulWidget {
  final Widget child;
  final double borderRadius;
  final EdgeInsetsGeometry? padding;
  final double? width;
  final double? height;
  final double blurStrength;
  final bool animateBorder;
  final Color? primaryGlow;
  final Color? secondaryGlow;

  const NeonGlassCard({
    super.key,
    required this.child,
    this.borderRadius = 24,
    this.padding,
    this.width,
    this.height,
    this.blurStrength = 20,
    this.animateBorder = true,
    this.primaryGlow,
    this.secondaryGlow,
  });

  @override
  State<NeonGlassCard> createState() => _NeonGlassCardState();
}

class _NeonGlassCardState extends State<NeonGlassCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _borderController;
  bool _hovered = false;

  @override
  void initState() {
    super.initState();
    _borderController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 8),
    )..repeat();
  }

  @override
  void dispose() {
    _borderController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final c1 = widget.primaryGlow ?? CustomColors.primaryAccent;
    final c2 = widget.secondaryGlow ?? CustomColors.purpleAccent;

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOut,
        width: widget.width,
        height: widget.height,
        transform: Matrix4.identity()
          ..translate(0.0, _hovered ? -2.0 : 0.0),
        child: AnimatedBuilder(
          animation: _borderController,
          builder: (context, _) {
            final angle = _borderController.value * 2 * math.pi;
            return Container(
              padding: const EdgeInsets.all(1.2), // Hairline neon border width
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(widget.borderRadius),
                gradient: SweepGradient(
                  transform: GradientRotation(angle),
                  colors: [
                    c1.withOpacity(_hovered ? 0.60 : 0.35),
                    c2.withOpacity(_hovered ? 0.65 : 0.40),
                    CustomColors.secondaryAccent.withOpacity(_hovered ? 0.45 : 0.25),
                    c1.withOpacity(_hovered ? 0.60 : 0.35),
                  ],
                ),
                boxShadow: [
                  BoxShadow(
                    color: c2.withOpacity(_hovered ? 0.16 : 0.08),
                    blurRadius: _hovered ? 36 : 24,
                    offset: const Offset(0, 10),
                  ),
                  const BoxShadow(
                    color: Color(0x44000000),
                    blurRadius: 30,
                    offset: Offset(0, 8),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(widget.borderRadius - 1.2),
                child: Container(
                  padding: widget.padding,
                  decoration: BoxDecoration(
                    color: const Color(0xFF080814),
                    borderRadius: BorderRadius.circular(widget.borderRadius - 1.2),
                  ),
                  child: widget.child,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

/// Standard frosted glass card
class GlassCard extends StatelessWidget {
  final Widget child;
  final double borderRadius;
  final Color? accentColor;
  final EdgeInsetsGeometry? padding;
  final double? width;
  final double? height;
  final double blurStrength;

  const GlassCard({
    super.key,
    required this.child,
    this.borderRadius = 20,
    this.accentColor,
    this.padding,
    this.width,
    this.height,
    this.blurStrength = 18,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blurStrength, sigmaY: blurStrength),
        child: Container(
          width: width,
          height: height,
          padding: padding,
          decoration: accentColor != null
              ? CustomColors.glassCardAccent(accentColor!, radius: borderRadius)
              : BoxDecoration(
                  color: const Color(0x0EFFFFFF),
                  borderRadius: BorderRadius.circular(borderRadius),
                  border: Border.all(color: const Color(0x18FFFFFF), width: 1),
                  boxShadow: const [
                    BoxShadow(color: Color(0x44000000), blurRadius: 30, offset: Offset(0, 10)),
                  ],
                ),
          child: child,
        ),
      ),
    );
  }
}

/// Animated ambient glow blob used to create background gradient light.
class GlowBlob extends StatefulWidget {
  final Color color;
  final double size;
  final Duration duration;
  final double minOpacity;
  final double maxOpacity;

  const GlowBlob({
    super.key,
    required this.color,
    this.size = 500,
    this.duration = const Duration(seconds: 6),
    this.minOpacity = 0.06,
    this.maxOpacity = 0.14,
  });

  @override
  State<GlowBlob> createState() => _GlowBlobState();
}

class _GlowBlobState extends State<GlowBlob> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacity;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration)
      ..repeat(reverse: true);
    _opacity = Tween<double>(begin: widget.minOpacity, end: widget.maxOpacity)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _opacity,
      builder: (context, _) => Container(
        width: widget.size,
        height: widget.size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: RadialGradient(
            colors: [
              widget.color.withOpacity(_opacity.value),
              Colors.transparent,
            ],
            stops: const [0.0, 1.0],
          ),
        ),
      ),
    );
  }
}
