import 'package:ambi/screens/googlemap.dart';
import 'package:ambi/sosscreen.dart';
import 'package:ambi/userapp.dart';
import 'package:ambi/usermodel.dart';
import 'package:ambi/vac.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
  int currentindex = 0;
  final screen = [sos(), Myhomepage(), Myvac(), MyAcc()];
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentindex,
        children: screen,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentindex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.amber[900],
        unselectedItemColor: Colors.amber[800],
        iconSize: 30,
        onTap: (index) => setState(() {
          currentindex = index;
        }),
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home), label: '', backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.bloodtype),
              label: '',
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.vaccines),
              label: '',
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined),
              label: '',
              backgroundColor: Colors.blue),
        ],
      ),
    );
  }
}
