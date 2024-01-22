import 'package:flutter/material.dart';
import 'dart:convert';
import 'Views/login.dart';
import 'Views/register.dart';
import 'Views/home.dart';
import 'package:ener_personalcare/Model/UserPreferences.dart';
import 'Views/navigator.dart';
import 'package:ener_personalcare/Controllers/user.dart';
import 'Views/splash.dart';
import 'Controllers/check_login.dart';

// Future main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firwebase.initializeApp();

//   runApp(MainPage());
// }

// class MainPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) => Scaffold(
//     body: LoginWidget();
//   );
// }

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ener PersonalCare',
      home: NavigationActivity(),
      routes: {
        'register': (context) => const SignUpSceen(),
        'home': (context) => const NavigationActivity(),
        //'home': (context) => HomeScreen(),
        'login': (context) => const LoginScreen(),
      },
    );
  }
}
