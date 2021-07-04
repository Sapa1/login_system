import 'package:flutter/material.dart';
import 'package:login/create_account_page.dart';
import 'package:login/home_page.dart';
import 'package:login/login_page.dart';
import 'package:login/splash_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  String newPassword = '';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/splash',
      routes: {
        '/splash': (content) => SplashPage(),
        '/create': (content) => CreateAccount(newPassword: newPassword),
        '/login': (content) => LoginPage(newPassword),
        '/home': (content) => Homepage(),
      },
    );
  }
}
