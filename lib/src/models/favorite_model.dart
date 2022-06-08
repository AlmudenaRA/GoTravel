import 'package:gotravel/src/core/constants.dart';

class FavoriteModel {
  String? idFav;
  String? idHotel;
  String? idUser;
  String? location;

  FavoriteModel({this.idFav, this.idHotel, this.idUser, this.location});

  FavoriteModel.fromJson(Map<String, dynamic> json)
      : idFav = json[Constants.favId],
        idHotel = json[Constants.favIdHotel],
        idUser = json[Constants.favIdUser],
        location = json[Constants.favLocation];

  Map<String, dynamic> toJson() => {
        Constants.favId: idFav,
        Constants.favIdHotel: idHotel,
        Constants.favIdUser: idUser,
        Constants.favLocation: location,
      };
}
