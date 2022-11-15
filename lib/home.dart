import 'package:flutter/material.dart';
import 'package:booking_calendar/booking_calendar.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: ListView(
          children: [
            Text("data")
          ],
        ),
      ),
    );
  }
}
