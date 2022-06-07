import 'package:flutter/material.dart';
import 'package:gotravel/src/core/constants.dart';
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
  double _value = 10;
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
              _dateFilter(context),
              const Divider(
                height: 10,
                color: MyColors.textWhite,
                thickness: 1,
              ),
              const SizedBox(
                height: 20,
              ),
              const TextData(
                text: Constants.filterRoom,
                color: MyColors.textWhite,
                fontSize: 15,
              ),
              Button(
                  width: 0.9,
                  heigth: 50,
                  color: MyColors.secundary,
                  text: Constants.selectRoom,
                  onPressed: () =>
                      Navigator.pushNamed(context, Constants.routesRoom)),
              const Divider(
                height: 10,
                color: MyColors.textWhite,
                thickness: 1,
              ),
              const SizedBox(
                height: 20,
              ),
              const TextData(
                text: Constants.priceNight,
                color: MyColors.textWhite,
                fontSize: 15,
              ),
              _slider(_value, 10, 500, 100.0, ' €'),
            ],
          ),
        ),
      ),
    );
  }

  _slider(value, min, max, interval, label) {
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
        value: value,
        min: min,
        max: max,
        showLabels: true,
        labelPlacement: LabelPlacement.onTicks,
        interval: interval,
        labelFormatterCallback: (dynamic actualValue, String formattedText) {
          return ' $formattedText' + label;
        },
        onChanged: (dynamic newValues) {
          setState(() {
            _value = newValues;
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
}
