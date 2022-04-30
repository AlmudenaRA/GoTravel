import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gotravel/constants.dart';
import 'package:gotravel/src/components/button_text_pop.dart';
import 'package:gotravel/src/components/rounded_button.dart';
import 'package:gotravel/src/components/rounded_input_fiel.dart';
import 'package:gotravel/src/components/rounded_password_field.dart';
import 'package:gotravel/src/theme/my_colors.dart';
import 'package:image_picker/image_picker.dart';

class SingUp extends StatefulWidget {
  const SingUp({Key? key}) : super(key: key);

  @override
  State<SingUp> createState() => _SingUpState();
}

class _SingUpState extends State<SingUp> {
  File? _pickedFile;
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.background,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            _choosePhoto(),
            RoundedInputField(
                hintText: Constants.textUserName,
                icon: Icons.person,
                onChanged: (value) {}),
            RoundedInputField(
              hintText: Constants.textEmail,
              icon: Icons.email_outlined,
              keyboardType: TextInputType.emailAddress,
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              onChanged: (value) {},
            ),
            const RoundedButton(
              text: Constants.buttonSingUp,
              //onPressed: () => _onPressed(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                Text(
                  Constants.singAccount,
                  style: TextStyle(color: MyColors.textWhite),
                ),
                ButtonTextPop(
                  text: Constants.buttonSingIn,
                  color: MyColors.secundaryLig,
                  navigation: Constants.routesLogin,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  //Seleccionar una imagen de la galería o cámara, según reciba por parámetro
  _pickImage(ImageSource source) async {
    final XFile? image = await _picker.pickImage(source: source);
    setState(() {
      if (image != null) {
        _pickedFile = File(image.path);
        Navigator.pop(context);
      }
    });
  }

//Avatar usuario
  _choosePhoto() {
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
                  _pickedFile == null ? null : FileImage(_pickedFile!),
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
                _dialogPhoto();
              },
            ))
      ],
    );
  }

  //abre un dialogo para seleccionar la foto de la galeria o la cámara
  _dialogPhoto() {
    return showDialog(
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
                    _pickImage(ImageSource.camera);
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
                    _pickImage(ImageSource.gallery);
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
  }
}
