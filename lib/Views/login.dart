import 'package:flutter/material.dart';
import 'widget.dart';
import 'package:ener_personalcare/Views/register.dart';
import 'package:http/http.dart' as http;
import 'home.dart';
import 'dart:convert';
import 'package:ener_personalcare/Controllers/user.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  // TextEditingController _emailTextController = TextEditingController();
  TextEditingController _username = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();

  Future sign_in() async {
    String url =
        "https://energeticbase.000webhostapp.com/login.php"; //"http://192.168.1.115:8080/FlutterBase/register.php";
    final response = await http.post(Uri.parse(url), body: {
      'username': _username.text,
      'password': _passwordTextController.text,
    });
    var data = json.decode(response.body);
    if (data == "Error") {
      Navigator.pushNamed(context, 'login');
      // Navigator.push(
      //     context, MaterialPageRoute(builder: (context) => LoginScreen()));
    } else {
      await User.setsignin(true);
      Navigator.pushNamed(context, 'home');
      // Navigator.push(
      //     context, MaterialPageRoute(builder: (context) => HomeScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(color: Colors.white),
            child: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                      20, MediaQuery.of(context).size.height * 0.1, 20, 0),
                  child: Column(
                    children: <Widget>[
                      logoWidget("assets/images/logo.png"),
                      SizedBox(
                        height: 20,
                      ),
                      widgetTextField("Enter Username", Icons.person_outline,
                          false, _username),
                      SizedBox(
                        height: 20,
                      ),
                      widgetTextField("Enter Password", Icons.lock_outline,
                          true, _passwordTextController),
                      SizedBox(
                        height: 20,
                      ),
                      // singInSignUpButton(context, true, () {
                      //   Navigator.push(
                      //       context,
                      //       MaterialPageRoute(
                      //           builder: (context) => HomeScreen()));
                      // }),
                      SizedBox(
                        width: 350,
                        height: 60,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: const Color(0xFF3F60A0),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15))),
                          onPressed: () {
                            bool pass = formKey.currentState!.validate();

                            if (pass) {
                              sign_in();
                            }
                          },
                          child: const Text(
                            'Sign up',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      signUpOption()
                    ],
                  ),
                ),
              ),
            )));
  }

  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have account?",
            style: TextStyle(color: Colors.black87)),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SignUpSceen()));
          },
          child: const Text(
            "Sign Up",
            style: TextStyle(color: Colors.amber, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
