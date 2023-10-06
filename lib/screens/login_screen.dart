import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        // color: Colors.cyanAccent,
        child: Stack(
          children: [
            Container(
              color: Color.fromARGB(255, 224, 96, 139),
              width: double.infinity,
              height: size.height * 0.5,
            )
          ],
        ),
      ),
    );
  }
}
