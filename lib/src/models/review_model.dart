import 'package:gotravel/src/core/constants.dart';

class ReviewModel {
  String? idReview;
  String? idHotel;
  String? idUser;
  int? score;
  String? comment;

  ReviewModel(
      {this.idReview, this.idHotel, this.idUser, this.score, this.comment});

  ReviewModel.fromJson(Map<String, dynamic> json)
      : idReview = json[Constants.reviewId],
        idHotel = json[Constants.reviewIdHotel],
        idUser = json[Constants.reviewIdUser],
        score = json[Constants.reviewScore],
        comment = json[Constants.reviewComment];

  Map<String, dynamic> toJson() => {
        Constants.reviewId: idReview,
        Constants.reviewIdHotel: idHotel,
        Constants.reviewIdUser: idUser,
        Constants.reviewScore: score,
        Constants.reviewComment: comment,
      };
}
