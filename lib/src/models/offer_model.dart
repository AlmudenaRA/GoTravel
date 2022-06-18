import 'package:gotravel/src/core/constants.dart';
import 'package:gotravel/src/models/hotel_model.dart';

class OfferModel {
  String? idOffer;
  String? idHotel;
  String? website;
  String? urlPage;
  double? priceNight;
  double? priceFinal;
  DateTime? dateStart;
  DateTime? dateEnd;
  int? person;
  int? room;
  List<HotelModel>? listHotel;

  OfferModel(
      {this.idOffer,
      this.idHotel,
      this.website,
      this.urlPage,
      this.priceNight,
      this.priceFinal,
      this.dateStart,
      this.dateEnd,
      this.person,
      this.room,
      this.listHotel});

  OfferModel.fromJson(Map<String, dynamic> json)
      : idOffer = json[Constants.offerId],
        idHotel = json[Constants.offerIdHotel],
        website = json[Constants.offerWebsite],
        urlPage = json[Constants.offUrlPage],
        priceNight = double.tryParse(json[Constants.offerPriceNight]);
  // priceFinal = json[Constants.offerPriceFinal],
  // dateStart = json[Constants.offerDateStart],
  // dateEnd = json[Constants.offerDateEnd],
  // person = json[Constants.offerPerson],
  // room = json[Constants.offerRoom],
  // listHotel = json[Constants.offerListHotel].cast<String>();

  Map<String, dynamic> toJson() => {
        Constants.offerId: idOffer,
        Constants.offerIdHotel: idHotel,
        Constants.offerWebsite: website,
        Constants.offUrlPage: urlPage,
        Constants.offerPriceNight: priceNight,
        // Constants.offerPriceFinal: priceFinal,
        // Constants.offerDateStart: dateStart,
        // Constants.offerDateEnd: dateEnd,
        // Constants.offerPerson: person,
        // Constants.offerRoom: room,
        // Constants.offerListHotel: listHotel,
      };
}
