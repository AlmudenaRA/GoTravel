import 'package:flutter/material.dart';
import 'package:gotravel/src/core/constants.dart';
import 'package:gotravel/src/theme/my_colors.dart';
import 'package:gotravel/src/widget/button.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({Key? key}) : super(key: key);

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  DateTime _dateTime = DateTime(2100);
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
                const Text(
                  Constants.date,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: MyColors.textButton,
                  ),
                ),
                Button(
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
                ),
              ]),
        ),
      ),
    );
  }
}
