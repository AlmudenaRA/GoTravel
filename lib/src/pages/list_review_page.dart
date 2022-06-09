import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gotravel/src/core/constants.dart';
import 'package:gotravel/src/models/review_model.dart';
import 'package:gotravel/src/theme/my_colors.dart';
import 'package:gotravel/src/widget/review.dart';

class ListReview extends StatefulWidget {
  const ListReview({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ListReviewState();
}

class ListReviewState extends State<ListReview> {
  final CollectionReference collectRefReview =
      FirebaseFirestore.instance.collection(Constants.collectionHotel);

  ReviewModel review = ReviewModel();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: collectRefReview.get(),
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
          itemCount: 3, //TODO snapshot.data.docs.length,
          itemBuilder: (BuildContext context, index) {
            //TODO review = ReviewModel.fromJson(snapshot.data.docs[index].data());
            return const Review(
                //hotelModel: hotel,
                );
          },
        );
      },
    );
  }
}
