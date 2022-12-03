import 'package:flutter/material.dart';
import 'package:smarttourism/admin/Adding_Travel.dart';
import 'package:smarttourism/admin/Analysis.dart';
import 'package:smarttourism/admin/Dashboard.dart';
import 'package:smarttourism/admin/Hotelbooking.dart';
import 'package:smarttourism/admin/messages.dart';
import 'package:smarttourism/admin/setting.dart';
import 'package:smarttourism/user/Welcomepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:smarttourism/user/mylogin.dart';

class CustomerAdmin extends StatefulWidget {
  const CustomerAdmin({Key? key}) : super(key: key);
  @override
  State<CustomerAdmin> createState() => _CustomerAdminState();
}
class _CustomerAdminState extends State<CustomerAdmin> {
  Future<void> Logout() async{
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Mylogin()));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                Navigator.push(context, MaterialPageRoute(builder: (context)=> Welcomepage()));
              },
            ),

          ],
        ),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 50,


            ),

            Text("Welcome to Customer Dashboard" ,style: TextStyle(
                fontSize: 20
            ),)
          ],

        ),
      ),
    );
  }
}

