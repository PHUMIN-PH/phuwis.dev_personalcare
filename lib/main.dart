import 'package:flutter/material.dart';
import 'dart:convert';
import 'Views/login.dart';
import 'Views/register.dart';
import 'Views/home.dart';
import 'Views/navigator.dart';
import 'package:ener_personalcare/Controllers/user.dart';
// import 'Controllers/check_login.dart';

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
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: check_login(),
      routes: {
        'register': (context) => SignUpSceen(),
        'home': (context) => NavigationActivity(),
        //'home': (context) => HomeScreen(),
        'login': (context) => LoginScreen(),
      },
    );
  }
}

class check_login extends StatefulWidget {
  const check_login({super.key});

  @override
  State<check_login> createState() => _check_loginState();
}

class _check_loginState extends State<check_login> {
  Future checklogin() async {
    bool? signin = await User.getsignin();
    print(signin);
    if (signin == false) {
      // Navigator.pushNamed(context, 'login');
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
    } else {
      // Navigator.pushNamed(context, 'home');
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => NavigationActivity()));
    }
  }

  void initState() {
    checklogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
