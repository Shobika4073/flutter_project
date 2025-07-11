import 'package:flutter/material.dart';
import 'package:flutter_app/startup_page.dart';
import 'package:flutter_app/viewmodel/home_view_model.dart';
import 'package:flutter_app/viewmodel/login_viewmodel.dart';
import 'package:flutter_app/viewmodel/register_viewmodel.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginViewModel()),
        ChangeNotifierProvider(create: (_) => RegisterViewModel()),
        ChangeNotifierProvider(create: (_) => HomeViewModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: StartupPage(),
      ),
    ),
  );
}
