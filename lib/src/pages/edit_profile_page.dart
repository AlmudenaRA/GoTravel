import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gotravel/src/core/constants.dart';
import 'package:gotravel/src/widget/button.dart';
import 'package:gotravel/src/widget/rounded_input_fiel.dart';
import 'package:gotravel/src/models/user_model.dart';
import 'package:gotravel/src/theme/my_colors.dart';
import 'package:image_picker/image_picker.dart';
import 'package:gotravel/src/data/auth_service.dart' as auth_service;
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:gotravel/src/utils/utils.dart' as utils;

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  File? _pickedFile;
  final ImagePicker _picker = ImagePicker();
  XFile? image;
  final _formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  UserModel users = UserModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.background,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              _choosePhoto(),
              RoundedInputField(
                hintText: Constants.textUserName,
                icon: Icons.person,
                onSaved: (val) => users.userName = val,
                initialValue: _auth.currentUser!.displayName,
              ),
              RoundedInputField(
                hintText: Constants.textEmail,
                icon: Icons.email_outlined,
                email: true,
                keyboardType: TextInputType.emailAddress,
                onSaved: (val) => users.email = val,
                initialValue: _auth.currentUser!.email,
              ),
              RoundedInputField(
                hintText: Constants.textPass,
                icon: Icons.lock_outlined,
                updatePass: true,
                onSaved: (val) => users.password = val,
              ),
              Button(
                width: 0.9,
                heigth: 65,
                color: MyColors.secundary,
                text: Constants.buttonUpdateProfile,
                onPressed: () => _onPressed(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //Seleccionar una imagen de la galería o cámara, según reciba por parámetro
  _pickImage(ImageSource source) async {
    image = await _picker.pickImage(source: source, imageQuality: 10);
    setState(() {
      if (image != null) {
        _pickedFile = File(image!.path);
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
              backgroundImage: _pickedFile != null
                  ? FileImage(_pickedFile!) as ImageProvider
                  : _auth.currentUser!.photoURL != null
                      ? NetworkImage('${_auth.currentUser!.photoURL}')
                      : const NetworkImage(Constants.defaultImage),
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

  _onPressed() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState!.save();

    updateUser();
  }

  Future<void> updateUser() async {
    utils.showLoadingIndicator(context, Constants.load, Constants.loadSingUp);
    try {
      if (_auth.currentUser!.displayName != users.userName ||
          _auth.currentUser!.email != users.email ||
          users.password!.isNotEmpty) {
        if (image != null) {
          imagenStorage();
        } else {
          await auth_service.updateProfile(context, users);
        }
      } else if (image != null) {
        imagenStorage();
      } else {
        utils.hideLoadingIndicator(context);
        utils.showAlertDialog(
            context, Constants.textInfo, Constants.someChange);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'requires-recent-login') {
        utils.hideLoadingIndicator(context);
        utils.showAlertDialog(context, Constants.error, Constants.recentLogin);
      }
    }
  }

  imagenStorage() {
    firebase_storage.FirebaseStorage.instance
        .ref("images/user/${_auth.currentUser!.uid}.jpg")
        .putFile(File(image!.path))
        .whenComplete(() => {
              downImageStorage(),
            });
  }

  ///Se descarga la url de firebaseStorage
  downImageStorage() async {
    String url = await firebase_storage.FirebaseStorage.instance
        .ref("images/user/${_auth.currentUser!.uid}.jpg")
        .getDownloadURL();
    users.avatar = url;
    await auth_service.updateProfile(context, users);
  }
}
