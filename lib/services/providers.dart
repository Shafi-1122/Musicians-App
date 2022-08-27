import 'package:flutter/material.dart';

class DarkModeMOdel extends ChangeNotifier {
  // bool darkmode=false;
  bool darkmodestatus = false;
  var color = Colors.white;
  var mode = Icon(Icons.dark_mode);
  void toggleDarkmode() {
    darkmodestatus != darkmodestatus;
    if (darkmodestatus == true) {
      color = Colors.grey;
    } else {
      color = Colors.white;
    }
    notifyListeners();
  }

  void darkmodechangestatus() {
    if (darkmodestatus == true) {
      mode = Icon(Icons.light_mode);
    } else {
      mode = Icon(Icons.dark_mode);
    }
    notifyListeners();
  }
}
