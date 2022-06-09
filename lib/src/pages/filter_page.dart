import 'package:flutter/material.dart';
import 'package:gotravel/src/core/constants.dart';
import 'package:gotravel/src/theme/my_colors.dart';
import 'package:gotravel/src/widget/button.dart';
import 'package:gotravel/src/widget/button_star.dart';
import 'package:gotravel/src/widget/text_data.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:syncfusion_flutter_core/theme.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({Key? key}) : super(key: key);

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  double _valuePrice = 10;
  double _valueAssessment = 0;
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
                color: MyColors.textWhite,
                fontSize: 15,
              ),
              const SizedBox(
                height: 20,
              ),
              _dateFilter(context),
              _space(),
              const TextData(
                text: Constants.filterRoom,
                color: MyColors.textWhite,
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
                color: MyColors.textWhite,
                fontSize: 15,
              ),
              _sliderPrice(),
              _space(),
              const TextData(
                text: Constants.hotelCateg,
                color: MyColors.textWhite,
                fontSize: 15,
              ),
              const SizedBox(
                height: 20,
              ),
              _starHotel(),
              _space(),
              const TextData(
                text: Constants.assessment,
                color: MyColors.textWhite,
                fontSize: 15,
              ),
              _sliderAssessment(),
              _space(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
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
                    onPressed: () => _onPressed(),
                  ),
                ],
              ),
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        ButtonStar(text: '1'),
        SizedBox(
          width: 20,
        ),
        ButtonStar(text: '2'),
        SizedBox(
          width: 20,
        ),
        ButtonStar(text: '3'),
        SizedBox(
          width: 20,
        ),
        ButtonStar(text: '4'),
        SizedBox(
          width: 20,
        ),
        ButtonStar(text: '5'),
        SizedBox(
          width: 20,
        ),
      ],
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
        value: _valuePrice,
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
            _valuePrice = newValues;
          });
        },
      ),
    );
  }

  _sliderAssessment() {
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
        value: _valueAssessment,
        min: 0,
        max: 10,
        showLabels: true,
        labelPlacement: LabelPlacement.onTicks,
        interval: 2.5,
        labelFormatterCallback: (dynamic actualValue, String formattedText) {
          return ' $formattedText';
        },
        onChanged: (dynamic newValues) {
          setState(() {
            _valueAssessment = newValues;
          });
        },
      ),
    );
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

  _onPressed() {}
}
