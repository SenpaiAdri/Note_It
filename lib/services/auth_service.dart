import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  static final AuthService _instance = AuthService._internal();
  factory AuthService() => _instance;
  AuthService._internal() {
    _loadAuthStatus();
  }

  final _authController = StreamController<bool>.broadcast();
  Stream<bool> get authStateChanges => _authController.stream;

  // Cache the current status to avoid stream timing issues
  bool? _isLoggedIn;
  bool? get isLoggedIn => _isLoggedIn;

  static const String _authKey = 'is_logged_in';

  Future<void> _loadAuthStatus() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      _isLoggedIn = prefs.getBool(_authKey) ?? false;
      _authController.add(_isLoggedIn!);
    } catch (e) {
      _isLoggedIn = false;
      _authController.add(false);
    }
  }

  Future<void> login(String email, String password) async {
    // TODO: Create Proper Login function here

    if (email.isEmpty || password.isEmpty) {
      throw Exception('Email and password are required');
    }

    if (email != '123' || password != '123') {
      throw Exception('Invalid email or password');
    }

    await Future.delayed(const Duration(seconds: 1));

    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_authKey, true);

    _isLoggedIn = true;
    _authController.add(true);
  }

  Future<void> logout() async {
    // TODO: Create Logout function here
    await Future.delayed(const Duration(seconds: 1));

    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_authKey, false);

    _isLoggedIn = false;
    _authController.add(false);
  }
}
