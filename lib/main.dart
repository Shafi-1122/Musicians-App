// ignore_for_file: sort_child_properties_last, no_leading_underscores_for_local_identifiers, unused_import

import 'dart:math';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';
import 'package:uiforlwearing/services/providers/darkmodeprovider.dart';
import 'package:uiforlwearing/services/providers/storydetailsprovider.dart';
import 'package:uiforlwearing/services/providers/userdetailsprovider.dart';

// import 'package:uiforlwearing/services/darkmodeprovider.dart';
import 'package:uiforlwearing/view/homepage.dart';

import 'view/activitypage.dart';
import 'package:flutter/material.dart';

import 'view/searchpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [ChangeNotifierProvider(
        create: ((context) => DarkModeMOdel()),
       ),
            ChangeNotifierProvider(
        create: ((context) => BioModel()),
       ),  ChangeNotifierProvider(
        create: ((context) => StoryDetails()),
       ),

            ],
            child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home:  MyHomePage(title: "null"))
            )
    ;
  }
}
 