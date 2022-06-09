import 'package:gotravel/src/core/constants.dart';
import 'package:gotravel/src/models/review_model.dart';

class HotelModel {
  String? idHotel;
  String? description;
  String? hotelName;
  String? location;
  int? star;
  List<String>? photo;
  List<String>? service;
  List<ReviewModel>? review;

  HotelModel(
      {this.idHotel,
      this.description,
      this.hotelName,
      this.location,
      this.star,
      this.photo,
      this.service,
      this.review});

  HotelModel.fromJson(Map<String, dynamic> json)
      : idHotel = json[Constants.hotelId],
        description = json[Constants.hotelDescription],
        hotelName = json[Constants.hotelName],
        location = json[Constants.hotelLocation],
        star = json[Constants.hotelStar].cast<String>(),
        photo = json[Constants.hotelPhoto].cast<String>(),
        service = json[Constants.hotelService].cast<String>(),
        review = json[Constants.hotelReview].cast<String>();

  Map<String, dynamic> toJson() => {
        Constants.hotelId: idHotel,
        Constants.hotelDescription: description,
        Constants.hotelName: hotelName,
        Constants.hotelLocation: location,
        Constants.hotelStar: star,
        Constants.hotelPhoto: photo,
        Constants.hotelService: service,
        Constants.hotelReview: review,
      };
}
