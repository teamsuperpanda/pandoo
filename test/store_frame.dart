import 'package:flutter/material.dart';

class StoreFrame extends StatelessWidget {
  const StoreFrame({
    required this.gradientColors,
    required this.tagline,
    required this.child,
    super.key,
    this.bottomTagline = '',
  });

  final List<Color> gradientColors;
  final String tagline;
  final String bottomTagline;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Material(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: gradientColors,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Text(
                    tagline,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Expanded(child: child),
                if (bottomTagline.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Text(
                      bottomTagline,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
