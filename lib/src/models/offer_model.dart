import 'package:gotravel/src/core/constants.dart';

class OfferModel {
  String? idOffert;
  String? idHotel;
  String? destiny;
  String? website;
  double? priceNight;
  double? priceFinal;
  DateTime? dateStart;
  DateTime? dateEnd;
  int? person;
  int? room;

  OfferModel(
      {this.idOffert,
      this.idHotel,
      this.destiny,
      this.website,
      this.priceNight,
      this.priceFinal,
      this.dateStart,
      this.dateEnd,
      this.person,
      this.room});

  OfferModel.fromJson(Map<String, dynamic> json)
      : idOffert = json[Constants.offerId],
        idHotel = json[Constants.offerIdHotel],
        destiny = json[Constants.offerDestiny],
        website = json[Constants.offerWebsite],
        priceNight = json[Constants.offerPriceNight],
        priceFinal = json[Constants.offerPriceFinal],
        dateStart = json[Constants.offerDateStart],
        dateEnd = json[Constants.offerDateEnd],
        person = json[Constants.offerPerson],
        room = json[Constants.offerRoom];

  Map<String, dynamic> toJson() => {
        Constants.offerId: idOffert,
        Constants.offerIdHotel: idHotel,
        Constants.offerDestiny: destiny,
        Constants.offerWebsite: website,
        Constants.offerPriceNight: priceNight,
        Constants.offerPriceFinal: priceFinal,
        Constants.offerDateStart: dateStart,
        Constants.offerDateEnd: dateEnd,
        Constants.offerPerson: person,
        Constants.offerRoom: room,
      };
}
