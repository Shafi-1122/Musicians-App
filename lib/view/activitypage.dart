import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uiforlwearing/services/providers.dart';

class ActivityPage extends StatefulWidget {
  const ActivityPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<ActivityPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<ActivityPage> {
  @override
  Widget build(BuildContext context) {
    final thecolor = Provider.of<DarkModeMOdel>(context).color;

    return SafeArea(
      child: Scaffold(
        backgroundColor: thecolor,
        appBar: AppBar(
          shadowColor: Colors.white,
          backgroundColor: Colors.white,
          title: const Text(
            "Activity",
            style: TextStyle(
                color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "NEW",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 2,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                      itemCount: 15,
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
                                  image: AssetImage('assets/someonesimage.jpg'),
                                ),
                              ),
                            ),
                            trailing: const Text(
                              "1Hr",
                              style:
                                  TextStyle(color: Colors.green, fontSize: 15),
                            ),
                            title: const Text(
                              "3 new Followers for you",
                              style: TextStyle(fontSize: 12),
                            ));
                      }),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 10.0, top: 10),
                  child: Text("EARLIER",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
                ),
                SingleChildScrollView(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height / 2,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                        itemCount: 15,
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
                                  image: AssetImage('assets/prof2.jpg'),
                                ),
                              ),
                            ),
                            trailing: const Text(
                              "1D",
                              style:
                                  TextStyle(color: Colors.green, fontSize: 15),
                            ),
                            subtitle: const Text(
                                "Paster,joshva,carlons started following you"),
                          );
                        }),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
