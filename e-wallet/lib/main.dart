import 'package:flutter/material.dart';
import 'package:my_vault/screens/home_screen.dart';
import 'package:my_vault/screens/logged_screen.dart';
import 'package:my_vault/screens/login_screen.dart';
import 'package:my_vault/screens/profile_screen.dart';
import 'package:my_vault/screens/send_money_screen.dart';
import 'package:my_vault/screens/signup_screen.dart';
import 'package:my_vault/screens/transactions_screen.dart';
import 'package:my_vault/screens/welcome_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Oxygen',
      ),
      initialRoute: LoginScreen.route,
      routes: {
        HomeScreen.route: (_) => HomeScreen(),
        WelcomeScreen.route: (_) => WelcomeScreen(),
        LoggedScreen.route: (_) => LoggedScreen(),
        LoginScreen.route: (_) => LoginScreen(),
        ProfileScreen.route: (_) => ProfileScreen(),
        SendMoneyScreen.route: (_) => SendMoneyScreen(),
        TransactionsScreen.route: (_) => TransactionsScreen(),
        SignupScreen.route: (_) => SignupScreen(),
      },
    );
  }
}
