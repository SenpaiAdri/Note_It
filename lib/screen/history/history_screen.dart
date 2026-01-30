import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'History Page',
        style: AppTheme.textStyle(
          size: 24,
          weight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }
}
