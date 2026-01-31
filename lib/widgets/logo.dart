import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../theme/app_colors.dart';

RichText buildLogo() {
  return RichText(
    text: TextSpan(
      style: const TextStyle(
        fontFamily: AppTheme.fontFamily,
        fontSize: 32,
        fontWeight: FontWeight.w900,
      ),
      children: [
        const TextSpan(
          text: 'Note',
          style: TextStyle(color: AppColors.primaryVariant),
        ),
        TextSpan(
          text: 'it.',
          style: TextStyle(
            color: Colors.black.withValues(alpha: 0.8),
            fontSize: 24,
          ),
        ),
      ],
    ),
  );
}
