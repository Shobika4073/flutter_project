import 'package:flutter/material.dart';
import 'package:flutter_app/view/dashboard_view.dart';
import 'package:flutter_app/view/login_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StartupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: checkLogin(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return Scaffold(body: Center(child: CircularProgressIndicator()));
        return snapshot.data == true ? DashboardView() : LoginPage();
      },
    );
  }

  Future<bool> checkLogin() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLoggedIn') ?? false;
  }
}
