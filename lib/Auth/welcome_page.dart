import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../Auth/signup_page.dart';
import '../Auth/login_page.dart';
import '../theme/app_colors.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(gradient: AppColors.backgroundGradient),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 10),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: Column(
                    children: [
                      Text(
                        'Note It.',
                        style: AppTheme.textStyle(
                          size: 55,
                          weight: FontWeight.w900,
                          color: AppColors.onPrimary,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Your Personal Note Taking App',
                        style: AppTheme.textStyle(
                          size: 16,
                          weight: FontWeight.w600,
                          color: AppColors.onPrimary,
                        ),
                      ),
                    ],
                  ),
                ),

                Column(
                  children: [
                    TextButton(
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        ),
                      ),
                      style: TextButton.styleFrom(padding: EdgeInsets.zero),
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(12),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: AppColors.primaryVariant,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          'Log In',
                          style: AppTheme.textStyle(
                            size: 16,
                            weight: FontWeight.bold,
                            color: AppColors.onPrimary,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Text(
                        "Doesn't have an account?",
                        style: AppTheme.textStyle(
                          size: 14,
                          weight: FontWeight.w500,
                          color: AppColors.onSecondary,
                        ),
                      ),
                    ),

                    // Signup
                    TextButton(
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignUpPage(),
                        ),
                      ),
                      style: TextButton.styleFrom(padding: EdgeInsets.zero),
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(12),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.onSecondary),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          'Sign Up',
                          style: AppTheme.textStyle(
                            size: 16,
                            weight: FontWeight.w600,
                            color: AppColors.onSecondary,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                // Log in
              ],
            ),
          ),
        ),
      ),
    );
  }
}
