

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smarttourism/user/register.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:textfield_datepicker/textfield_datepicker.dart';

class Slights extends StatefulWidget {
  const Slights({Key? key}) : super(key: key);

  @override
  State<Slights> createState() => _SlightsState();
}

class _SlightsState extends State<Slights> {


  List<String> entries = <String>[
    'Assets/1.png',
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
    'Assets/15.jpg'
  ];
  var placename = [
    'manang',
    'mustang',
    'pkr',
    'ktm',
    "kaski",
    "jhapa",
    "nawalpur",
    "teenghare",
    "bitalap",
    "kaski",
    "morang ",
    'jhapa',
    'kathmandu',
    'mustang',
    'kailali'
  ];

  TextEditingController Dateinput = TextEditingController();

  @override
  void initstate(){
    Dateinput.text = "";
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                  child:  ListView.builder(
                      padding: const EdgeInsets.all(5),
                      scrollDirection: Axis.horizontal,
                      itemCount: entries.length,
                      itemBuilder: (BuildContext context, int index) {
                        return _rows(entries[index], placename[index]);
                      }

                  ))
              ,
              Expanded(
                  child:ListView.builder(
                      padding: const EdgeInsets.all(5),
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: entries.length,
                      itemBuilder: (BuildContext context, int index) {
                        return _rows(entries[index], placename[index]);
                      }

                  ))

            ],


          ),
        ),
      ),
    );
  }

  _rows(images, names) {
    return SizedBox(
      height: 50,
      width: 200,
      child: InkWell(
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              image: DecorationImage(
                  image: AssetImage(images),
                  fit: BoxFit.fill
              )
          ),

          width: 150.0,
          height: 20.0,
          child: Center(
            child:
            Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(names, style: TextStyle(
                      fontSize: 20, color: Colors.pink
                  ),),
                  SizedBox(width: 20,),
                  Icon(Icons.bookmark_add_outlined,),

                ],
              ),
            ),
          ),
        ),
        onTap: () {
          _newTaskModalBottomSheet(context, names);
          // PickerViewPopup.showMode(PickerShowMode.BottomSheet, context: context, builder: (context, pop), controller: controller, numberofRowsAtSection: numberofRowsAtSection, itemBuilder: itemBuilder)

        },
      ),
    );
  }
}
void _newTaskModalBottomSheet(context,name) {
  showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return Container(
          child: new Wrap(
            children: <Widget>[
              Padding(padding: EdgeInsets.all(10)
                  , child:   Column(
                    children: [

                      Text(name, style: TextStyle(

                          fontWeight: FontWeight.bold, fontSize: 30, fontFamily: "cursive"
                      ),),

                    Text("Enter Your Name ", style: TextStyle(
                      fontSize: 15
                    ),),
                      TextFormField(

                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          prefixIcon: Icon(Icons.person),
                          filled: true,
                          hintText: 'Your Name ',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)

                          ),
                        ),

                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter Your Name *";
                          } else {
                            return null;
                          }
                        },

                      ),

                      Text("Enter Your Number ", style: TextStyle(
                          fontSize: 15
                      ),),
                      TextFormField(

                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          hintText: 'Your Number ',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)

                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter Your Number *";
                          } else {
                            return null;
                          }
                        },

                      ),

                      Text("Choose Your Date ", style: TextStyle(
                          fontSize: 15
                      ),),
                      TextFormField(
                        keyboardType: TextInputType.datetime,
                        decoration: InputDecoration(
                          icon: Icon(Icons.calendar_today_rounded),
                          fillColor: Colors.white,
                          filled: true,
                          hintText: ' Choose Your Date ',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)

                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please Choose your Date *";
                          } else {
                            return null;
                          }
                        },

                      ),


                    ],
                  )




              ),


              Column(
                children: [
                  Padding(padding: EdgeInsets.all(15),
                    child: Column(
                      children: [
                        Text("How Many People Visit there?", style: TextStyle(
                            fontSize: 15
                        ),),


                        TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            hintText: 'Total person ',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)

                            ),
                          ),

                        ),
                      ],
                    ),)
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [

                  Text(" Total : 30\$", style: TextStyle(
                       fontSize: 20,
                      color: Colors.deepOrangeAccent
                  ),),

                  ElevatedButton(onPressed: (){},
                      child:
                      Row(
                        children: [

                          Text("Book Now")
                        ],
                      ), style: ButtonStyle(
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                  side: BorderSide(color: Colors.blue)
                              )
                          )
                      )

                  )


                ],
              )
            ],
          ),
        );
      }
  );
}