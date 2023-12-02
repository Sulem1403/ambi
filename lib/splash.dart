import 'package:ambi/HomeScreen.dart';
import 'package:ambi/Onboarding.dart';
import 'package:ambi/sosscreen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigatetohome();
  }

  _navigatetohome() async {
    await Future.delayed(Duration(milliseconds: 5000), () {});
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Onboarding()));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 100,
          ),
          Container(
            child: Lottie.asset('images/heal.json'),
          ),
          SizedBox(
            height: 200,
          ),
          /**/
          Align(
            alignment: Alignment.bottomCenter,
            child: RichText(
              text: TextSpan(
                text: 'Roc',
                style: TextStyle(
                    fontFamily: 'Varela', color: Colors.black, fontSize: 28),
                children: const <TextSpan>[
                  TextSpan(
                      text: 'AID',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                          fontFamily: 'Varela')),
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}
