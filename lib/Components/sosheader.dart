import 'package:ambi/userapp.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

import '../usermodel.dart';

class sosheader extends StatefulWidget {
  const sosheader({Key? key}) : super(key: key);

  @override
  State<sosheader> createState() => _sosheaderState();
}

class _sosheaderState extends State<sosheader> {
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
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => MyAcc()));
            },
            child: CircleAvatar(
              backgroundImage: AssetImage("images/gh.webp"),
              radius: 20,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
            child: Text.rich(
              TextSpan(
                  text: "hi ",
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.w300),
                  children: [
                    TextSpan(
                        text: "${loggedinUser.fname}",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold))
                  ]),
            ),
          ),
          SizedBox(
            width: 170,
          ),
        ],
      ),
    );
  }
}
