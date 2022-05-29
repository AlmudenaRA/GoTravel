import 'package:gotravel/src/core/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharePrefs {
  //singleton de las preferencias de usuario
  static final SharePrefs instance = SharePrefs.internal();

  factory SharePrefs() => instance;

  SharePrefs.internal();

  late SharedPreferences prefs;

  initPrefs() async {
    prefs = await SharedPreferences.getInstance();
  }

  get provider => prefs.getString(Constants.provider);

  set provider(dynamic value) => prefs.setString(Constants.provider, value);
}
