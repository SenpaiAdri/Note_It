import 'package:flutter/material.dart';
import '../screen/home_page.dart';
import '../services/auth_service.dart';
import 'welcome_page.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      stream: AuthService().authStateChanges,
      initialData: AuthService().isLoggedIn, // Use cached value if available
      builder: (context, snapshot) {
        // If we don't have data yet (and no initialData), we are still loading from disk.
        if (!snapshot.hasData) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        final bool isLoggedIn = snapshot.data!;

        if (isLoggedIn) {
          return const HomePage();
        } else {
          return const WelcomePage();
        }
      },
    );
  }
}
