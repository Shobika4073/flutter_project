import 'package:flutter/material.dart';
import '../database.dart';

class LoginViewModel extends ChangeNotifier {
  final DatabaseHelper dbHelper = DatabaseHelper();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  get emailController => _emailController;
  get passwordController => _passwordController;

  Future<bool> login(String email, String password) async {
    _isLoading = true;
    notifyListeners();

    final user = await dbHelper.getUser(email.trim(), password);

    _isLoading = false;
    notifyListeners();

    return user != null;
  }
}
