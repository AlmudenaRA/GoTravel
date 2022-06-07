import 'package:flutter/material.dart';
import 'package:gotravel/src/core/constants.dart';
import 'package:gotravel/src/theme/my_colors.dart';
import 'package:gotravel/src/widget/buttons_minus_plus.dart';
import 'package:gotravel/src/widget/panel_rooms.dart';
import 'package:gotravel/src/widget/text_data.dart';
import 'package:gotravel/src/widget/text_field_container.dart';

class RoomsPage extends StatefulWidget {
  const RoomsPage({Key? key}) : super(key: key);

  @override
  State<RoomsPage> createState() => _RoomsPageState();
}

class _RoomsPageState extends State<RoomsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.background,
        title: const Text(Constants.rooms),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(left: 15, top: 20),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextFieldContainer(
                    borderRadius: 15,
                    margin: 20,
                    paddingVert: 5,
                    paddingHoriz: 20,
                    width: 0.8,
                    height: 60,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        TextData(
                          text: Constants.rooms,
                          color: MyColors.textWhite,
                          fontSize: 15,
                        ),
                        MinusPlusButtons(),
                      ],
                    ),
                  ),
                  const PanelRooms(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
