import 'package:flutter/material.dart';
import 'package:smarttourism/admin/Adding_Travel.dart';
import 'package:smarttourism/admin/Dashboard.dart';
import 'package:smarttourism/admin/Hotelbooking.dart';
import 'package:smarttourism/admin/customers.dart';
import 'package:smarttourism/admin/messages.dart';
import 'package:smarttourism/admin/setting.dart';
import 'package:smarttourism/user/Welcomepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:smarttourism/user/mylogin.dart';

class Analysis extends StatefulWidget {
  const Analysis({Key? key}) : super(key: key);

  @override
  State<Analysis> createState() => _AnalysisState();
}

class _AnalysisState extends State<Analysis> {


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
                Logout();
                // Navigator.push(context, MaterialPageRoute(builder: (context)=> Welcomepage()));
              },
            ),

          ],
        ),
      ),
      body: Scaffold(
        body: AnalysisAdmin(),
      )
    );
  }
}

class AnalysisAdmin extends StatefulWidget {
  const AnalysisAdmin({Key? key}) : super(key: key);

  @override
  State<AnalysisAdmin> createState() => _AnalysisAdminState();
}

class _AnalysisAdminState extends State<AnalysisAdmin> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Form(
                child: ListView(
                    padding: EdgeInsets.all(18),
                    children: [

                      Text("This page is in processing"),


                      Container(
                        width: MediaQuery.of(context).size.width*0.8,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: TextField(
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              suffixIcon: Icon(Icons.search,color: Colors.grey,),
                              border: InputBorder.none,
                              hintText: 'Search',

                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),



                      Text("Analyze Your Travel Booking ", style: TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold
                      ),),

                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: Column(
                          children: const <Widget>[

                            Card(
                              child: ListTile(
                                leading: Image(image: AssetImage('Assets/1.png')),
                                title: Text('Travel'),
                              ),
                            ),
                            Card(
                              child: ListTile(
                                title: Image(image: AssetImage('Assets/1.png')),
                                trailing: Icon(Icons.more_vert),
                              ),
                            ),
                            Card(
                              child: ListTile(
                                leading: Image(image: AssetImage('Assets/1.png')),
                                title: Text('Hotel'),
                                trailing: Icon(Icons.more_vert),
                              ),
                            ),
                            Card(
                              child: ListTile(
                                title: Text('Messages'),
                                dense: true,
                              ),
                            ),
                            Card(
                              child: ListTile(
                                leading: Image(image: AssetImage('Assets/1.png')),
                                title: Text('Analysis'),

                                trailing: Icon(Icons.more_vert),
                              ),
                            ),
                            Card(
                              child: ListTile(
                                leading: Image(image: AssetImage('Assets/1.png')),
                                title: Text('Profile'),
                                subtitle: Text(
                                    'your Profile is good.'
                                ),
                                trailing: Icon(Icons.more_vert),
                                isThreeLine: true,
                              ),
                            ),
                          ],
                        ),
                      )
                    ]
                ))));
  }
}
