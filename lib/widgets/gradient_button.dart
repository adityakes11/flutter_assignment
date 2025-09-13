import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  final Widget child; // Changed from text
  final VoidCallback onPressed;
  final List<Color> colors;
  final double height;
  final double borderRadius;
  final EdgeInsetsGeometry? padding;

  const GradientButton({
    super.key,
    required this.child,
    required this.onPressed,
    required this.colors,
    this.height = 50,
    this.borderRadius = 30,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        height: height,
        padding: padding ?? const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: colors,
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(borderRadius),
          boxShadow: [
            BoxShadow(
              color: colors.last.withOpacity(0.3),
              blurRadius: 10,
              offset: const Offset(0, 4),
            )
          ],
        ),
        child: Center(
          child: child, // Display any widget now
        ),
      ),
    );
  }
}
