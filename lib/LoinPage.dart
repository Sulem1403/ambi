import 'package:ambi/home.dart';
import 'package:ambi/patientdetails.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/painting.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:modal_progress_hud/modal_progress_hud.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  final _auth = FirebaseAuth.instance;
  String email = ' ';
  String pswd = '';
  String name = '';
  AnimationController? controller;
  Animation? animation;
  bool showspinner = false;
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 100),
    );
    controller!.forward();
  }

  @override
  Widget build(BuildContext context) {
    final emailfield = TextField(
      keyboardType: TextInputType.emailAddress,
      onChanged: (value) {
        email = value;
      },
      decoration: InputDecoration(
        hintText: 'Enter Email',
        contentPadding: EdgeInsets.all(10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(32)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
          borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(32.0)),
            borderSide: BorderSide(color: Colors.blueAccent, width: 2.0)),
      ),
    );
    final namee = TextField(
      keyboardType: TextInputType.name,
      onChanged: (value) {
        name = value;
      },
      decoration: InputDecoration(
        hintText: 'Enter Name',
        contentPadding: EdgeInsets.all(10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(32)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
          borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(32.0)),
            borderSide: BorderSide(color: Colors.blueAccent, width: 2.0)),
      ),
    );
    final passwordfield = TextField(
      obscureText: true,
      keyboardType: TextInputType.emailAddress,
      onChanged: (value) {
        pswd = value;
      },
      decoration: InputDecoration(
          labelStyle: TextStyle(color: Colors.black),
          hintText: 'Enter Password',
          contentPadding: EdgeInsets.all(10),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(32.0)),
            borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(32.0)),
              borderSide: BorderSide(color: Colors.blueAccent, width: 2.0))),
    );

    return Scaffold(
        body: Container(
      padding: EdgeInsets.all(50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TypewriterAnimatedTextKit(
            text: ['Register Here!'],
            textStyle: TextStyle(
                fontSize: 30, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 50,
          ),
          Container(
            child: Column(
              children: [
                namee,
                SizedBox(
                  height: 20,
                ),
                emailfield,
                SizedBox(
                  height: 20,
                ),
                passwordfield,
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Material(
                    color: Colors.redAccent,
                    elevation: 5.0,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    child: MaterialButton(
                      onPressed: () async {
                        print(email);
                        print(pswd);
                        try {
                          final newUser =
                              await _auth.createUserWithEmailAndPassword(
                                  email: email, password: pswd);
                          if (newUser != null) {
                            print("Registerd Succesfully");
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Patient()));
                          }
                        } catch (e) {
                          print(e);
                        }
                      },
                      minWidth: 200,
                      height: 42,
                      child: Text(
                        "Register",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    ));
  }
}
