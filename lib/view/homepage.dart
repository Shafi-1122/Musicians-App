import 'dart:html';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uiforlwearing/model/storymodel.dart';
import 'package:uiforlwearing/services/apiconnection.dart';

// import 'package:uiforlwearing/services/darkmodeprovider.dart';
import 'package:uiforlwearing/services/providers/darkmodeprovider.dart';
import 'package:uiforlwearing/services/providers/storydetailsprovider.dart';
import 'package:uiforlwearing/view/profile.dart';

import 'package:uiforlwearing/view/searchpage.dart';
import 'package:uiforlwearing/view/stories.dart';

import 'activitypage.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  
  @override
  Widget build(BuildContext context) {
    final thecolor = Provider.of<DarkModeMOdel>(context).color;
    var datafromapionview = Provider.of<StoryDetails>(context).datafromapi;
    late String profileimage;

    var theicon = const Icon(Icons.thumb_up);
    final con = TabController(vsync: this, length: 4);
    return SafeArea(
      child: Scaffold(
        backgroundColor: thecolor,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: FloatingActionButton(
            onPressed: () {
          
;            },
            backgroundColor: const Color.fromARGB(255, 243, 219, 1),
            child: const Icon(
              Icons.add,
              color: Colors.black,
            ),
          ),
        ),
        body: TabBarView(controller: con, children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Mucia",
                        style: TextStyle(
                            fontSize: 35, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                          height: 33,
                          width: 33,
                          child: Image(image: AssetImage('camera2.png')))
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Text(
                      "Stories",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:5.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height/6,
                      child:   FutureBuilder<List<Welcome>>(
                        future: datafromapionview,
                        builder: (context, snapshot) {
                         
                          if(snapshot.hasData){
                            
                            return ListView.builder(
                            
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                               profileimage=snapshot.data![index].profileImage.toString();
                               if(snapshot.data![index].profileImage==null){
                            profileimage='https://img.freepik.com/premium-vector/male-avatar-icon-unknown-anonymous-person-default-avatar-profile-icon-social-media-user-business-man-man-profile-silhouette-isolated-white-background-vector-illustration_735449-120.jpg?w=740';
                          }
                             
                              return Padding(
                                padding: const EdgeInsets.only(left:6,right: 6),
                                child: 
                                    GestureDetector(
                                      onTap: (){
                                        Provider.of<StoryDetails>(context,
                                                listen: false)
                                            .indexTaker(index);

                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Storiespage(index)));
                                      },
                                      child: Container(
                                        child: Stack(alignment: AlignmentDirectional.bottomStart,
                                        children: [ Padding(
                                                                  padding: const EdgeInsets.all(12.0),
                                                                  child: Text(
                                                                    '${snapshot.data![index].name}',
                                                                    maxLines: 1,
                                                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.white),
                                                                  ),
                                                                ),],),
                                      height: 160,
                                      width: 110,
                                      decoration: BoxDecoration(
                                          image:  DecorationImage(
                                              image: NetworkImage(profileimage),
                                              fit: BoxFit.cover),
                                          borderRadius: BorderRadius.circular(20),
                                          color: Colors.green),
                                                                      ),
                                    ),
                                    
                                  
                                );
                              
                            },
                          );
                          }
                          else{
                            return LinearProgressIndicator();
                          }
                        
                      },
                       
                      )
                        
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 12.0),
                    child: Text(
                      "Feed",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 500,
                                childAspectRatio: 3 / 2,
                                crossAxisSpacing: 5,
                                mainAxisSpacing: 5),
                        itemCount: 5,
                        itemBuilder: (BuildContext ctx, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                                height: MediaQuery.of(context).size.height / 3,
                                width: MediaQuery.of(context).size.height / 2.5,
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: thecolor,
                                        blurRadius: 20.0,
                                        spreadRadius: 2.0,
                                      ),
                                    ],
                                    color: thecolor,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(18))),
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(7),
                                              color: Colors.white,
                                              image: const DecorationImage(
                                                fit: BoxFit.fill,
                                                image: AssetImage('feed1.jpg'),
                                              ),
                                            ),
                                            height: 120,
                                            width: 100,
                                          ),
                                          const Spacer(),
                                          SizedBox(
                                            child: Column(
                                              children: [
                                                const Text(
                                                  'Isai Aruvi',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w800),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 13.0),
                                                  child: theicon,
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      const Padding(
                                          padding: EdgeInsets.only(
                                              top: 10.0, bottom: 10),
                                          child: AutoSizeText(
                                              'One of my fav music and musician . Started listening from my childhood . the name is AR Rahman. Show me your likes on hime through the likes ')),
                                    ],
                                  ),
                                )),
                          );
                        }),
                  ),
                ],
              ),
            ),
          ),
          const SearchPage(title: 'searchpage'),
          const ActivityPage(title: 'activitypage'),
          const Profile(title: 'homepage')
        ]),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: thecolor,
          ),
          child: TabBar(
            controller: con,
            indicatorColor: const Color.fromARGB(255, 146, 132, 0),
            overlayColor: MaterialStateProperty.all(
              Colors.white,
            ),
            labelStyle: const TextStyle(
              fontSize: 0,
            ),
            labelColor: Colors.white,
            unselectedLabelStyle: const TextStyle(
              fontSize: 11,
            ),
            tabs: const [
              Tab(
                child: SizedBox(
                    height: 25,
                    width: 25,
                    child: Image(
                      image: AssetImage('assets/hut.png'),
                      fit: BoxFit.fill,
                    )),
              ),
              Tab(
                  child: SizedBox(
                height: 29,
                width: 29,
                child: Image(
                  image: AssetImage('assets/search.png'),
                  fit: BoxFit.fill,
                ),
              )),
              Tab(
                child: SizedBox(
                    height: 31,
                    width: 31,
                    child: Image(
                      image: AssetImage('assets/activity(1).png'),
                      fit: BoxFit.fill,
                    )),
              ),
              Tab(
                child: SizedBox(
                    height: 29,
                    width: 29,
                    child: Image(
                      image: AssetImage('assets/profile.png'),
                      fit: BoxFit.fill,
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
