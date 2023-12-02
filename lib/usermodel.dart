class UserModel {
  String? uid;
  String? blood;
  String? fname;
  String? lname;

  UserModel({this.uid, this.fname, this.lname, this.blood});

  // receiving data from server
  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      blood: map['blood'],
      fname: map['fname'],
      lname: map['lname'],
    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'fname': fname,
      'lname': lname,
      'blood': blood,
    };
  }
}
