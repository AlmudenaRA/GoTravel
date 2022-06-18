import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gotravel/src/core/constants.dart';
import 'package:gotravel/src/models/hotel_model.dart';
import 'package:gotravel/src/models/review_model.dart';
import 'package:gotravel/src/pages/list_review_page.dart';
import 'package:gotravel/src/provider/review_provider.dart';
import 'package:gotravel/src/provider/user_provider.dart';
import 'package:gotravel/src/theme/my_colors.dart';
import 'package:gotravel/src/utils/utils.dart';
import 'package:gotravel/src/widget/button_text_icon.dart';
import 'package:gotravel/src/widget/text_data.dart';
import 'package:gotravel/src/widget/txt_comment.dart';
import 'package:url_launcher/url_launcher.dart';
//import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:uuid/uuid.dart';

class DetailHotel extends StatefulWidget {
  final HotelModel hotelModel;
  const DetailHotel({Key? key, required this.hotelModel}) : super(key: key);

  @override
  State<DetailHotel> createState() => _DetailHotelState(hotelModel);
}

class _DetailHotelState extends State<DetailHotel> {
  HotelModel hotelModel;
  ReviewModel review = ReviewModel();
  _DetailHotelState(this.hotelModel);
  final _auth = FirebaseAuth.instance;
  var uuid = const Uuid();
  double score = 0.0;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent),
      body: SingleChildScrollView(
          child: Column(
        children: [
          _swiper(),
          const SizedBox(
            height: 20,
          ),
          _dataHotel(hotelModel),
          const SizedBox(
            height: 20,
          ),
          _description(hotelModel),
          const SizedBox(
            height: 20,
          ),
          const Divider(
            height: 10,
            color: MyColors.pLight,
            thickness: 0.8,
          ),
          _newReview(),
          _review(),
          const ListReview(),
          const SizedBox(
            height: 20,
          ),
          _offer(),
        ],
      )),
    );
  }

  _images() {
    for (var element in hotelModel.photo!) {
      return Image.network(
        element,
        fit: BoxFit.cover,
      );
    }

    // return hotelModel.photo!
    //     .map((e) => Container(
    //           child: Image.network(
    //             e,
    //             fit: BoxFit.cover,
    //           ),
    //         ))
    //     .toList();
  }

  _swiper() {
    return ImageSlideshow(
      width: double.infinity,
      height: 200,
      initialPage: 0,
      indicatorColor: MyColors.secundary,
      indicatorBackgroundColor: Colors.grey,
      onPageChanged: (value) {},
      autoPlayInterval: 3000,
      isLoop: true,
      children: [_images()],
    );
  }

  _dataHotel(HotelModel hotelModel) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          TextData(
            padding: const EdgeInsets.only(left: 20),
            text: hotelModel.hotelName!,
            color: MyColors.textButton,
            fontSize: 24,
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Padding(padding: EdgeInsets.only(left: 20)),
              RatingBar.builder(
                initialRating: hotelModel.star!.toDouble(),
                minRating: 0,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                tapOnlyMode: true,
                itemSize: 15,
                itemPadding: const EdgeInsets.symmetric(horizontal: 1.5),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: MyColors.textWhite,
                ),
                onRatingUpdate: (rating) {
                  //print(rating);
                },
              ),
              TextData(
                padding: const EdgeInsets.only(left: 20),
                text: hotelModel.location!,
                color: MyColors.textWhite,
                fontSize: 13,
              ),
            ],
          )
        ]),
        // Positioned(
        //   top: 20.0,
        //   child: FavoriteButton(
        //     iconSize: 50,
        //     iconDisabledColor: MyColors.textWhite,
        //     iconColor: MyColors.secundaryDark,
        //     valueChanged: (_) {},
        //   ),
        // ),
        const SizedBox(
          width: 15,
        ),
      ],
    );
  }

  _description(HotelModel hotelModel) {
    return Column(
      children: [
        Row(children: const [
          TextData(
            padding: EdgeInsets.only(left: 20),
            text: Constants.detDescription,
            color: MyColors.secundaryLig,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ]),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Text.rich(TextSpan(children: <InlineSpan>[
              WidgetSpan(
                  child: SizedBox(
                width: 335,
                child: TextData(
                  padding: const EdgeInsets.only(left: 20),
                  text: hotelModel.description!,
                  color: MyColors.textWhite,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  //)
                ),
              ))
            ]))
          ],
        )
      ],
    );
  }

  _review() {
    return Column(children: [
      Row(children: const [
        TextData(
          padding: EdgeInsets.only(left: 20, top: 20),
          text: Constants.detReview,
          color: MyColors.secundaryLig,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ]),
      const SizedBox(
        height: 10,
      ),
    ]);
  }

  _offer() {
    return Container(
      width: 450,
      height: 50,
      color: MyColors.pLight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.start, children: const [
                TextData(
                  padding: EdgeInsets.only(top: 10, left: 10),
                  text: "150 €",
                  color: MyColors.secundaryDark,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ]),
              Row(mainAxisAlignment: MainAxisAlignment.start, children: const [
                TextData(
                  padding: EdgeInsets.only(left: 10),
                  text: "por noche en...",
                  color: MyColors.textWhite,
                  fontSize: 10,
                ),
                TextData(
                  text: "web",
                  color: MyColors.textWhite,
                  fontSize: 10,
                )
              ]),
            ],
          ),
          ButtonTextIcon(
            text: Constants.btnOffer,
            color: MyColors.textButton,
            icon: Icons.chevron_right,
            onPressed: () => _onPressed(),
          ),
        ],
      ),
    );
  }

  _newReview() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TextData(
            padding: EdgeInsets.only(left: 20, top: 20),
            text: Constants.newReview,
            color: MyColors.secundaryLig,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const Padding(padding: EdgeInsets.only(left: 20)),
              _ratingBarVote(),
              TextData(
                padding: const EdgeInsets.only(left: 20),
                text: '$score / 5.0',
                color: MyColors.textButton,
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ],
          ),
          TxtComment(
            onSaved: (val) => review.comment = val,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Padding(padding: EdgeInsets.only(right: 20)),
              ButtonTextIcon(
                text: Constants.reviewSend,
                fontsize: 15,
                color: MyColors.textButton,
                icon: Icons.send,
                onPressed: () => _sendReview(),
              ),
            ],
          )
        ],
      ),
    );
  }

  _ratingBarVote() {
    return RatingBar.builder(
      initialRating: score,
      itemCount: 5,
      allowHalfRating: true,
      direction: Axis.horizontal,
      unratedColor: MyColors.textWhite,
      itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
      itemBuilder: (context, index) {
        switch (index) {
          case 0:
            return const Icon(
              Icons.sentiment_very_dissatisfied,
              color: Colors.red,
            );
          case 1:
            return const Icon(
              Icons.sentiment_dissatisfied,
              color: Colors.redAccent,
            );
          case 2:
            return const Icon(
              Icons.sentiment_neutral,
              color: Colors.amber,
            );
          case 3:
            return const Icon(
              Icons.sentiment_satisfied,
              color: Colors.lightGreen,
            );
          case 4:
            return const Icon(
              Icons.sentiment_very_satisfied,
              color: Colors.green,
            );
          default:
            return const Center();
        }
      },
      onRatingUpdate: (rating) {
        // review.idReview = uuid.v4();
        // review.score = rating;
        // review.idHotel = hotelModel.idHotel;
        // review.idUser = _auth.currentUser!.uid;

        // //addScore(review);
        // otherTest(_auth.currentUser!.uid, hotelModel.idHotel!, review);
        setState(() {
          score = rating;
          review.score = score;
        });
      },
    );
  }

  _sendReview() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState!.save();
    // showLoadingIndicator(context, Constants.load, Constants.loadReview);
    try {
      review.idReview = uuid.v4();
      review.idHotel = hotelModel.idHotel;
      review.idUser = _auth.currentUser!.uid;
      if (review.score != null && review.comment != null) {
        addReview(review);
      } else {
        showAlertDialog(context, Constants.error, Constants.strEmptys);
      }
    } on FirebaseFirestore catch (e) {
      showAlertDialog(context, Constants.error, e.toString());
    }
  }

  _onPressed() async {
    // final Uri _url = Uri.parse(Constants.urlHotel);
    // if (!await launchUrl(_url)) throw 'Could not launch $_url';
  }
}
