import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class GantiProfil {
  static getData() async {
    var prefs = await SharedPreferences.getInstance();
    var savedData = prefs.getString('Ganti.Profil.Siswa');
    if (savedData == null) {
      savedData = '[]';
    }
    return json.decode(savedData);
  }

  static saveData(data) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setString('Ganti.Profil.Siswa', json.encode(data));
  }
}
