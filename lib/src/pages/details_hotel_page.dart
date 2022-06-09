import 'package:flutter/material.dart';
import 'package:gotravel/src/core/constants.dart';
import 'package:gotravel/src/pages/list_review_page.dart';
import 'package:gotravel/src/theme/my_colors.dart';
import 'package:gotravel/src/widget/button_text_icon.dart';
import 'package:gotravel/src/widget/rounded_button.dart';
import 'package:gotravel/src/widget/text_data.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailHotel extends StatefulWidget {
  const DetailHotel({Key? key}) : super(key: key);

  @override
  State<DetailHotel> createState() => _DetailHotelState();
}

class _DetailHotelState extends State<DetailHotel> {
  // List<String> images = [
  //   "https://www.nationalgeographic.com.es/medio/2018/02/27/playa-de-isuntza-lekeitio__1280x720.jpg",
  //   "https://www.xtrafondos.com/descargar.php?id=5846&resolucion=2560x1440",
  //   "https://static.dw.com/image/58845200_303.jpg",
  //   "https://images.pexels.com/photos/1619317/pexels-photo-1619317.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent),
      body: SingleChildScrollView(
          child: Column(
        children: [
          _swiper(),
          const SizedBox(
            height: 20,
          ),
          _dataHotel(),
          const SizedBox(
            height: 20,
          ),
          _description(),
          const SizedBox(
            height: 20,
          ),
          _review(),
          const ListReview(),
          const SizedBox(
            height: 20,
          ),
          _offer(),
        ],
      )),
    );
  }
}

_swiper() {
  return Column(
    children: [
      Image.network(
          "https://www.nationalgeographic.com.es/medio/2018/02/27/playa-de-isuntza-lekeitio__1280x720.jpg"),
    ],
  );
  // return Container(
  //     width: double.infinity,
  //     height: 250.0,
  //     child: Swiper(
  //       itemBuilder: (BuildContext context, int index) {
  //         return Image.network(
  //           images[index],
  //           fit: BoxFit.fill,
  //         );
  //       },
  //       autoplay: true,
  //       itemCount: images.length,
  //       pagination: const SwiperPagination(
  //           builder: DotSwiperPaginationBuilder(
  //               color: MyColors.textButton,
  //               activeColor: MyColors.secundaryDark)),
  //       control: const SwiperControl(color: MyColors.textButton),
  //     ));
}

_dataHotel() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const TextData(
          padding: EdgeInsets.only(left: 20),
          text: "Nombre del hotel",
          color: MyColors.textWhite,
          fontSize: 24,
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Padding(padding: EdgeInsets.only(left: 20)),
            _checkStar(),
            const TextData(
              padding: EdgeInsets.only(left: 20),
              text: "Madrid",
              color: MyColors.textWhite,
              fontSize: 13,
            ),
          ],
        )
      ]),
      IconButton(
          padding: const EdgeInsets.only(right: 30),
          onPressed: () {},
          icon: const Icon(
            Icons.favorite,
            color: MyColors.textWhite,
            size: 30,
          ))
    ],
  );
}

_checkStar() {
  for (int i = 1; i < 3; i++) {
    return const Icon(
      Icons.star,
      color: MyColors.textWhite,
      size: 15,
    );
  }
}

_description() {
  return Column(
    children: [
      Row(children: const [
        TextData(
          padding: EdgeInsets.only(left: 20),
          text: Constants.detDescription,
          color: MyColors.secundary,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ]),
      const SizedBox(
        height: 10,
      ),
      Row(
        children: const [
          Text.rich(TextSpan(children: <InlineSpan>[
            WidgetSpan(
                child: SizedBox(
              width: 335,
              height: 120,
              child: SingleChildScrollView(
                  child: TextData(
                padding: EdgeInsets.only(left: 20),
                text: Constants.description,
                color: MyColors.textWhite,
                fontSize: 13,
                fontWeight: FontWeight.bold,
              )),
            ))
          ]))
        ],
      )
    ],
  );
}

_review() {
  return Column(children: [
    Row(children: const [
      TextData(
        padding: EdgeInsets.only(left: 20),
        text: Constants.detReview,
        color: MyColors.secundary,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    ]),
    const SizedBox(
      height: 10,
    ),
  ]);
}

_offer() {
  return Container(
    width: 450,
    height: 50,
    color: MyColors.pLight,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.start, children: const [
              TextData(
                padding: EdgeInsets.only(top: 10, left: 10),
                text: "150 €",
                color: MyColors.secundaryDark,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.start, children: const [
              TextData(
                padding: EdgeInsets.only(left: 10),
                text: "por noche en...",
                color: MyColors.textWhite,
                fontSize: 10,
              ),
              TextData(
                text: "web",
                color: MyColors.textWhite,
                fontSize: 10,
              )
            ]),
          ],
        ),
        const ButtonTextIcon(
          text: Constants.btnOffer,
          color: MyColors.textButton,
          onPressed: _onPressed,
        ),
      ],
    ),
  );
}

_onPressed() async {
  final Uri _url = Uri.parse(Constants.urlHotel);
  if (!await launchUrl(_url)) throw 'Could not launch $_url';
}
