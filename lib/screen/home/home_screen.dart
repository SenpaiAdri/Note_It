import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../theme/app_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Generate the next 7 days (current day + 6 days)
  List<DateTime> _getCalendarDays() {
    final now = DateTime.now();
    return List.generate(7, (index) => now.add(Duration(days: index)));
  }

  String _getMonthName(int month) {
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    return months[month - 1];
  }

  String _getWeekDayName(int weekday) {
    const days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    return days[weekday - 1];
  }

  @override
  Widget build(BuildContext context) {
    final days = _getCalendarDays();
    final today = DateTime.now();

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF2667FF), // Lighter blue top
            Color(0xFF87BFFF), // Primary variant bottom
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        children: [
          // Top White Container
          Container(
            padding: const EdgeInsets.only(
              top: 60,
              bottom: 24,
            ), // Top padding for safe area/status bar
            decoration: BoxDecoration(
              color: const Color(0xFFF5F5F5), // Off-white/Light grey
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
                RichText(
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
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                // Calendar Row
                SizedBox(
                  height: 100,
                  child: ListView.separated(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 5,
                    ),
                    scrollDirection: Axis.horizontal,
                    itemCount: days.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 10),
                    itemBuilder: (context, index) {
                      final date = days[index];
                      final isToday =
                          date.year == today.year &&
                          date.month == today.month &&
                          date.day == today.day;

                      return Container(
                        width: 52,
                        decoration: BoxDecoration(
                          color: isToday
                              ? Colors.white
                              : AppColors.secondaryVariant,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.2),
                              blurRadius: 5,
                              offset: const Offset(0, 0),
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              _getMonthName(date.month),
                              style: TextStyle(
                                fontFamily: AppTheme.fontFamily,
                                fontSize: 11,
                                fontWeight: FontWeight.w800,
                                color: isToday
                                    ? Colors.black
                                    : AppColors.primaryVariant,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              date.day.toString(),
                              style: TextStyle(
                                fontFamily: AppTheme.fontFamily,
                                fontSize: 16,
                                fontWeight: FontWeight.w800,
                                color: isToday
                                    ? Colors.black
                                    : AppColors.primaryVariant,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              _getWeekDayName(date.weekday),
                              style: TextStyle(
                                fontFamily: AppTheme.fontFamily,
                                fontSize: 12,
                                fontWeight: FontWeight.w800,
                                color: isToday
                                    ? Colors.black
                                    : AppColors.primaryVariant,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
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
