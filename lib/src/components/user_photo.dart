import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gotravel/constants.dart';
import 'package:gotravel/src/theme/my_colors.dart';
import 'package:image_picker/image_picker.dart';

class UserPhoto extends StatelessWidget {
  final File? pickedFile;
  const UserPhoto({Key? key, required this.pickedFile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
          child: CircleAvatar(
            radius: 70,
            backgroundColor: MyColors.secundary,
            child: CircleAvatar(
              radius: 68,
              backgroundColor: MyColors.background,
              backgroundImage:
                  // ignore: unnecessary_null_comparison
                  pickedFile == null ? null : FileImage(pickedFile!),
            ),
          ),
        ),
        Positioned(
            top: 120,
            left: 110,
            child: RawMaterialButton(
              elevation: 10,
              fillColor: MyColors.secundary,
              child: const Icon(
                Icons.add_a_photo_outlined,
                color: MyColors.textButton,
              ),
              padding: const EdgeInsets.all(15.0),
              shape: const CircleBorder(),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text(Constants.textOptionPhoto),
                        titleTextStyle: const TextStyle(
                            fontWeight: FontWeight.w600,
                            color: MyColors.secundaryLig,
                            fontSize: 18),
                        content: SingleChildScrollView(
                          child: ListBody(children: [
                            InkWell(
                              onTap: () {
                                //_pickImage(ImageSource.camera);
                              },
                              splashColor: MyColors.secundaryLig,
                              child: Row(children: const [
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.camera_alt_outlined,
                                    color: MyColors.secundaryLig,
                                  ),
                                ),
                                Text(
                                  Constants.textCamera,
                                )
                              ]),
                            ),
                            InkWell(
                              onTap: () {
                                //_pickImage(ImageSource.gallery);
                              },
                              splashColor: MyColors.secundaryLig,
                              child: Row(children: const [
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.image_outlined,
                                    color: MyColors.secundaryLig,
                                  ),
                                ),
                                Text(
                                  Constants.textGallery,
                                )
                              ]),
                            ),
                          ]),
                        ),
                      );
                    });
              },
            ))
      ],
    );
  }
}
