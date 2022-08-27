import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uiforlwearing/services/providers.dart';

import 'homepage.dart';
import 'activitypage.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<SearchPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<SearchPage> with TickerProviderStateMixin {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    final thecolor = Provider.of<DarkModeMOdel>(context).color;

    TabController _tabController = TabController(length: 2, vsync: this);
    return SafeArea(
      child: Scaffold(
        backgroundColor: thecolor,
        body: Padding(
          padding: const EdgeInsets.only(top:10.0,left: 12,right:12),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 12.0, bottom: 12),
                  child: Row(
                    children: [
                      Text(
                        "Library",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                      ),
                      Spacer(),
                       SizedBox(
                        height: 25,
                        width: 25,
                        child: Image(
                          image: AssetImage('assets/search.png'),
                          fit: BoxFit.fill,
                        ))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top:12.0),
                  child: Container(
                    child: TabBar(
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          8.0,
                        ),
                        color: Color.fromARGB(255, 243, 219, 1),
                      ),
                      labelColor: Colors.white,
                      tabs: const [
                        Tab(
                          child: Text(
                            "SAVED AUDIOS",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        Tab(
                          child: Text(
                            "PLAYLIST",
                            style: TextStyle(color: Colors.black),
                          ),
                        )
                      ],
                      controller: _tabController,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top:15.0),
                  child: Text("Saved Audios",style: TextStyle(fontWeight: FontWeight.bold),),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: TabBarView(controller: _tabController, children: [
                    ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 3,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            leading: Container(
                              // color: Colors.black,
                              width: 25,
                              height: 25,
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(6)),
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage('assets/aw.jpg'),
                                ),
                              ),
                            ),
                            trailing: Icon(
                              Icons.more_horiz,
                              color: Colors.black,
                            ),
                            title: Text("Lilly"),
                            subtitle: Text("Alan Walker"),
                          );
                        }),
                    ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 3,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                              leading: Container(
                                // color: Colors.black,
                                width: 25,
                                height: 25,
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage('assets/aw.jpg'),
                                  ),
                                ),
                              ),
                              trailing: Icon(
                                Icons.more_horiz,
                                color: Colors.black,
                              ),
                              title: Text("Jimmy carter"));
                        }),
                  ]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
