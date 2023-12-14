import 'package:flutter/material.dart';
import 'login.dart';
import 'package:ener_personalcare/Controllers/user.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Future logout() async {
    await User.setsignin(false);
    Navigator.pushNamed(context, 'login');
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text("Logout"),
          onPressed: () {
            logout();
          },
        ),
      ),
    );
  }
}
