import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

import '../Models/book_model.dart';
import '../Models/book_model.dart';
import '../Widgets/error_message.dart';

class Mybook extends StatefulWidget {
  const Mybook({Key? key}) : super(key: key);

  @override
  State<Mybook> createState() => _MybookState();
}

class _MybookState extends State<Mybook> {

  bool isLoading = true;
  List _book = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Mybooking();
  }

  Mybooking() async {
    setState(() {
      isLoading = true;
    });

    QuerySnapshot bookSnap = await FirebaseFirestore.instance
        .collection('Book')
        .orderBy('datePublished', descending: true)
        .get();

    _book = bookSnap.docs.map((d) => BookModel.fromMap(d)).toList();
    return _book;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: Column(
            children: [


              ListView.builder(
              itemCount: _book.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                    leading: const Icon(Icons.list),
                    trailing: const Text(
                      "",
                      style: TextStyle(color: Colors.green, fontSize: 15),
                    ),
                    title: Text("List item $index"));
              }),

            ],
          )
      ),
    ));
  }
}
