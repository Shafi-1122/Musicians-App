import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:uiforlwearing/services/providers.dart';

import 'package:uiforlwearing/view/searchpage.dart';

import 'activitypage.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  // final _controller=PersistentTabController();
  // List<Widget> screens=[MyHomePage1(title: "null"),MyHomePage2(title: "null")];
// @override
// void initState() {
//     // TODO: implement initState
//     super.initState();
//         WidgetsBinding.instance.addPostFrameCallback();

//   }
  @override
  Widget build(BuildContext context) {
    var thecolor = Provider.of<DarkModeMOdel>(context).color;
    TabController _tabController = TabController(length: 2, vsync: this);
    return SafeArea(
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(onPressed: (){
    
    
        },child: Icon(Icons.add),backgroundColor: Colors.pinkAccent,),
       
        backgroundColor: thecolor,
        bottomNavigationBar:Padding(
          padding:  EdgeInsets.only(left:23,right: 23,bottom: 8),
          child: Row(
         
            children:  [  SizedBox(
                          height: 29,
                          width: 29,
                          child: Image(
                            image: AssetImage('assets/hut.png'),
                            fit: BoxFit.fill,
                          )),  Padding(
                            padding: EdgeInsets.only(left:63,right:15),
                            child: SizedBox(
                        height: 29,
                        width: 29,
                        child: GestureDetector(
                          onTap: () {
                            
      Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SearchPage(title: "null")),
      );
    
                          },
                          child: Image(
                              image: AssetImage('assets/search.png'),
                              fit: BoxFit.fill,
                          ),
                        )),
                          ),
                          Spacer(),
                        Padding(
                          padding: EdgeInsets.only(right:63,left: 15),
                          child: GestureDetector(
                            onTap: () {
                               Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ActivityPage(title: "null")),
      );
                            },
                            child: SizedBox(
                            height: 31,
                            width: 31,
                            child: Image(
                              image: AssetImage('assets/activity(1).png'),
                              fit: BoxFit.fill,
                            )),
                          ),
                        ),
                        SizedBox(
                        height: 29,
                        width: 29,
                        child: Image(
                          image: AssetImage('assets/profile.png'),
                          fit: BoxFit.fill,
                        ))
                        
                        
                        ],),
        ),
        body: Padding(
          padding: const EdgeInsets.all(19.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text(
                      "Profile",
                      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
               
               
                   const Spacer(),
                    
     Consumer<DarkModeMOdel>(builder: (context, themode, child) {
                        return IconButton(
                          color: Colors.greenAccent,
                          iconSize: 25,
                            onPressed: () {
                                 themode.toggleDarkmode();
                              themode.darkmodechangestatus();
                           
                            },
                           icon: themode.mode);
                      }),
    
                    SizedBox(
                        height: 33,
                        width: 33,
                        child: Image(
                          image: AssetImage('assets/setting.png'),
                          fit: BoxFit.fill,
                        ))
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 22.0),
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                              'assets/prof4.jpg',
                            ),
                            fit: BoxFit.fill),
                        borderRadius: BorderRadius.circular(80),
                       ),
                    height: 90,
                    width: 90,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: SizedBox(
                      height: 40,
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        children: [
                          Column(
                            children: const [
                              Text("Thomas Jake",
                                  style: TextStyle(
                                      fontSize: 18, fontWeight: FontWeight.bold)),
                              Padding(
                                padding: EdgeInsets.only(top: 2.0, right: 18),
                                child: Text(
                                  "@jake-thomas12345",
                                  style: TextStyle(fontSize: 8),
                                ),
                              )
                            ],
                          ),
                          Spacer(),
                          ElevatedButton(
                            style:  ElevatedButton.styleFrom(
                              primary:Colors.white,
            side: BorderSide(
              width: 2.0,
              color: Colors.black,
            ),
          ),
                              // ButtonStyle(
                              //   side: 
                              //   // backgroundColor:
                              //   //     MaterialStateProperty.all(Colors.transparent),
                              // ),
                              onPressed: () {},
                              child: Center(
                                child: Text(
                                  'Edit profile',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500),
                                ),
                              )),
                          Icon(Icons.more_vert)
                        ],
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Row(
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(right: 3.0),
                        child: Text(
                          "873K",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text("Followers"),
                      Padding(
                        padding: EdgeInsets.only(left: 8, right: 3),
                        child: Text(
                          "640",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text("Following")
                    ],
                  ),
                ),
                const Divider(
                  color: Colors.black,
                  thickness: 1,
                ),
                const Text(
                  "All Speaker who wants to get paid please follow me for follow back.bullet lover",
                  style: TextStyle(fontSize: 10),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 13.0),
                  child: Row(
                    children: [
                      const Text("Follow me on :"),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: SizedBox(
                            height: 21.8,
                            width: 21.8,
                            child: Image.asset(
                              'assets/twitter2.png',
                              fit: BoxFit.fill,
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: SizedBox(
                            height: 25,
                            width: 25,
                            child: Image.asset(
                              'assets/instagram2.png',
                              fit: BoxFit.fill,
                            )),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top:25.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 40,
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
                            "Posted audios",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        Tab(
                          child: Text(
                            "Playlist",
                            style: TextStyle(color: Colors.black),
                          ),
                        )
                      ],
                      controller: _tabController,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top:12.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height ,
                    child: TabBarView(controller: _tabController, children: [
                      SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                             width: MediaQuery.of(context).size.width,
                                      height: MediaQuery.of(context).size.height/4,
                              child: ListView.builder(
                                // physics: const NeverScrollableScrollPhysics(),
                                  itemCount: 5,
                                  itemBuilder: (BuildContext context, int index) {
                                    return ListTile(
                                      leading: Container(
                                        // color: Colors.black,
                                        width: 35,
                                        height: 35,
                                        decoration: const BoxDecoration(
                                          borderRadius:
                                              BorderRadius.all(Radius.circular(6)),
                                          image: DecorationImage(
                                            fit: BoxFit.fill,
                                            image: AssetImage("assets/prof2.jpg"),
                                          ),
                                        ),
                                      ),
                                      trailing: Icon(
                                        Icons.more_horiz,
                                        color: Colors.black,
                                      ),
                                      title: Text("Faded"),
                                      subtitle: Text("Alan Walker"),
                                    );
                                  }),
                            ),
                      Padding(
                        padding: const EdgeInsets.only(top:12,bottom: 12),
                        child: Text("Yesterday",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 19),),
                      ),
                      
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                                      height: MediaQuery.of(context).size.height/4 ,
                              child: ListView.builder(
                                 physics: NeverScrollableScrollPhysics(),
                                    itemCount: 3,
                                    itemBuilder: (BuildContext context, int index) {
                                      return ListTile(
                                        leading: Container(
                                          // color: Colors.black,
                                          width: 35,
                                          height: 35,
                                          decoration: const BoxDecoration(
                                            borderRadius:
                                                BorderRadius.all(Radius.circular(6)),
                                            image: DecorationImage(
                                              fit: BoxFit.fill,
                                              image: AssetImage("assets/prof2.jpg"),
                                            ),
                                          ),
                                        ),
                                        trailing: Icon(
                                          Icons.more_horiz,
                                          color: Colors.black,
                                        ),
                                        title: Text("Faded"),
                                        subtitle: Text("Alan Walker"),
                                      );
                                    }),
                            )
                          ],
                        ),
                      ),
                      ListView.builder(
                          itemCount: 10,
                          itemBuilder: (BuildContext context, int index) {
                            return ListTile(
                                leading: Container(
                                  // color: Colors.black,
                                  width: 35,
                                  height: 35,
                                  decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: AssetImage("assets/prof1.jpg"),
                                    ),
                                  ),
                                ),
                                trailing: Icon(
                                  Icons.more_horiz,
                                  color: Colors.black,
                                ),
                                title: Text("Closer"),
                                subtitle: Text('Chain Smokers'),);
                          }),
                    ]),
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


