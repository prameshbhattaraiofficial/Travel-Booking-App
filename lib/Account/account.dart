import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:profile/profile.dart';
import 'package:smarttourism/Account/contact.dart';
import 'package:smarttourism/Visitors/feedback.dart';
import 'package:smarttourism/admin/Contact.dart';
import 'package:smarttourism/home.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smarttourism/user/Welcomepage.dart';
import 'package:smarttourism/user/booking_travel.dart';
import 'package:smarttourism/user/mylogin.dart';
import 'package:smarttourism/user/register.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:flutter_share/flutter_share.dart';

import 'package:smarttourism/Visitors/feedback.dart';

class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {


  Future<void> Logout() async{
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Mylogin()));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(

         body:
         SingleChildScrollView(
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                elevation: 2.0,
                child:
                Padding(
                  padding: EdgeInsets.all(30),
                  child: Column(
                    children: [
                      Center(
                        child: Stack(
                          children: [
                            Container(
                              width: 130,
                              height: 130,

                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 4,
                                  color: Theme.of(context).scaffoldBackgroundColor
                                ),
                                boxShadow: [BoxShadow(
                                  spreadRadius: 2, blurRadius: 10,
                                  color: Colors.black.withOpacity(0.1),
                                  offset: Offset(0,10)
                                )],
                                shape: BoxShape.circle,

                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage('Assets/pramesh.jpg')
                                )

                              ),

                            ),
                            Positioned(
                              bottom: 0,
                                right: 0,
                                child: Container(
                                  height: 40,
                                  width: 40,

                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.green,

                                  ),
                                  child: Icon(Icons.edit, color: Colors.white,),
                                ))
                          ],
                        ),

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
                          ElevatedButton(onPressed: (){},
                              child:


                                  Text(" Edit Profile")
                                ,style: ButtonStyle(
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          // borderRadius: BorderRadius.circular(18.0),
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
              // Padding(
              //   padding: EdgeInsets.only(left: 10),
              //   child: Text("Skills", style: TextStyle(
              //     fontSize: 20
              //   ),),
              // ),
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
                  onTap: (){

                  },
                ),

              ),
              // Card(
              //   child: ListTile(
              //     leading: new Icon(Icons.favorite_border),
              //    title: Text("Bookmarks"),
              //   ),
              // ),
              Card(
                child: ListTile(
                  leading: new Icon(Icons.settings),
                  title: Text("Account Setting"),
                ),
              ),
              Card(


                child: ListTile(
                  onTap: (){
                    Navigator.push((context), MaterialPageRoute(builder: (context)=> TravelBooking()));
                  }
                  ,
                  leading: new Icon(Icons.book),
                  title: Text("booking"),
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

                  onTap: (){
                    Navigator.push(context,
                        MaterialPageRoute(
                            builder: (context) => Feedbacksystem()));
                  },
                  leading: new Icon(Icons.feedback),
                  title: Text("Feedback"),
                ),
              ),


              Card(
                child: ListTile(

                  onTap: (){
                    Navigator.push(context,
                        MaterialPageRoute(
                            builder: (context) => ContactAdmin()));
                  },
                  leading: new Icon(Icons.contact_phone),
                  title: Text("Contact"),
                ),
              ),
              SizedBox(height: 10,),

              Card(
                child: ListTile(
                  onTap: (){
                    // Navigator.push(context,
                    //     MaterialPageRoute(
                    //         builder: (context) =>
                    //             Registerpage()));

                    Logout();
                    // FirebaseAuth.instance.signOut();
                  },
                  title: Center(child: Text("Logout")),
                ),

              ),
              
              // Padding(
              //   padding: EdgeInsets.only(left: 20),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.end,
              //     children: [
              //
              //
              //       ElevatedButton(onPressed: (){},
              //           child:
              //          Row(
              //            children: [
              //              Icon(Icons.logout),
              //
              //              Text("Logout"),
              //            ],
              //          )
              //
              //       ),
              //     ],
              //   ),
              // )

            ],


           ),
         )
          )
        );


}
}
