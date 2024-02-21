import 'package:x_personalcare/Controllers/check_login.dart';
import 'package:flutter/material.dart';
import 'widget.dart';
import 'package:x_personalcare/Views/register.dart';
import 'package:http/http.dart' as http;
import 'home.dart';
import 'dart:convert';
import 'package:x_personalcare/Controllers/user.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  // TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();
  String _errorMessage = '';

  Future checklogin() async {
    bool? signin = await User.getsignin();
    print(signin);
    if (signin == true) {
      Navigator.pushNamed(context, 'home');
    }
  }

  void initState() {
    checklogin();
    super.initState();
  }

  Future sign_in() async {
    String url =
        "https://energeticbase.000webhostapp.com/login.php"; //"http://192.168.1.115:8080/FlutterBase/register.php";
    final response = await http.post(Uri.parse(url), body: {
      'username': _username.text,
      'password': _password.text,
    });
    var data = json.decode(response.body);

    if (_username.text == "" || _password.text == "") {
      // if(_username.text ==""){
      //   print("username  is null");
      // }else if(_passwordTextController.text == ""){
      //   print(" password is null");
      // }
      setState(() {
        _errorMessage = 'Enter username and password.';
      });
    } else {
      if (data == "Error") {
        setState(() {
          _errorMessage = 'Login failed. Please check your credentials.';
        });
        // Navigator.push(
        //     context, MaterialPageRoute(builder: (context) => LoginScreen()));
      } else {
        await User.setsignin(true);
        Navigator.pushNamed(context, 'home');
        // Navigator.push(
        //     context, MaterialPageRoute(builder: (context) => HomeScreen()));
      }
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
                      logoWidget("assets/images/splash1.png"),
                      SizedBox(
                        height: 20,
                      ),
                      widgetTextField("Enter Username", Icons.person_outline,
                          false, _username),
                      SizedBox(
                        height: 20,
                      ),
                      widgetTextField("Enter Password", Icons.lock_outline,
                          true, _password),
                      SizedBox(
                        height: 20,
                      ),

                      if (_errorMessage.isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(
                            _errorMessage,
                            style: TextStyle(color: Colors.red),
                          ),
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
                            'Login',
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
