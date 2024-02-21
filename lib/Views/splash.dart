import 'package:flutter/material.dart';
import 'package:x_personalcare/Controllers/user.dart';
import 'widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future checklogin() async {
    bool? signin = await User.getsignin();
    print(signin);
    if (signin == false) {
      Navigator.pushNamed(context, 'login');
    } else {
      Navigator.pushNamed(context, 'home');
    }
  }

  void initState() {
    checklogin();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    checklogin();
    return Container(
      color: Colors.grey,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          logoWidget("assets/images/logo.png"),
          Text("Personal Care",style: TextStyle(
              color: Colors.black54,
          fontWeight: FontWeight.bold),),
        ],
      ),
    );
  }
}
