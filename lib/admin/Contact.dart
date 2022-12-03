import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactAdmin extends StatefulWidget {
  const ContactAdmin({Key? key}) : super(key: key);

  @override
  State<ContactAdmin> createState() => _ContactAdminState();
}

class _ContactAdminState extends State<ContactAdmin> {


  Future<void> CALL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw "cannot launch $url";
    }
  }



  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: ListView(
            children: [


              Card(
                elevation: 2.0,
                child:
                Padding(
                  padding: EdgeInsets.all(30),
                  child: Column(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage("Assets/pramesh.jpg"),
                        radius: 50.0,
                      ),
                      Text("Pramesh Bhattarai", style: TextStyle(
                          fontFamily: "cursive",
                          fontSize: 20
                      ),),
                      // Text("App Developer", style: TextStyle(
                      //   fontFamily: "ShadowsIntoLight-Regular",
                      //   fontSize: 20
                      // ),),


                      Text("Mail: Prameshbhattaraiofficial@gmail.com", style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 10
                      ),),



                      MaterialButton(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        onPressed: () {
                          CALL("tel:9863439135");
                        },
                        color: Colors.indigo[900],
                        child: Text(
                          "Call",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      )



                    ],

                  ),
                ),
              ),

              Padding(
                padding:  EdgeInsets.only(left: 10),
                child: Text("Social Media ", style: TextStyle(
                    fontFamily: "Regular",
                    fontSize: 20
                ),),
              ),

              Card(
                elevation: 2.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(onPressed: (){
                      launch("https://www.facebook.com/prameshbhattarai2058");
                    },
                        color: Colors.blue,
                        icon: Icon(FontAwesomeIcons.facebook)),
                    IconButton(onPressed: (){
                      launch("https://www.instagram.com/prameshbhattarai2058/");
                    },
                        color: Colors.orange,
                        icon: Icon(FontAwesomeIcons.instagram)),
                    IconButton(onPressed: (){
                      launch("https://www.youtube.com/channel/UCk5idksU3xdXXlAyeUgicYg");
                    },
                        color: Colors.red,
                        icon: Icon(FontAwesomeIcons.youtube)),
                    IconButton(onPressed: (){
                      launch("https://www.linkedin.com/in/mr-pramesh-bhattarai-2696071ab/");
                    },
                        color: Colors.blue,
                        icon: Icon(FontAwesomeIcons.linkedin))
                  ],
                ),
              ),

              SizedBox(height: 20,),
              
              Padding(
                child: Column(
                  children: [
                    
                    Text(" He is studying bachelor at texas college of management and IT. He is a Flutter and Dot Net Developer.")
                  ],
                ),
                  
                  
                  padding:EdgeInsets.only(left: 20, right: 20))
            ],
          ),
        ),
      ),
    );
  }
}
