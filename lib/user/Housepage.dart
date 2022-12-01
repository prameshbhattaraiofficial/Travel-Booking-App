import 'package:flutter/material.dart';
import 'package:smarttourism/admin/Adding_Travel.dart';
import 'package:smarttourism/admin/Analysis.dart';
import 'package:smarttourism/admin/Dashboard.dart';
import 'package:smarttourism/admin/Hotelbooking.dart';
import 'package:smarttourism/admin/customers.dart';
import 'package:smarttourism/admin/messages.dart';
import 'package:smarttourism/admin/setting.dart';
import 'package:smarttourism/user/Adventure.dart';
import 'package:smarttourism/user/Tour.dart';
import 'package:smarttourism/user/Welcomepage.dart';
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

              // Container(
              //   padding: const EdgeInsets.only(top: 5, left: 10),
              //  child: Row(
              //    children: [
              //      Icon(Icons.menu, size: 30, color: Colors.black,),
              //
              //      Expanded(child: Container(
              //
              //      )),
              //      Container(
              //        width: 50,
              //        height: 50,
              //
              //        decoration: BoxDecoration(
              //          borderRadius: BorderRadius.circular(10),
              //          color: Colors.grey.withOpacity(0.5)
              //        ),
              //      )
              //    ],
              //  ),
              // ),
              // SizedBox(height: 10,),


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
                fontSize: 30,
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