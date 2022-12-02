import 'package:flutter/material.dart';

class BioModel extends ChangeNotifier{
  String username='Thomas Jake';
  String bio="All Speaker who wants to get paid please follow me for follow back.bullet lover";
  void changename(String name){
if(name.isNotEmpty)
{
  username=name;
  notifyListeners();
}  }
void changebio(String usersbio){
  if(bio.isNotEmpty){
    bio=usersbio;
    notifyListeners();
  }
}
}