import 'package:gotravel/src/core/constants.dart';

class FavoriteModel {
  String? idFav;
  String? idHotel;
  String? idUser;
  String? location;
  bool? isFav;

  FavoriteModel({this.idFav, this.idHotel, this.idUser, this.location});

  FavoriteModel.fromJson(Map<String, dynamic> json)
      : idFav = json[Constants.favId],
        idHotel = json[Constants.favIdHotel],
        idUser = json[Constants.favIdUser],
        location = json[Constants.favLocation],
        isFav = json[Constants.favIsFavorite];

  Map<String, dynamic> toJson() => {
        Constants.favId: idFav,
        Constants.favIdHotel: idHotel,
        Constants.favIdUser: idUser,
        Constants.favLocation: location,
        Constants.favIsFavorite: isFav
      };
}
