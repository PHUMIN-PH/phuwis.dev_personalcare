import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'widget.dart';
import 'home.dart';
import 'login.dart';
import 'dart:convert';
import 'package:ener_personalcare/Controllers/user.dart';

class SignUpSceen extends StatefulWidget {
  const SignUpSceen({super.key});

  @override
  State<SignUpSceen> createState() => _SignUpSceenState();
}

class _SignUpSceenState extends State<SignUpSceen> {
  final formKey = GlobalKey<FormState>();

  TextEditingController _userNameTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passWordTextController = TextEditingController();
  TextEditingController telephone = TextEditingController();
  TextEditingController nameuser = TextEditingController();

  Future sign_up() async {
    String url =
        "https://energeticbase.000webhostapp.com/register.php"; //"http://192.168.1.115:8080/FlutterBase/register.php";
    final response = await http.post(Uri.parse(url), body: {
      'username': _userNameTextController.text,
      'email': _emailTextController.text,
      'password': _passWordTextController.text,
      'name': nameuser.text,
      'telephone': telephone.text,
    });
    var data = json.decode(response.body);
    if (data == "Error") {
      Navigator.pushNamed(context, 'register');
      // Navigator.push(
      //     context, MaterialPageRoute(builder: (context) => SignUpSceen()));
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
        extendBodyBehindAppBar: true,
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: const Text(
              "Register",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            )),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(color: Colors.white),
          child: Form(
            key: formKey,
// ----------------------- Version start ----------------------------
//------------------------------------------------------------------
            // child: SingleChildScrollView(
            //     child: Padding(
            //         padding: EdgeInsets.fromLTRB(50, 120, 50, 0),
            //         child: Column(
            //           children: [
            //             const SizedBox(
            //               height: 20,
            //             ),
            //             widgetTextField(
            //                 " Name", Icons.person_outline, false, nameuser),
            //             const SizedBox(
            //               height: 20,
            //             ),
            //             widgetTextField(" Email Address", Icons.mail_outline,
            //                 false, _emailTextController),
            //             const SizedBox(
            //               height: 20,
            //             ),
            //             widgetTextField(" Username", Icons.person_outline, true,
            //                 _passWordTextController),
            //             const SizedBox(
            //               height: 20,
            //             ),
            //             widgetTextField(" Password", Icons.person_outline, true,
            //                 _passWordTextController),
            //             const SizedBox(
            //               height: 20,
            //             ),
            //             widgetTextField(" Telephone number",
            //                 Icons.person_outline, true, telephone),
            //             const SizedBox(
            //               height: 20,
            //             ),
            //             singInSignUpButton(context, true, () {
            //               Navigator.push(
            //                   context,
            //                   MaterialPageRoute(
            //                       builder: (context) => HomeScreen()));
            //             }),
            //           ],
            //         ))),
//---------------------------------------------------------- 1st version end -----------------
            child: ListView(
              shrinkWrap: true,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      'Register',
                      style:
                          TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // const Text(
                    //   'Please complete your',
                    //   style: TextStyle(fontSize: 20),
                    // ),
                    // const Text(
                    //   'biodata correctly',
                    //   style: TextStyle(fontSize: 20),
                    // ),
                    // const SizedBox(
                    //   height: 30,
                    // ),
                    SizedBox(
                      width: 350,
                      child: TextFormField(
                        obscureText: false,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Your name',
                        ),
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'Empty';
                          }
                          return null;
                        },
                        controller: nameuser,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: 350,
                      child: TextFormField(
                        obscureText: false,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Username For Login',
                        ),
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'Empty';
                          }
                          return null;
                        },
                        controller: _userNameTextController,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: 350,
                      child: TextFormField(
                        obscureText: false,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Telephone number',
                        ),
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'Empty';
                          }
                          return null;
                        },
                        controller: telephone,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: 350,
                      child: TextFormField(
                        obscureText: false,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Your E-Mail',
                        ),
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'Empty';
                          }
                          return null;
                        },
                        controller: _emailTextController,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: 350,
                      child: TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Create your Password',
                        ),
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'Empty';
                          }
                          return null;
                        },
                        controller: _passWordTextController,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: 350,
                      child: TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Re-Type your Password',
                        ),
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'Empty';
                          } else if (val != _passWordTextController.text) {
                            return 'Password not match';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
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
                            sign_up();
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
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
