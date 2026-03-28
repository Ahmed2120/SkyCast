import 'package:flutter/material.dart';
import 'dart:ui';

class AppColors {
  static const List<Color> linearColor = [Color(0xFFF39876), Color(0xFFFEE3BC)];

  static const Color stringsColor = Color(0xFF303345);

  static const Color dateColor = Color(0xFF9A938C);

  static Color cardColor = const Color(0xFFFFFFFF).withOpacity(0.5);

  static Color iconBackgroundColor = const Color(0xFFFFFFFF).withOpacity(0.9);

  static const Color lineColor = Color(0xFFE2A272);

  static const Color searchBarColor = Color(0x1F767680); // Translucent for search bar

  static Color weatherCardColor(bool isNow) {
    return isNow
        ? const Color(0xFFFFFFFF).withOpacity(0.7)
        : const Color(0xFFFFFFFF).withOpacity(0.3);
  }

  static Color dayColor(bool isActive) {
    return isActive ? const Color(0xFF313341) : const Color(0xFFD6996B);
  }

  static const Color primaryColor = Color(0xFFF39876);
  static const Color secondaryColor = Color(0xFFE2A272);
  static const Color backgroundColor = Color(0xFFFEE3BC);

  // Shimmer Colors for current background
  static final Color shimmerBase = Colors.white.withOpacity(0.4);
  static final Color shimmerHighlight = Colors.white.withOpacity(0.2);
}
