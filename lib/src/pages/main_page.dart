import 'package:flutter/material.dart';
import 'package:gotravel/src/core/constants.dart';
import 'package:gotravel/src/theme/my_colors.dart';
import 'package:gotravel/src/pages/list_hotel.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.background,
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
            onPressed: () =>
                Navigator.pushNamed(context, Constants.routesFilter),
            icon: const Icon(Icons.filter_alt),
            tooltip: Constants.tooltipFilter,
          ),
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.swap_vert),
              tooltip: Constants.tooltipOrderBy),
        ],
      ),
      body: const ListHotel(),
    );
  }
}
