import 'package:flutter/material.dart';


class AboutUs extends StatefulWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [

                SizedBox(height: 50,),

                Text("ABOUT US ", style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 30, color: Colors.blue

                ),),
                SizedBox(height: 10,),

                Text("The Smart Tourism System project is a mobile application that is highly effective and userfriendly. This is used to locate information about the tourist destination the user wishes to visit."
                  "Most of the time, tourism is active, and a smart tourism system would be essential to organizing"
                 " the ideal trip. The major goal is to assist travel agencies in managing guests, hotels, etc."
                  "Additionally, numerous studies have been done on how to improve the effectiveness of the"
                  "information in tourism apps. This study aims to establish a useful concept for a tourist-friendly"
                  "place and to serve as a standard for destinations that use this concept."
                  ");"
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
