import 'package:flutter/material.dart';
import '../database.dart';
import '../model/user_model.dart';

class RegisterViewModel extends ChangeNotifier {
  final DatabaseHelper dbHelper = DatabaseHelper();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  final _emailController = TextEditingController();
  final _usernameConreoller = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  get emailController => _emailController;
  get userNameController => _usernameConreoller;
  get passwordController => _passwordController;
  get confirmPasswordController => _confirmPasswordController;

  Future<String?> register(String email, String password, String confirmPassword) async {
    if (email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      return "Please fill in all fields";
    }

    if (password != confirmPassword) {
      return "Passwords do not match";
    }

    final existingUser = await dbHelper.getUserByEmail(email.trim());
    if (existingUser != null) {
      return "Email already registered";
    }

    _isLoading = true;
    notifyListeners();

    await dbHelper.insertUser(User(email: email.trim(), password: password));

    _isLoading = false;
    notifyListeners();

    return null;
  }

  void clearControllers() {
    _emailController.clear();
    userNameController.clear();
    _passwordController.clear();
    _confirmPasswordController.clear();
    notifyListeners();
  }

}
