import 'package:flutter/material.dart';
import 'package:gotravel/src/core/constants.dart';
import 'package:gotravel/src/pages/search_page.dart';
import 'package:gotravel/src/theme/my_colors.dart';
import 'package:gotravel/src/pages/list_hotel.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool location = false;
  bool nameHotel = false;
  bool starHotel = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.background,
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
              onPressed: () => showSearch(context: context, delegate: Search()),
              icon: const Icon(Icons.search),
              tooltip: Constants.tooltipSearch),
          IconButton(
            onPressed: () =>
                Navigator.pushNamed(context, Constants.routesFilter),
            icon: const Icon(Icons.filter_alt),
            tooltip: Constants.tooltipFilter,
          ),
          PopupMenuButton(
            icon: const Icon(Icons.swap_vert),
            tooltip: Constants.tooltipOrderBy,
            onSelected: (item) => _onSelected(context, item),
            itemBuilder: (context) => [
              const PopupMenuItem(
                child: Text(Constants.menuLocation),
                value: 0,
              ),
              const PopupMenuItem(
                child: Text(Constants.menuHotel),
                value: 1,
              ),
              const PopupMenuItem(
                child: Text(Constants.menuStar),
                value: 2,
              )
            ],
          ),
        ],
      ),
      body: const ListHotel(
        score: 0.0,
        star: 0.0,
        price: 10,
        location: false,
        nameHotel: false,
        starHotel: false,
      ),
    );
  }

  _onSelected(BuildContext context, item) {
    switch (item) {
      case 0:
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const ListHotel(
                      score: 0.0,
                      star: 0.0,
                      price: 10,
                      location: true,
                      nameHotel: false,
                      starHotel: false,
                    )));
        // return location = true;
        break;
      case 1:
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const ListHotel(
                      score: 0.0,
                      star: 0.0,
                      price: 10,
                      location: false,
                      nameHotel: true,
                      starHotel: false,
                    )));
        // return nameHotel = true;
        break;
      case 2:
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const ListHotel(
                      score: 0.0,
                      star: 0.0,
                      price: 10,
                      starHotel: true,
                      nameHotel: false,
                      location: false,
                    )));
        break;
      default:
    }
  }
}
