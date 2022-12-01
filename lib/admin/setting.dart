import 'package:flutter/material.dart';
import 'package:smarttourism/admin/Adding_Travel.dart';
import 'package:smarttourism/admin/Analysis.dart';
import 'package:smarttourism/admin/Dashboard.dart';
import 'package:smarttourism/admin/Hotelbooking.dart';
import 'package:smarttourism/admin/customers.dart';
import 'package:smarttourism/admin/messages.dart';
import 'package:smarttourism/user/Welcomepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:smarttourism/user/mylogin.dart';


class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {


  Future<void> Logout() async{
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Mylogin()));
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),

      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.only(top: 50),
          children: [

            ListTile(
              leading: Icon(
                Icons.home,
              ),
              title: const Text('Home'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> Dashboard()));
              },
            ),
            // ListTile(
            //   leading: Icon(
            //     Icons.people,
            //   ),
            //   title: const Text('Customer'),
            //   onTap: () {
            //     Navigator.push(context, MaterialPageRoute(builder: (context)=> CustomerAdmin()));
            //   },
            // ),

            ListTile(
              leading: Icon(
                Icons.message,
              ),
              title: const Text('Messages'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> Messages()));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.analytics,
              ),
              title: const Text('Analysis'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> Analysis()));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.book,
              ),
              title: const Text('Hotel Booking'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> Hotelbooking()));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.place,
              ),
              title: const Text('Adding Places'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> Adding_Travel()));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.settings,
              ),
              title: const Text('Settings'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> Setting()));
              },
            ),
            SizedBox(height: 300,),
            ListTile(


              leading: Icon(
                Icons.logout,
              ),
              title: const Text('Logout'),
              onTap: () {
               Logout();
              },
            ),

          ],
        ),
      ),
      body: Center(
        child: ListView(
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


                    Text("I Live in Kapan. I love Travel.I have visited many country and Places .", style: TextStyle(
                        fontWeight: FontWeight.bold
                    ),),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(onPressed: (){


                        },
                            child:


                            Text(" Edit Profile")
                            ,style: ButtonStyle(
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(

                                        side: BorderSide(color: Colors.blue)
                                    )
                                )
                            )

                        ),


                        // ElevatedButton(onPressed: (){},
                        //     child:
                        //
                        //
                        //     Text("20k Following")
                        //     ,style: ButtonStyle(
                        //         shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        //             RoundedRectangleBorder(
                        //                 borderRadius: BorderRadius.circular(18.0),
                        //                 side: BorderSide(color: Colors.blue)
                        //             )
                        //         )
                        //     )
                        //
                        // ),
                      ],
                    )
                  ],

                ),
              ),
            ),

            Card(
              child: ListTile(
                leading: new Icon(Icons.mail),
                title: Text("Mail Inbox"),
              ),
            ),

            Card(
              child: ListTile(
                leading: new Icon(Icons.person),
                title: Text(
                    "Friends"
                ),
              ),
            ),
            Card(
              child: ListTile(
                leading: new Icon(Icons.share),
                title: Text(
                    " Invites"
                ),
              ),
            ),
            Card(
              child: ListTile(
                leading: new Icon(Icons.favorite_border),
                title: Text("Bookmarks"),
              ),
            ),
            Card(
              child: ListTile(
                leading: new Icon(Icons.settings),
                title: Text("Account Setting"),
              ),
            ),
            Card(
              child: ListTile(
                leading: new Icon(Icons.notifications),
                title: Text("Notification"),
              ),
            ),

            Card(
              child: ListTile(

                title: Center(child: Text("Log out",style: TextStyle(
                  fontWeight: FontWeight.bold
                ),)),
              ),
            ),


            ]

        ),
      ),
    );
  }
}