import 'package:ambi/screens/googlemap.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class fl extends StatefulWidget {
  const fl({Key? key}) : super(key: key);

  @override
  State<fl> createState() => _flState();
}

class _flState extends State<fl> {
  @override
  void initState() {
    super.initState();
    _navigatetohome();
  }

  _navigatetohome() async {
    await Future.delayed(Duration(milliseconds: 10000), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Myhomepage()));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              child: Lottie.asset('images/ambu.json'),
            ),
            SizedBox(
              height: 100,
            ),
            Text(
              "Hold Back! Ambulance on your way",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 100,
            ),
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
            ),
            SizedBox(
              height: 100,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Cancel Booking',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            )
          ],
        ),
      ),
    );
  }
}
