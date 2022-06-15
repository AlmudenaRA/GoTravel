import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gotravel/src/core/constants.dart';
import 'package:gotravel/src/models/hotel_model.dart';
import 'package:flutter/material.dart';

class Search extends SearchDelegate<HotelModel> {
  List<HotelModel> destinyHotel = [];
  List<HotelModel> _filterDestiny = [];
  final CollectionReference hotelRef =
      FirebaseFirestore.instance.collection(Constants.collectionHotel);

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
    //TODO cambiar
    return ListView.builder(
      itemCount: _filterDestiny.length,
      itemBuilder: (BuildContext context, index) {
        return ListTile(
          title: Text(destinyHotel[index].location!),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    _filterDestiny = destinyHotel.where((element) {
      return element.location!
          .toLowerCase()
          .contains(query.trim().toLowerCase());
    }).toList();
    //TODO cambiar lista
    return ListView.builder(
      itemCount: _filterDestiny.length,
      itemBuilder: (BuildContext context, index) {
        return ListTile(
          title: Text(destinyHotel[index].location!),
        );
      },
    );
  }
}

Future queryData(String queryString, CollectionReference hotelRef) async {
  return hotelRef.where('location', isGreaterThanOrEqualTo: queryString).get();
}
