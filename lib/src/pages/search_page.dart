import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gotravel/src/core/constants.dart';
import 'package:gotravel/src/models/hotel_model.dart';
import 'package:flutter/material.dart';
import 'package:gotravel/src/models/review_model.dart';
import 'package:gotravel/src/provider/review_provider.dart';
import 'package:gotravel/src/theme/my_colors.dart';
import 'package:gotravel/src/widget/card_hotel.dart';

class Search extends SearchDelegate<HotelModel> {
  final CollectionReference hotelRef =
      FirebaseFirestore.instance.collection(Constants.collectionHotel);

  @override
  String? get searchFieldLabel => Constants.textSearch;

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () => query = '',
        icon: const Icon(Icons.close),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () => close(context, HotelModel()),
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder(
        future: queryData(
          query,
        ),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(
                color: MyColors.secundary,
              ),
            );
          }

          if (snapshot.data.docs.length < 1) {
            return const Center(
                child: Text(
              Constants.search,
              style: TextStyle(color: MyColors.textButton, fontSize: 20),
            ));
          }

          return ListView.builder(
            shrinkWrap: true,
            itemCount: snapshot.data.docs.length,
            itemBuilder: (BuildContext context, index) {
              HotelModel hotel =
                  HotelModel.fromJson(snapshot.data.docs[index].data());
              return CardHotel(
                hotelModel: hotel,
              );
            },
          );
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isNotEmpty) {
      return FutureBuilder(
          future: queryData(
            query,
          ),
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
                HotelModel hotel =
                    HotelModel.fromJson(snapshot.data.docs[index].data());
                return CardHotel(
                  hotelModel: hotel,
                );
              },
            );
          });
    } else {
      return Container();
    }
  }

  Future queryData(String queryString) async {
    return hotelRef
        .where('location', isGreaterThanOrEqualTo: queryString)
        .where('location', isLessThanOrEqualTo: queryString + '\uF8FF')
        .get();
  }
}
