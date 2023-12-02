import 'package:ambi/HomeScreen.dart';
import 'package:ambi/usermodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Patient extends StatefulWidget {
  static const String id = 'patient';
  const Patient({Key? key}) : super(key: key);

  @override
  State<Patient> createState() => _PatientState();
}

class _PatientState extends State<Patient> {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  String fname = '';
  String lname = '';
  String bloodd = '';
  @override
  Widget build(BuildContext context) {
    final Fname = TextField(
      onChanged: (value) {
        fname = value;
      },
      decoration: InputDecoration(
          hintText: 'Enter First Name',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(color: Colors.blueAccent, width: 0.5),
          ),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blueAccent, width: 2),
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ))),
    );
    final Lname = TextField(
      onChanged: (value) {
        lname = value;
      },
      decoration: InputDecoration(
          hintText: 'Enter Last Name',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(color: Colors.blueAccent, width: 0.5),
          ),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blueAccent, width: 2),
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ))),
    );
    final blood = TextField(
      onChanged: (value) {
        bloodd = value;
      },
      decoration: InputDecoration(
          hintText: 'Blood Group',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(color: Colors.blueAccent, width: 0.5),
          ),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blueAccent, width: 2),
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ))),
    );
    final button = Padding(
      padding: const EdgeInsets.all(10.0),
      child: Material(
        elevation: 5,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        child: MaterialButton(
          onPressed: () {
            try {
              User? user = _auth.currentUser;
              UserModel userModel = UserModel();
              userModel.fname = fname;
              userModel.lname = lname;
              userModel.blood = bloodd;
              userModel.uid = user!.uid;

              final aull = _firestore
                  .collection('patient')
                  .doc(user.uid)
                  .set(userModel.toMap());
              if (aull != null) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              }
            } catch (e) {
              print(e);
            }
          },
          child: Text(
            'Submit',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          minWidth: 200,
          height: 40,
        ),
      ),
    );
    return Scaffold(
      body: Material(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Patient Details',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 50),
            ),
            Container(
              margin: EdgeInsets.all(30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Fname,
                  SizedBox(
                    height: 24,
                  ),
                  Lname,
                  SizedBox(
                    height: 24,
                  ),
                  blood,
                  SizedBox(
                    height: 24,
                  ),
                  button,
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
