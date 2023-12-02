import 'package:flutter/material.dart';

class aboutt extends StatefulWidget {
  const aboutt({Key? key}) : super(key: key);

  @override
  State<aboutt> createState() => _abouttState();
}

class _abouttState extends State<aboutt> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RichText(
                text: TextSpan(
                  text: 'Roc',
                  style: TextStyle(
                      fontFamily: 'Varela', color: Colors.black, fontSize: 40),
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
              SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Sulem Bakrawala",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 28,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Dewansh Jangir",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 28,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
