import 'package:flutter/cupertino.dart';

class Cardi {
  late final String hospital;
  late final String bloodgroupABp;
  late final String abpd;
  late final String bloodgroupABn;
  late final String abpnd;
  late final String bloodgroupAp;
  late final String apd;
  late final String bloodgroupAn;
  late final String and;
  late final Text p;
  Cardi(
      {required this.hospital,
      required this.bloodgroupABp,
      required this.abpd,
      required this.bloodgroupABn,
      required this.abpnd,
      required this.bloodgroupAp,
      required this.apd,
      required this.bloodgroupAn,
      required this.and});
}

class ambu {
  late final String name;
  late final double charge;
  ambu({required this.name, required this.charge});
}
