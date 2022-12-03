

import 'package:flutter/material.dart';
import 'package:smarttourism/Account/account.dart';
import 'package:smarttourism/Bottom_nav_bar/Search.dart';
import 'package:smarttourism/Bottom_nav_bar/myBooking.dart';
import 'package:smarttourism/Bottom_nav_bar/setting.dart';
import 'package:smarttourism/Visitors/feedback.dart';
import 'package:smarttourism/user/Housepage.dart';
import 'package:smarttourism/user/aboutus.dart';
import 'package:smarttourism/user/booking_travel.dart';
import 'package:smarttourism/user/myBooking.dart';
import 'package:smarttourism/user/mylogin.dart';
import 'package:smarttourism/user/Notification.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    DefaultHome(),
    AboutUs(),
    TravelBooking(),
    UserNotification(),
   Account()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article),
            label: 'About Us',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'book',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notification_add),
            label: 'notification',
            backgroundColor: Colors.green,
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Account',
            backgroundColor: Colors.green,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
