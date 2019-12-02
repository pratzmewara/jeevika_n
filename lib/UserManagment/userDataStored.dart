import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesTest{

  Future<bool>  getlogincheck() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final key = 'logincheck';
    bool value = prefs.getBool(key);
    return value;
  }

  setlogincheck(bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final key = 'logincheck';
    prefs.setBool(key, value);
  }

}