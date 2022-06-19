import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gotravel/src/core/constants.dart';
import 'package:gotravel/src/models/hotel_model.dart';
import 'package:gotravel/src/theme/my_colors.dart';
import 'package:gotravel/src/widget/card_hotel.dart';

class ListHotel extends StatefulWidget {
  final double score;
  final double star;
  final double price;
  final bool? location;
  final bool? nameHotel;
  final bool? starHotel;

  const ListHotel(
      {Key? key,
      required this.score,
      required this.star,
      required this.price,
      this.location,
      this.nameHotel,
      this.starHotel})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => ListHotelState();
}

class ListHotelState extends State<ListHotel> {
  final CollectionReference hotelRef =
      FirebaseFirestore.instance.collection(Constants.collectionHotel);
  HotelModel hotel = HotelModel();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: queryData(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (!snapshot.hasData) {
          return const Center(
              child: CircularProgressIndicator(
            color: MyColors.secundary,
          ));
        }
        return ListView.builder(
          padding: const EdgeInsets.all(20),
          shrinkWrap: true,
          itemCount: snapshot.data.docs.length,
          itemBuilder: (BuildContext context, index) {
            hotel = HotelModel.fromJson(snapshot.data.docs[index].data());
            return CardHotel(
              hotelModel: hotel,
            );
          },
        );
      },
    );
  }

  Future queryData() async {
    if (widget.star > 0.0) {
      return hotelRef.where("star", isGreaterThanOrEqualTo: widget.star).get();
    }
    if (widget.location!) {
      return hotelRef.orderBy("location").get();
    } else if (widget.nameHotel!) {
      return hotelRef.orderBy("hotelName").get();
    } else if (widget.starHotel!) {
      return hotelRef.orderBy("star").get();
    }
    return hotelRef.get();
  }
}
