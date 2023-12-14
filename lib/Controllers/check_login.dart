import 'package:flutter/material.dart';
import 'package:ener_personalcare/Controllers/user.dart';

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
    return const Placeholder();
  }
}
