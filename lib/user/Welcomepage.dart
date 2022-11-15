import 'package:flutter/material.dart';
import 'package:smarttourism/Misc/colors.dart';
import 'package:smarttourism/user/mylogin.dart';
import 'package:smarttourism/user/register.dart';




class Welcomepage extends StatefulWidget {
  const Welcomepage({Key? key}) : super(key: key);

  @override
  State<Welcomepage> createState() => _WelcomepageState();
}

class _WelcomepageState extends State<Welcomepage> {

  List images = [
    "Assets/welcome.png",
    "Assets/wel.png",
    "Assets/welc.png"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical,
          itemCount: images.length,
          itemBuilder: (_, index){

        return Container(
          width: double.maxFinite,
          height: double.maxFinite,

          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("Assets/wel.png"),
              fit: BoxFit.cover
            )
          ),
          child: Container(
            margin: const EdgeInsets.only(top: 500, left: 60, right: 20),
            child: Row(
              children: [
                Column(
                  children: [
                    Text("Discover",style: TextStyle(
                      fontSize: 40,
                      fontFamily: "cursive",color: Colors.green
                    ),),
                    Text("Your Destination", style: TextStyle(
                      fontSize: 30, color: Colors.cyanAccent,
                      fontWeight: FontWeight.bold,
                      fontFamily: "cursive"
                    ),),
                    Text("Click get Started for Move\n your Destination.", style: TextStyle(
                      fontStyle: FontStyle.italic,
                      color: Colors.white, fontSize: 15
                    ),),


                    SizedBox(height: 20,),

                    ElevatedButton(onPressed: (){

                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Registerpage()),
                      );
                    }, child: Text(" Get Started ", style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black
                    ),))
                  ],
                )
              ],
            ),
          ),
        );
    }

      ),
    );
  }
}
