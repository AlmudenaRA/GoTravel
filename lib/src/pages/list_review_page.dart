import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gotravel/src/core/constants.dart';
import 'package:gotravel/src/models/review_model.dart';
import 'package:gotravel/src/theme/my_colors.dart';
import 'package:gotravel/src/widget/review.dart';
import 'package:gotravel/src/models/hotel_model.dart';

class ListReview extends StatefulWidget {
  final HotelModel hotel;
  const ListReview({Key? key, required this.hotel}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ListReviewState(hotel);
}

class ListReviewState extends State<ListReview> {
  HotelModel hotel;
  ReviewModel review = ReviewModel();
  final CollectionReference reviewRef =
      FirebaseFirestore.instance.collection(Constants.collectionReview);
  ListReviewState(this.hotel);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: reviewRef.where("idHotel", isEqualTo: hotel.idHotel).snapshots(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (!snapshot.hasData) {
          return const Center(
              child: CircularProgressIndicator(
            color: MyColors.secundary,
          ));
        }

        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: snapshot.data.docs.length,
          itemBuilder: (BuildContext context, index) {
            review = ReviewModel.fromJson(snapshot.data.docs[index].data());
            return Review(
              review: review,
            );
          },
        );
      },
    );
  }
}
