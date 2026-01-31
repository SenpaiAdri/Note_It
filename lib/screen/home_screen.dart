import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../widgets/calendar.dart';
import '../widgets/logo.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.primary, // Lighter blue top
            AppColors.secondary, // Primary variant bottom
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        children: [
          // Header
          Container(
            padding: const EdgeInsets.only(
              top: 60,
              bottom: 24,
            ), // Top padding for safe area/status bar
            decoration: BoxDecoration(
              color: const Color(0xFFFFEEDD), // Off-white/Light grey
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.2),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Logo
                buildLogo(),
                const SizedBox(height: 24),

                // Calendar Row
                buildCalendar(),
              ],
            ),
          ),
          // Content Area (Notes list will go here)
          Expanded(
            child: Container(
              // Placeholder for future content
              width: double.infinity,
            ),
          ),
        ],
      ),
    );
  }
}
