import 'package:ambi/Components/soscard.dart';
import 'package:ambi/Components/sosheader.dart';
import 'package:ambi/usermodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
// import 'package:lottie/lottie.dart';
import 'package:holding_gesture/holding_gesture.dart';
import 'package:flutter/widgets.dart';

import 'data.dart';
import 'firstaid.dart';

class sos extends StatefulWidget {
  const sos({Key? key}) : super(key: key);

  @override
  State<sos> createState() => _sosState();
}

class _sosState extends State<sos> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedinUser = UserModel();

  @override
  void initState() {
    // TODO: implement initState
    FirebaseFirestore.instance
        .collection('patient')
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedinUser = UserModel.fromMap(value.data());
      setState(() {});
    });
    super.initState();
  }

  @override
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  @override
  double fsize = 20;
  Widget build(BuildContext context) {
    const number = '8003305398';
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(left: 2),
          child: Column(children: [
            SizedBox(
              height: 10,
            ),
            sosheader(),
            Text(
              "Emergency help needed?",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 38),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Just hold the button to call",
              maxLines: 5,
              style: TextStyle(
                  color: Colors.grey[400],
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
            SizedBox(
              height: 30,
            ),
            HoldDetector(
              onHold: () async {
                await FlutterPhoneDirectCaller.callNumber(number);
              },
              holdTimeout: Duration(milliseconds: 200),
              enableHapticFeedback: true,
              child: Container(
                height: 200,
                width: 200,
                child: ElevatedButton(
                    child: Text("SOS".toUpperCase(),
                        style: TextStyle(fontSize: 40)),
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.red),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                          side: BorderSide(color: Colors.red),
                        ),
                      ),
                    ),
                    onPressed: () => print("Mickey")),
              ),
            ),
            SizedBox(
              height: 45,
            ),
            Text(
              "Not sure what to do? ",
              style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Pick the Subject to help",
              maxLines: 5,
              style: TextStyle(
                  color: Colors.grey[400],
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  letterSpacing: 1.2),
            ),
            SizedBox(
              height: 30,
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) =>
                    BuildCard(items[index], context),
                itemCount: 5,
                scrollDirection: Axis.horizontal,
              ),
            ),
            SizedBox(
              height: 2,
            )
          ]),
        ),
      ),
    );
  }
}

Widget BuildCard(CardItem item, context) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: InkWell(
      onTap: () {
        print("Hello Dewansh");
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => FirstaidPage(item: item)));
      },
      child: Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.only(left: 20),
        height: 160,
        width: 200,
        child: Column(children: [
          Text(
            "${item.help}",
            textAlign: TextAlign.left,
            style: TextStyle(
                letterSpacing: 1.2,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18),
          ),
        ]),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),
  );
}
