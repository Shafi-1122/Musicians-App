import 'package:flutter/material.dart';
import 'package:uiforlwearing/model/storymodel.dart';
import 'package:uiforlwearing/services/apiconnection.dart';

class StoryDetails extends ChangeNotifier {
  FetchDataClass welcome = FetchDataClass();
  late Future<List<Welcome>> datafromapi = welcome.fetchDataFromApi();

  late int currentuser;
  void indexTaker(index) {
    currentuser = index;
    notifyListeners();
    // print(currentuser);
  }

  void updateUserDetails() {
    currentuser++;

    notifyListeners();
  }
}
