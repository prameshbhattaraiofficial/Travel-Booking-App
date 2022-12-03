import 'package:flutter/material.dart';
import 'package:smarttourism/admin/Adding_Travel.dart';
import 'package:smarttourism/admin/Analysis.dart';
import 'package:smarttourism/admin/Dashboard.dart';
import 'package:smarttourism/admin/Hotelbooking.dart';
import 'package:smarttourism/admin/customers.dart';
import 'package:smarttourism/admin/setting.dart';
import 'package:smarttourism/user/Welcomepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:smarttourism/user/mylogin.dart';

class Messages extends StatefulWidget {
  const Messages({Key? key}) : super(key: key);

  @override
  State<Messages> createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {



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
              },
            ),

          ],
        ),
      ),
      body: Scaffold(
        body: Messager(),
       

      ),
    );
  }
}


class Messager extends StatefulWidget {
  const Messager({Key? key}) : super(key: key);

  @override
  State<Messager> createState() => _MessagerState();
}

class _MessagerState extends State<Messager> {

  List<String> entries = [ 'Assets/1.png',
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
  'Assets/15.jpg',];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      appBar: AppBar(
        backgroundColor: Colors.black,

        title: Text("Chats", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22, color: Colors.white,
            fontFamily: "Roboto"),),

        leading: Container(
          padding: EdgeInsets.only(left: 16, top: 3, bottom: 3),
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            child: ClipOval(
              child: Image.asset("", fit: BoxFit.fill,),
            ),
          ),
        ),

        actions: <Widget>[
          CircleAvatar(
            backgroundColor: Color.fromRGBO(51, 51, 51, 1),
            // child: IconButton(
            //   icon: Icon(Icons.photo_camera, size: 22, color: Color.fromRGBO(195, 195, 195, 1),),
            // ),

            child: IconButton(
              icon: Icon(Icons.photo_camera, size: 22,color: Color.fromRGBO(195, 195, 195, 1),), onPressed: () {  },
            ),
          ),
          SizedBox(width: 20,),
          CircleAvatar(
            backgroundColor: Color.fromRGBO(51, 51, 51, 1),
            child: IconButton(
              icon: Icon(Icons.edit, size: 22, color: Color.fromRGBO(195, 195, 195, 1),), onPressed: () {  },
            ),
          ),
          SizedBox(width: 16,),

        ],
      ),

      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(16),
            child: Container(
              padding: EdgeInsets.only(left: 16, top: 4, bottom: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                color: Color.fromRGBO(51, 51, 51, 1),
              ),

              child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    icon: Icon(Icons.search, color: Color.fromRGBO(159, 159, 159, 1),),
                    hintText: "Search",
                    hintStyle: TextStyle(
                      color: Color.fromRGBO(159, 159, 159, 1),
                    )
                ),
              ),
            ),
          ),


          Container(
            height: 85,
            margin: EdgeInsets.only(top: 8, bottom: 8, left: 16),
            child: ListView.builder(

              itemBuilder: (context, index){
                return Container(
                  width: 65,
                  margin: EdgeInsets.only(right: 16),
                  child: Column(

                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          Container(
                            height: 60,
                            width: 60,

                            padding: EdgeInsets.all((index % 2 ==1)? 2 : 0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(30)),
                                color: Color.fromRGBO(51, 51, 51, 1),
                                border: (index%2 == 0) ? Border.all(width: 0) : Border.all(color: Color.fromRGBO(0, 132, 255, 1), width: 3)
                            ),

                            child: ClipOval(
                              child: (index == 0) ?
                              IconButton(icon : Icon(Icons.add, size: 30, color: Color.fromRGBO(195, 195, 195, 1),), onPressed: () {  },) :
                              Image.asset("Assets/${''}"),
                            ),
                          ),

                          Positioned(
                            child: Container(
                              height: (index != 0) ? 18 : 0,
                              width: 18,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(9)),
                                  color: Colors.green,
                                  border: Border.all(color: Colors.black, width: 3)
                              ),
                            ),
                            bottom: 0,
                            right: 0,
                          )
                        ],
                      ),

                      Text("Your Story", style: TextStyle(
                          fontFamily: "Roboto",
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: (index%2 == 1) ? Colors.white : Color.fromRGBO(123, 123, 123, 1)
                      ),)
                    ],
                  ),

                );
              },
              itemCount: 8,
              scrollDirection: Axis.horizontal,

            ),
          ),

          Container(
            margin: EdgeInsets.only(left: 16, right: 16, top : 8),
            height: 350,
            child: ListView.builder(
              itemBuilder: (context, index){
                return ListTile(
                  contentPadding: EdgeInsets.only(bottom: 10, right: 8),
                  leading: Stack(
                    children: <Widget>[
                      Container(
                        height: 60,
                        width: 60,

                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          color: Color.fromRGBO(51, 51, 51, 1),
                        ),

                        child: ClipOval(
                          child:
                          Image.asset("Assets/${entries[index]}"),
                        ),
                      ),

                      Positioned(
                        child: Container(
                          height: (index %2 == 0) ? 18 : 0,
                          width: 18,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(9)),
                              color: Colors.green,
                              border: Border.all(color: Colors.black, width: 3)
                          ),
                        ),
                        bottom: 0,
                        right: 0,
                      )
                    ],
                  ),
                  title: Padding(
                    padding: EdgeInsets.only(bottom: 6),
                    child: Text("girija prasad goirala", style: TextStyle(
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.w500,
                        color: Colors.white
                    ),),
                  ),

                  subtitle: Text("This is message of girija prasad koirala", style: TextStyle(fontFamily: "Roboto", fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(123, 123, 123, 1)
                  ),),

                  trailing: Icon(Icons.check_circle,size: 20, color: (index%2 == 0) ? Color.fromRGBO(101, 107, 115, 1) : Colors.transparent,),
                );
              },
              itemCount: 5,
            ),
          ),
        ],
      ),

      bottomNavigationBar: Container(
        height: 50,
        color: Colors.black,
        padding: EdgeInsets.only(left: 80, right: 80),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: 40,
                  width: 40,
                  child: IconButton(
                    icon: Image.asset("Assets/1.png", fit: BoxFit.fitHeight,), onPressed: () {  },
                  ),
                ),
                Positioned(
                  child: Container(
                    height:21 ,
                    width: 21,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10.5)),
                        color: Colors.redAccent,
                        border: Border.all(color: Colors.black, width: 3)
                    ),
                    child: Center(
                      child: Text("2", style: TextStyle(fontFamily: "Roboto", fontSize: 12, color: Colors.white,
                          fontWeight: FontWeight.w600
                      ),),
                    ),
                  ),
                  top: 2,
                  right: 0,
                )

              ],
            ),
            Container(
              height: 40,
              width: 40,
              child: IconButton(
                icon: Image.asset("Assets/1.png", fit: BoxFit.fitHeight,), onPressed: () {  },
              ),
            ),
            Container(
              height: 40,
              width: 40,
              child: IconButton(
                icon: Image.asset("Assets/1.png", fit: BoxFit.fitHeight,), onPressed: () {  },
              ),
            ),
          ],
        ),
      ),
    );
  }
}