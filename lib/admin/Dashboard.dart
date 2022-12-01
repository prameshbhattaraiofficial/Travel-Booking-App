import 'package:flutter/material.dart';
import 'package:smarttourism/admin/Adding_Travel.dart';
import 'package:smarttourism/admin/Analysis.dart';
import 'package:smarttourism/admin/Hotelbooking.dart';
import 'package:smarttourism/admin/customers.dart';
import 'package:smarttourism/admin/messages.dart';
import 'package:smarttourism/admin/setting.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:smarttourism/user/Welcomepage.dart';
import 'package:smarttourism/user/mylogin.dart';

import 'package:firebase_auth/firebase_auth.dart';


class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {



  Future<void> Logout() async{
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Mylogin()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Admin Login")),
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
                // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Mylogin()));
                // Navigator.push(context, MaterialPageRoute(builder: (context)=> Welcomepage()));
              },
            ),

          ],
        ),
      ),
      body: Scaffold(
        body: DashBoards(),
      )
    );
  }
  }


  // Signout() async{
  // await auth.signOut();
  // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Mylogin()))
  // }


  class DashBoards extends StatefulWidget {
    const DashBoards({Key? key}) : super(key: key);

    @override
    State<DashBoards> createState() => _DashBoardsState();
  }

  class _DashBoardsState extends State<DashBoards> {


    List<String> entries = <String>[
      'Assets/1.png',
      'Assets/2.jpg',
      'Assets/3.jpg',
      'Assets/4.jpg',
      'Assets/5.png',
      'Assets/6.jpg',
      'Assets/7.jpg',
      'Assets/8.jpg',
      'Assets/9.jpg',
      'Assets/10.png',
      'Assets/11.jpg',
      'Assets/12.jpg',
      'Assets/13.jpg',
      'Assets/14.jpg',
      'Assets/15.jpg',

    ];
    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: SafeArea(
            child: Column(
              children: [

                Text("This page is in processing"),
                Expanded(
                    child:  ListView.builder(
                        padding: const EdgeInsets.all(5),
                        scrollDirection: Axis.vertical,
                        itemCount: entries.length,
                        itemBuilder: (BuildContext context, int index) {
                          return    Container(

                            margin: const EdgeInsets.only(right: 20, bottom: 20),
                            width: 200,
                            height: 300,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                                image: DecorationImage(
                                    image: AssetImage(
                                      'Assets/1.png',

                                    ),
                                    fit: BoxFit.fill

                                )
                            ),

                          );//_rows(entries[index], placename[index]);
                        }

                    )),
              ],
            ),
          ),
        ),
      );
    }
  }

