import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gotravel/src/core/constants.dart';
import 'package:gotravel/src/models/review_model.dart';
import 'package:gotravel/src/theme/my_colors.dart';
import 'package:gotravel/src/widget/text_data.dart';

class Review extends StatelessWidget {
  final ReviewModel review;

  const Review({
    Key? key,
    required this.review,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              color: MyColors.secundaryDark,
              width: 27,
              height: 25,
              margin: const EdgeInsets.only(left: 20),
              child: Center(
                child: TextData(
                  text: review.score!.toString(),
                  color: MyColors.textButton,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            _userName(),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Text.rich(TextSpan(children: <InlineSpan>[
              WidgetSpan(
                  child: SizedBox(
                width: 310,
                child: TextData(
                  margin: const EdgeInsets.only(left: 68),
                  text: review.comment!,
                  color: MyColors.textWhite,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ))
            ]))
          ],
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }

  _userName() {
    CollectionReference userRef =
        FirebaseFirestore.instance.collection(Constants.collectionUser);
    return StreamBuilder(
        stream: userRef.where("id", isEqualTo: review.idUser).snapshots(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            var docs = snapshot.data.docs;
            final user = docs[0].data()!;
            return TextData(
              padding: const EdgeInsets.only(left: 20),
              text: '${user["userName"]}',
              color: MyColors.textButton,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            );
          }
          return Container();
        });
  }
}
