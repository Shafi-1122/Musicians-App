import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uiforlwearing/model/storymodel.dart';
import 'package:uiforlwearing/services/providers/storydetailsprovider.dart';

class Storiespage extends StatefulWidget {
  Storiespage(this.index, {super.key});
  int index;
  @override
  State<Storiespage> createState() => _StoriespageState();
}

AssetsAudioPlayer player = AssetsAudioPlayer();

class _StoriespageState extends State<Storiespage> {
  // @override
  // void initState() {

  //   super.initState();
  //    player.open(Audio.file('assets/audio/rolexaudio.mp3')   );
  // }
  @override
  Widget build(BuildContext context) {
    var datafromapionview = Provider.of<StoryDetails>(context).datafromapi;
    int currentuser = Provider.of<StoryDetails>(context).currentuser;

    return GestureDetector(
      onVerticalDragUpdate: ((details) {
        int sensitivity = 8;
        if (details.delta.dy > sensitivity) {
          Navigator.pop(context);
        }
      }),
      child: FutureBuilder<List<Welcome>>(
        future: datafromapionview,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Scaffold(
              body: Stack(children: [
                SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Container(
                       height: MediaQuery.of(context).size.height/2,
                    width: MediaQuery.of(context).size.width,
                    color: Color.fromARGB(255, 146, 132, 0),
                      child: Consumer<StoryDetails>(
                        builder: (context, value, child) {
                          return Image(
                          image: NetworkImage(
                              snapshot.data![currentuser].profileImage.toString()),
                        fit: BoxFit.contain
                        );
                        },
                       
                      ),
                    )),
                Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 10,
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding:
                            const EdgeInsets.only(top: 15.0, left: 8, right: 8),
                        child: Row(
                          children: [
                            Consumer<StoryDetails>(
                              builder: (context, value, child) {
                                return Container(
                                decoration: BoxDecoration(
                                  image:  DecorationImage(
                                      image:  NetworkImage(snapshot.data![currentuser].profileImage.toString()),
                                      fit: BoxFit.fill),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                height: 60,
                                width: 60,
                              );
                              },
                             
                            ),
                             Padding(
                              padding: EdgeInsets.only(left: 10.0, top: 14),
                              child: Consumer<StoryDetails>(
                                builder: (context, value, child) {
                                  return  Text(
                            '${snapshot.data![currentuser].name}',
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                );
                                },
                                
                              ),
                            ),
                            const Spacer(),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.more_vert,
                                  size: 28,
                                  color: Colors.white,
                                ))
                          ],
                        ),
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2,
                      height: MediaQuery.of(context).size.height / 12,
                      child: TextField(
                          decoration: InputDecoration(
                        focusColor: Colors.white,
                        labelText: 'Comment',
                        labelStyle: TextStyle(color: Colors.yellow),
                        border: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.yellow, width: 2),
                            borderRadius: BorderRadius.circular(19)),
                      )),
                    )
                  ],
                ),
                SizedBox(
                   width: MediaQuery.of(context).size.width ,
                      height: MediaQuery.of(context).size.height ,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                        GestureDetector(
                          onTap: () {
                            if (context
                                                  .read<StoryDetails>()
                                                  .currentuser <
                                              snapshot.data!.length - 1) {
                                            Provider.of<StoryDetails>(context,
                                                    listen: false)
                                                .updateUserDetails();
                                          }
                          },
                          child: Container(
                           color: Colors.transparent,
                             width: MediaQuery.of(context).size.width / 2,
                                              height: MediaQuery.of(context).size.height,),
                        )
                      ],),
                )

              ]),
            );
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    player.stop();
  }
}
