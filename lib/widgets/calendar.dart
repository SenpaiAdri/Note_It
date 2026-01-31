import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../theme/app_colors.dart';

// Generate the next 7 days (current day + 6 days)

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

SizedBox buildCalendar() {
  final days = _getCalendarDays();
  final today = DateTime.now();
  return SizedBox(
    height: 100,
    child: ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      scrollDirection: Axis.horizontal,
      itemCount: days.length,
      separatorBuilder: (context, index) => const SizedBox(width: 10),
      itemBuilder: (context, index) {
        final date = days[index];
        final isToday =
            date.year == today.year &&
            date.month == today.month &&
            date.day == today.day;

        return calendarContainer(isToday, date);
      },
    ),
  );
}

Container calendarContainer(bool isToday, DateTime date) {
  return Container(
    width: 52,
    decoration: BoxDecoration(
      color: isToday
          ? Colors.white.withValues(alpha: 0.8)
          : AppColors.primaryVariant.withValues(alpha: 0.8),
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.2),
          blurRadius: 4,
          offset: const Offset(0, 2),
        ),
        BoxShadow(
          color: Colors.white,
          blurRadius: 4,
          spreadRadius: -4,
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
            color: AppColors.primary,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          date.day.toString(),
          style: TextStyle(
            fontFamily: AppTheme.fontFamily,
            fontSize: 16,
            fontWeight: FontWeight.w800,
            color: isToday ? AppColors.onSecondary : AppColors.onPrimary,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          _getWeekDayName(date.weekday),
          style: TextStyle(
            fontFamily: AppTheme.fontFamily,
            fontSize: 12,
            fontWeight: FontWeight.w800,
            color: AppColors.primary,
          ),
        ),
      ],
    ),
  );
}

List<DateTime> _getCalendarDays() {
  final now = DateTime.now();
  return List.generate(7, (index) => now.add(Duration(days: index)));
}
