import 'package:flutter/material.dart';
import 'package:flutter_app/viewmodel/register_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late AnimationController _slideController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    _fadeController = AnimationController(
      duration: Duration(milliseconds: 800),
      vsync: this,
    );

    _slideController = AnimationController(
      duration: Duration(milliseconds: 800),
      vsync: this,
    );

    _fadeAnimation = CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeIn,
    );

    _slideAnimation = Tween<Offset>(
      begin: Offset(0.0, 0.1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _slideController,
      curve: Curves.easeOut,
    ));

    _fadeController.forward();
    _slideController.forward();
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _slideController.dispose();
    super.dispose();
  }

  void _handleRegister(BuildContext context) async {
    final vm = Provider.of<RegisterViewModel>(context, listen: false);
    final errorMessage = await vm.register(
      vm.emailController.text,
      vm.passwordController.text,
      vm.confirmPasswordController.text,
    );

    if (errorMessage != null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(errorMessage)));
    } else {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('username', vm.userNameController.text);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Registration successful")));
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<RegisterViewModel>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white, elevation: 0),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 100),
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: SlideTransition(
            position: _slideAnimation,
            child: Column(
              children: [
                Text(
                  'Register',
                  style: TextStyle(
                    fontFamily: 'Billabong',
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 40),

                // Email
                TextField(
                  controller: vm.emailController,
                  decoration: _inputDecoration('Email'),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: vm.userNameController,
                  decoration: _inputDecoration('UserName'),
                ),
                const SizedBox(height: 16),
                // Password
                TextField(
                  controller: vm.passwordController,
                  obscureText: true,
                  decoration: _inputDecoration('Password'),
                ),
                const SizedBox(height: 16),

                // Confirm Password
                TextField(
                  controller: vm.confirmPasswordController,
                  obscureText: true,
                  decoration: _inputDecoration('Confirm Password'),
                ),
                const SizedBox(height: 24),

                // Register Button
                GestureDetector(
                  onTap: () => _handleRegister(context),
                  child: Container(
                    width: double.infinity,
                    height: 48,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFFF58529),
                          Color(0xFFDD2A7B),
                          Color(0xFF8134AF),
                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    alignment: Alignment.center,
                    child: vm.isLoading
                        ? CircularProgressIndicator(color: Colors.white, strokeWidth: 2)
                        : Text(
                      'Register',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  InputDecoration _inputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      filled: true,
      fillColor: Colors.grey[100],
      contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
    );
  }
}
