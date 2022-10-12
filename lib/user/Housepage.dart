import 'package:flutter/material.dart';
import 'package:smarttourism/user/Adventure.dart';
import 'package:smarttourism/user/Tour.dart';
import 'package:smarttourism/user/register.dart';
import 'package:smarttourism/user/slights.dart';


class DefaultHome extends StatefulWidget {
  const DefaultHome({Key? key}) : super(key: key);


  @override
  State<DefaultHome> createState() => _DefaultHomeState();
}

class _DefaultHomeState extends State<DefaultHome>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

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

              SizedBox(height: 15,),
              //category
              Text("Explore",style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),),
              SizedBox(height: 15,),

              //tabbar
              Container(
                child: TabBar(
                  isScrollable: true,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.blueGrey,
                  controller: _tabController,
                  tabs: [
                    Tab(text: "Slights",),
                    Tab(text: "Tour",),
                    Tab(text: "Adventure",),

                  ],
                ),
              ),




              //tabbar view
              Container(
                width: double.maxFinite,
                height: MediaQuery.of(context).size.height -20,
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    Slights(),
                    Tour(),
                    Adventure()



                  ],
                ),
              ),

            ],
          ),

        ),
      ),
    );
  }
}