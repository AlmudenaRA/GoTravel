import 'package:flutter/material.dart';
import 'package:gotravel/src/models/hotel_model.dart';
import 'package:gotravel/src/theme/my_colors.dart';
import 'package:gotravel/src/widget/button_text.dart';
import 'package:gotravel/src/widget/button_text_icon.dart';
import 'package:gotravel/src/widget/text_data.dart';
import 'package:gotravel/src/core/constants.dart';

class CardHotel extends StatelessWidget {
  //final HotelModel hotelModel;
  // final OfferModel? offerModel;

  const CardHotel({
    Key? key,
    // required this.hotelModel, this.offerModel
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {},
        child: Card(
          margin: const EdgeInsets.all(20),
          elevation: 50,
          shadowColor: MyColors.pDark,
          color: MyColors.pLight,
          child: Column(
            children: [
              Container(
                height: 144,
                width: 400,
                color: MyColors.pDark,
                child: const Icon(
                  Icons.abc,
                  color: MyColors.textWhite,
                ),
                //TODO child: Image.asset(
                //   hotelModel.photo![0],
                //   height: 144,
                //   width: 400,
                // ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const TextData(
                          padding: EdgeInsets.only(left: 20),
                          text:
                              "Nombre del hotel", //TODO hotelModel.hotelName!,
                          color: MyColors.textWhite,
                          fontSize: 18,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Padding(padding: EdgeInsets.only(left: 20)),
                            _checkStar(),
                            const TextData(
                              padding: EdgeInsets.only(left: 20),
                              text: "Madrid", //TODO hotelModel.location!,
                              color: MyColors.textWhite,
                              fontSize: 13,
                            ),
                          ],
                        )
                      ]),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.favorite,
                        color: MyColors.textWhite,
                      ))
                ],
              ),
              Container(
                width: 300,
                height: 70,
                color: MyColors.pLightSure,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const [
                              TextData(
                                padding: EdgeInsets.only(top: 10, left: 10),
                                text: "150 €",
                                color: MyColors.secundaryDark,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ]),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const [
                              TextData(
                                padding: EdgeInsets.only(left: 10),
                                text: "por noche en...",
                                color: MyColors.textButton,
                                fontSize: 10,
                              ),
                              TextData(
                                text: "web",
                                color: MyColors.textButton,
                                fontSize: 10,
                              )
                            ]),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            TextData(
                              padding: EdgeInsets.only(left: 10),
                              text: "x ",
                              color: MyColors.textButton,
                              fontSize: 10,
                            ),
                            TextData(
                              text: "noches por ",
                              color: MyColors.textButton,
                              fontSize: 10,
                            ),
                            TextData(
                              text: "900 €",
                              color: MyColors.secundaryDark,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ],
                        )
                      ],
                    ),
                    const ButtonTextIcon(
                      text: Constants.btnOffer,
                      color: MyColors.textButton,
                      navigation: Constants.routesProfile,
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  ButtonText(
                    text: Constants.btnOtherOffer,
                    color: MyColors.pLightSure,
                    navigation: Constants.routesProfile,
                  ),
                ],
              )
            ],
          ),
        ));
  }

  _checkStar() {
    // if (hotelModel.star! >= 1) {
    //   for (int i = 1; i < hotelModel.star!; i++) {
    //     return const Icon(
    //       Icons.star,
    //       color: MyColors.textWhite,
    //       size: 15,
    //     );
    //   }
    //
    for (int i = 1; i < 3; i++) {
      return const Icon(
        Icons.star,
        color: MyColors.textWhite,
        size: 15,
      );
    }
  }

  _iconStar() {
    const Icon(
      Icons.star,
      color: MyColors.textWhite,
      size: 15,
    );
  }
}
