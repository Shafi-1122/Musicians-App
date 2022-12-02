import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uiforlwearing/services/providers/userdetailsprovider.dart';

class Editscreen extends StatelessWidget {
  const Editscreen({super.key});

  @override
  Widget build(BuildContext context) {
    String theusername = Provider.of<BioModel>(context).username;
    String thebio = Provider.of<BioModel>(context).bio;
    final usernamecontroller = TextEditingController();
    final biocontroller = TextEditingController();
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Edit Profile",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                ),
                IconButton(
                  onPressed: (() {
                    Navigator.pop(context);
                  }),
                  icon: Icon(
                    Icons.close,
                    size: 18,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Username',
                style: TextStyle(color: Colors.black),
              ),
            ),
            SizedBox(
              width: 300,
              child: TextField(
                controller: usernamecontroller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: theusername,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Bio',
                style: TextStyle(color: Colors.black),
              ),
            ),
            SizedBox(
              child: TextField(
                controller: biocontroller,
                minLines: 2,
                maxLines: 4,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: thebio,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Consumer<BioModel>(builder: (context, thebio, child) {
                    return SizedBox(
                      height: 38,
                      width: MediaQuery.of(context).size.width/3.5,
                      child: ElevatedButton(
                        
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.yellow,
                            side: const BorderSide(
                              width: 2.0,
                              
                            ),
                          ),
                          onPressed: () {
                            thebio.changename(usernamecontroller.text);
                            thebio.changebio(biocontroller.text);
                          },
                          child: const Center(
                            child: Text(
                              'Save',
                              style: TextStyle(
                                  color: Colors.black, fontWeight: FontWeight.w500),
                            ),
                          )),
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
