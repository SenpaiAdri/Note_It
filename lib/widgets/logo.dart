import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

RichText buildLogo(Color color, double size) {
  return RichText(
    text: TextSpan(
      style: TextStyle(
        fontFamily: AppTheme.fontFamily,
        fontSize: size,
        fontWeight: FontWeight.w900,
      ),
      children: [
        TextSpan(
          text: 'Note',
          style: TextStyle(color: color),
        ),
        TextSpan(
          text: 'it.',
          style: TextStyle(
            color: Colors.black.withValues(alpha: 0.8),
            fontSize: size / 1.5,
          ),
        ),
      ],
    ),
  );
}
