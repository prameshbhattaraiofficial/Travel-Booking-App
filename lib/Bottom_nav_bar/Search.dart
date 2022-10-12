import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
        body: Form(
        child: ListView(
        padding: EdgeInsets.all(18),
    children: [


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
    ]
        ))));
  }
}
