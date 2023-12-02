class UserModel {
  String? abn;
  String? abp;

  UserModel({this.abn, this.abp});

  // receiving data from server
  factory UserModel.fromMap(map) {
    return UserModel(
      abn: map['abp'],
      abp: map['abp'],
    );
  }
}
