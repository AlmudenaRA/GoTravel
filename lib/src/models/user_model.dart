import 'package:gotravel/src/core/constants.dart';

class UserModel {
  String? id;
  String? userName;
  String? password;
  String? email;
  String? avatar;
  int? point;
  List<String>? fav;

  UserModel({
    this.id,
    this.userName,
    this.email,
    this.password,
    this.avatar,
    this.point,
    this.fav,
  });

  UserModel.fromJson(Map<String, dynamic> json)
      : id = json[Constants.userId],
        userName = json[Constants.userUserName],
        email = json[Constants.userEmail],
        password = json[Constants.userPass],
        avatar = json[Constants.userAvatar],
        point = json[Constants.userPoint],
        fav = json[Constants.userFav].cast<String>();

  Map<String, dynamic> toJson() => {
        Constants.userId: id,
        Constants.userUserName: userName,
        Constants.userEmail: email,
        Constants.userPass: password,
        Constants.userAvatar: avatar,
        Constants.userPoint: point,
        Constants.userFav: fav,
      };
}
