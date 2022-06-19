import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gotravel/src/core/constants.dart';
import 'package:gotravel/src/models/hotel_model.dart';
import 'package:gotravel/src/models/offer_model.dart';
import 'package:gotravel/src/theme/my_colors.dart';
import 'package:gotravel/src/widget/button_text_icon.dart';
import 'package:gotravel/src/widget/star_hotel.dart';
import 'package:gotravel/src/widget/text_data.dart';
import 'package:url_launcher/url_launcher.dart';

class OtherOffer extends StatefulWidget {
  final HotelModel hotelModel;
  const OtherOffer({Key? key, required this.hotelModel}) : super(key: key);

  @override
  State<OtherOffer> createState() => _OtherOfferState(hotelModel);
}

class _OtherOfferState extends State<OtherOffer> {
  HotelModel hotelModel;
  _OtherOfferState(this.hotelModel);
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent),
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _swiper(),
          const SizedBox(
            height: 20,
          ),
          _dataHotel(hotelModel),
          const SizedBox(
            height: 20,
          ),
          const TextData(
            padding: EdgeInsets.only(left: 20),
            text: Constants.otherRecommendation,
            color: MyColors.secundaryLig,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          _offer(),
          const SizedBox(
            height: 20,
          ),
          const TextData(
            padding: EdgeInsets.only(left: 20),
            text: Constants.otherOffers,
            color: MyColors.secundaryLig,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          _otherOffer(),
        ],
      )),
    );
  }

  _swiper() {
    final List<Widget> listImag = hotelModel.photo!
        .map(
          (e) => ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              child: Stack(
                children: [
                  Image.network(
                    e,
                    fit: BoxFit.cover,
                  )
                ],
              )),
        )
        .toList();

    return SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(children: [
          CarouselSlider(
            options: CarouselOptions(
                scrollDirection: Axis.horizontal,
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 2.0,
                viewportFraction: 0.75,
                enlargeStrategy: CenterPageEnlargeStrategy.height,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                }),
            items: listImag,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: hotelModel.photo!.asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () => _controller.animateToPage(entry.key),
                child: Container(
                  width: 10.0,
                  height: 10.0,
                  margin: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 4.0),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: (Theme.of(context).brightness == Brightness.light
                              ? MyColors.secundaryLig
                              : Colors.white)
                          .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                ),
              );
            }).toList(),
          ),
        ]));
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
              StarHotel(
                index: hotelModel.star!,
                size: 15,
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

  _offer() {
    final CollectionReference offerRef =
        FirebaseFirestore.instance.collection(Constants.collectionOffer);
    OfferModel offer = OfferModel();
    return FutureBuilder(
      future: offerRef
          .where("idHotel", isEqualTo: hotelModel.idHotel)
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
            return _offerBest(offer);
          },
        );
      },
    );
  }

  _offerBest(OfferModel offer) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      width: 250,
      height: 60,
      decoration: BoxDecoration(
          color: MyColors.secundaryDark,
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextData(
            padding: const EdgeInsets.only(left: 20),
            text: offer.urlPage!,
            color: MyColors.textWhite,
            fontSize: 15,
          ),
          ButtonTextIcon(
            text: '${offer.priceNight!.floor()} €',
            color: MyColors.textButton,
            icon: Icons.chevron_right,
            onPressed: () => _onPressed(offer),
          ),
        ],
      ),
    );
  }

  _otherOffer() {
    final CollectionReference offerRef =
        FirebaseFirestore.instance.collection(Constants.collectionOffer);
    OfferModel offer = OfferModel();
    return FutureBuilder(
      future: offerRef
          .where("idHotel", isEqualTo: hotelModel.idHotel)
          .orderBy("priceNight")
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
            return _offerBest(offer);
          },
        );
      },
    );
  }

  _onPressed(OfferModel offer) async {
    final Uri _url = Uri.parse(offer.website!);
    if (!await launchUrl(_url)) throw 'Could not launch $_url';
  }
}
