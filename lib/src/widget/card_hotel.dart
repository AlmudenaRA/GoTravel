import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gotravel/src/models/hotel_model.dart';
import 'package:gotravel/src/models/offer_model.dart';
import 'package:gotravel/src/pages/details_hotel_page.dart';
import 'package:gotravel/src/pages/other_offer_page.dart';
import 'package:gotravel/src/theme/my_colors.dart';
import 'package:gotravel/src/widget/button_text.dart';
import 'package:gotravel/src/widget/button_text_icon.dart';
import 'package:gotravel/src/widget/star_hotel.dart';
import 'package:gotravel/src/widget/text_data.dart';
import 'package:gotravel/src/core/constants.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:favorite_button/favorite_button.dart';

class CardHotel extends StatelessWidget {
  final HotelModel hotelModel;

  const CardHotel({
    Key? key,
    required this.hotelModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DetailHotel(hotelModel: hotelModel)));
        },
        child: Stack(children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            decoration: const BoxDecoration(
                color: MyColors.pDark,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Column(
              children: [
                Container(
                  width: 320,
                  decoration: const BoxDecoration(
                    color: MyColors.pLight,
                    shape: BoxShape.circle,
                    //borderRadius: BorderRadius.all(Radius.circular(10)
                  ),
                  child: hotelModel.photo![0].isEmpty
                      ? Image.network(Constants.hotelImageUnavailable)
                      : Image.network(hotelModel.photo![0].toString()),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextData(
                            padding: const EdgeInsets.only(top: 10),
                            text: hotelModel.hotelName!,
                            color: MyColors.textWhite,
                            fontSize: 18,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              // const Padding(padding: EdgeInsets.only(left: 10)),
                              StarHotel(
                                index: hotelModel.star!,
                                size: 10,
                              ),
                              TextData(
                                padding: const EdgeInsets.only(left: 20),
                                text: hotelModel.location!,
                                color: MyColors.textWhite,
                                fontSize: 13,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          )
                        ]),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FavoriteButton(
                            iconSize: 40,
                            iconDisabledColor: MyColors.textWhite,
                            iconColor: MyColors.secundary,
                            valueChanged: (_) {},
                          ),
                        ]),
                  ],
                ),
                _offer(hotelModel),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ButtonText(
                      text: Constants.btnOtherOffer,
                      color: MyColors.pLightSure,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    OtherOffer(hotelModel: hotelModel)));
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ]));
  }

  _onPressed(OfferModel offer) async {
    final Uri _url = Uri.parse(offer.website!);
    if (!await launchUrl(_url)) throw 'Could not launch $_url';
  }

  _offer(HotelModel hotel) {
    final CollectionReference offerRef =
        FirebaseFirestore.instance.collection(Constants.collectionOffer);
    OfferModel offer = OfferModel();
    return FutureBuilder(
      future: offerRef
          .where("idHotel", isEqualTo: hotel.idHotel)
          .orderBy("priceNight")
          .limit(1)
          .get(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (!snapshot.hasData) {
          return const Center(
              child: CircularProgressIndicator(
            color: MyColors.secundary,
          ));
        }
        return ListView.builder(
          shrinkWrap: true,
          itemCount: snapshot.data.docs.length,
          itemBuilder: (BuildContext context, index) {
            offer = OfferModel.fromJson(snapshot.data.docs[index].data());
            return _bestOffer(offer);
          },
        );
      },
    );
  }

  _bestOffer(OfferModel offer) {
    return Container(
      width: 300,
      height: 50,
      color: MyColors.secundaryDark,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                TextData(
                  padding: const EdgeInsets.only(top: 10, left: 10),
                  text: '${offer.priceNight!.floor()} €',
                  color: MyColors.pLightSure,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ]),
              Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                const TextData(
                  padding: EdgeInsets.only(left: 10),
                  text: Constants.offTxtWeb,
                  color: MyColors.textWhite,
                  fontSize: 10,
                ),
                TextData(
                  text: offer.urlPage!,
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
            onPressed: () => _onPressed(offer),
          ),
        ],
      ),
    );
  }
}
