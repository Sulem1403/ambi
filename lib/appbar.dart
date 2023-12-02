import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

AppBar buildbar(context) {
  return AppBar(
    leading: BackButton(),
    backgroundColor: Colors.transparent,
    elevation: 0,
    actions: [
      IconButton(
        icon: Icon(CupertinoIcons.moon_stars),
        onPressed: () {
          print("Dark Mode On!");
        },
      )
    ],
  );
}
