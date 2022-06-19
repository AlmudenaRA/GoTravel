import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gotravel/src/core/constants.dart';
import 'package:gotravel/src/pages/list_hotel.dart';
import 'package:gotravel/src/theme/my_colors.dart';
import 'package:gotravel/src/widget/button.dart';
import 'package:gotravel/src/widget/text_data.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:syncfusion_flutter_core/theme.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({Key? key}) : super(key: key);

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  double valuePrice = 10;
  double score = 0.0;
  double star = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.background,
        title: const Text(Constants.txtFilter),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(left: 15, top: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const TextData(
                text: Constants.filterDate,
                color: MyColors.textButton,
                fontSize: 15,
              ),
              const SizedBox(
                height: 20,
              ),
              _dateFilter(context),
              _space(),
              const TextData(
                text: Constants.filterRoom,
                color: MyColors.textButton,
                fontSize: 15,
              ),
              const SizedBox(
                height: 20,
              ),
              Button(
                  width: 0.9,
                  heigth: 50,
                  color: MyColors.secundary,
                  text: Constants.selectRoom,
                  onPressed: () =>
                      Navigator.pushNamed(context, Constants.routesRoom)),
              _space(),
              const TextData(
                text: Constants.priceNight,
                color: MyColors.textButton,
                fontSize: 15,
              ),
              _sliderPrice(),
              _space(),
              const TextData(
                text: Constants.hotelCateg,
                color: MyColors.textButton,
                fontSize: 15,
              ),
              _starHotel(),
              _space(),
              const TextData(
                text: Constants.assessment,
                color: MyColors.textButton,
                fontSize: 15,
              ),
              _ratingBarVote(),
              _space(),
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: 3),
                  child: Row(
                    children: [
                      Button(
                        width: 0.45,
                        heigth: 50,
                        color: MyColors.red,
                        text: Constants.buttonCancel,
                        onPressed: () => Navigator.pop(context),
                      ),
                      Button(
                        width: 0.45,
                        heigth: 50,
                        color: MyColors.secundary,
                        text: Constants.btnFilter,
                        onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ListHotel(
                                      score: score,
                                      star: star,
                                      price: valuePrice,
                                    ))),
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }

  _space() {
    return Column(
      children: const [
        SizedBox(
          height: 20,
        ),
        Divider(
          height: 10,
          color: MyColors.textWhite,
          thickness: 1,
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }

  _starHotel() {
    return Container(
      margin: const EdgeInsets.only(left: 40, top: 20),
      child: RatingBar.builder(
        initialRating: star,
        direction: Axis.horizontal,
        allowHalfRating: true,
        itemCount: 5,
        unratedColor: MyColors.textWhite,
        itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
        itemBuilder: (context, _) => const Icon(
          Icons.star,
          color: MyColors.secundary,
        ),
        onRatingUpdate: (rating) {
          star = rating;
        },
      ),
    );
  }

  _sliderPrice() {
    return SfSliderTheme(
      data: SfSliderThemeData(
        thumbColor: MyColors.secundary,
        activeTrackColor: MyColors.secundary,
        thumbRadius: 10,
        inactiveTrackColor: MyColors.secundaryLig,
        activeLabelStyle:
            const TextStyle(color: MyColors.textWhite, fontSize: 12),
        inactiveLabelStyle: const TextStyle(
          color: MyColors.textWhite,
          fontSize: 12,
        ),
      ),
      child: SfSlider(
        value: valuePrice,
        min: 10,
        max: 500,
        showLabels: true,
        labelPlacement: LabelPlacement.onTicks,
        interval: 100.0,
        labelFormatterCallback: (dynamic actualValue, String formattedText) {
          return ' $formattedText €';
        },
        onChanged: (dynamic newValues) {
          setState(() {
            valuePrice = newValues;
          });
        },
      ),
    );
  }

  _ratingBarVote() {
    return Container(
        margin: const EdgeInsets.only(left: 40, top: 20),
        child: RatingBar.builder(
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
            score = rating;
            setState(() {});
          },
        ));
  }

  Button _dateFilter(BuildContext context) {
    return Button(
      width: 0.9,
      heigth: 50,
      color: MyColors.secundary,
      text: Constants.selectDate,
      onPressed: () => showDateRangePicker(
          context: context,
          firstDate: DateTime.now(),
          lastDate: DateTime(2025),
          helpText: Constants.txtSelectDate,
          fieldStartHintText: Constants.hintStartDate,
          fieldEndHintText: Constants.hintEndDate,
          fieldStartLabelText: Constants.hintStartDate,
          fieldEndLabelText: Constants.hintEndDate,
          locale: const Locale('es', 'ES'),
          builder: (context, child) => Theme(
              data: ThemeData().copyWith(
                colorScheme: const ColorScheme.light(
                    primary: MyColors.secundary,
                    onPrimary: MyColors.textButton,
                    surface: MyColors.secundary),
              ),
              child: child!)),
    );
  }
}
