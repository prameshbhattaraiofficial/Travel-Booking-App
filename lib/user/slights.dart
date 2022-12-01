import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:smarttourism/Misc/colors.dart';
import 'package:smarttourism/user/register.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:textfield_datepicker/textfield_datepicker.dart';
import 'package:english_words/english_words.dart';

import 'package:smarttourism/Provider/darkthemeprovider.dart';

import 'package:date_time_picker/date_time_picker.dart';

import '../Models/firebase_storage.dart';
import '../Widgets/error_message.dart';

class Slights extends StatefulWidget {
  const Slights({Key? key}) : super(key: key);

  @override
  State<Slights> createState() => _SlightsState();
}

class _SlightsState extends State<Slights> {
  // final themeChange = Provider.of<DarkThemeProvider>(context);

  // Slights({key, key, this.title})
  //
  //
  // DateTime selectedDate = DateTime.now();

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
    'Assets/15.jpg',
  ];
  var placename = [
    'Manang',
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

  List<String> entry = <String>[
    'Assets/9.png',
    'Assets/3.jpg',
    'Assets/9.jpg',
    'Assets/7.jpg',
    'Assets/2.png',
    'Assets/7.jpg',
    'Assets/10.jpg',
    'Assets/13.jpg',
    'Assets/8.jpg',
    'Assets/7.png',
    'Assets/2.jpg',
    'Assets/6.jpg',
    'Assets/7.jpg',
    'Assets/9.jpg',
    'Assets/2.jpg',
  ];
  var placenames = [
    'Boudha',
    'Jamal',
    'ghantaghar',
    'kapan',
    "stupa",
    "damak",
    "nawalparasi",
    "basantapur",
    "nawalpur",
    "faika",
    "dang ",
    'dadeldhura',
    'sakhu',
    'gaushala',
    'putalisadak'
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                  child: ListView.separated(
                padding: const EdgeInsets.all(5),
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: entries.length,
                itemBuilder: (BuildContext context, int index) {
                  return _rows(entries[index], placenames[index]);
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(
                  width: 15,
                ),
              )),

              Container(
                margin: const EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Hotel Booking",
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      "See More",
                      style: TextStyle(fontSize: 10),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),

              Expanded(
                  child: ListView.separated(
                padding: const EdgeInsets.all(5),
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: entries.length,
                itemBuilder: (BuildContext context, int index) {
                  return _rows(entries[index], placenames[index]);
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(
                  width: 15,
                ),
              )),

              // Expanded(
              //     child: ListView.builder(
              //         padding: const EdgeInsets.all(5),
              //         scrollDirection: Axis.horizontal,
              //         itemCount: entries.length,
              //         itemBuilder: (BuildContext context, int index) {
              //           return Container(
              //             child: Column(
              //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //               children: [
              //                 Padding(
              //                   padding:
              //                       const EdgeInsets.only(left: 120, top: 10),
              //                   child: Icon(Icons.star),
              //                 ),
              //                 Padding(
              //                   padding: const EdgeInsets.only(),
              //                   child: Text(
              //                     "Haita",
              //                     style: TextStyle(fontSize: 20),
              //                   ),
              //                 ),
              //               ],
              //             ),
              //             margin: const EdgeInsets.only(right: 20),
              //             width: 200,
              //             height: 300,
              //             decoration: BoxDecoration(
              //               borderRadius: BorderRadius.circular(20),
              //               color: Colors.white,
              //               image: DecorationImage(
              //                   image: AssetImage('Assets/hotel.png'
              //
              //                       // 'Assets/'+ entries.elementAt(index),
              //
              //                       ),
              //                   fit: BoxFit.fill),
              //             ),
              //           ); //_rows(entries[index], placename[index]);
              //         })),

              // Expanded(
              //     child:ListView.builder(
              //         padding: const EdgeInsets.all(5),
              //         scrollDirection: Axis.horizontal,
              //         shrinkWrap: true,
              //         itemCount: entries.length,
              //         itemBuilder: (BuildContext context, int index) {
              //           return _rows(entries[index], placenames[index]);
              //         }
              //
              //     )),

              Expanded(
                  child: ListView.separated(
                padding: const EdgeInsets.all(5),
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: entries.length,
                itemBuilder: (BuildContext context, int index) {
                  return _rows(entries[index], placenames[index]);
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(
                  width: 15,
                ),
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
              image:
                  DecorationImage(image: AssetImage(images), fit: BoxFit.fill)),
          width: 150.0,
          height: 20.0,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    names,
                    style: const TextStyle(fontSize: 20, color: Colors.pink),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const Icon(
                    Icons.favorite_border_sharp,
                  ),
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

Future _newTaskModalBottomSheet(context, name) {
 return showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        final TextEditingController _nameController = TextEditingController();
        final TextEditingController _dateController = TextEditingController();
        final TextEditingController _totalController = TextEditingController();

        void book(String name, String date, String total) async {
          try {
            String res = await FireStoreMethods().bookNow(
              date,
              name,
              total,
            );

            if (res != 'success') {
              showSnackBar(context, res);
            }
          } catch (err) {
            showSnackBar(
              context,
              err.toString(),
            );
          }
        }

        return Container(
          child: Wrap(
            children:<Widget> [
              Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            fontFamily: "cursive"),
                      ),
                      Wrap(
                        children: List.generate(5, (index) {
                          return const Icon(
                            Icons.star,
                            color: Colors.amberAccent,
                          );
                        }),
                      ),
                      const Text(
                        "Enter Your Name ",
                        style: TextStyle(fontSize: 15),
                      ),
                      TextField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          hintText: 'Your Name ',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                      const Text(
                        "Choose Your Date ",
                        style: TextStyle(fontSize: 15),
                      ),
                      TextFormField(
                        controller: _dateController,
                        keyboardType: TextInputType.datetime,
                        decoration: InputDecoration(
                          icon: const Icon(Icons.calendar_today_rounded),
                          fillColor: Colors.white,
                          filled: true,
                          hintText: ' Choose Your Date ',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        // validator: (value) {
                        //   if (value!.isEmpty) {
                        //     return "Please Choose your Date *";
                        //   } else {
                        //     return null;
                        //   }
                        // },
                      ),
                    ],
                  )),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      children: [
                        const Text(
                          "How Many People Visit there?",
                          style: TextStyle(fontSize: 15),
                        ),
                        TextField(
                          controller: _totalController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            hintText: 'Total person ',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    " Total : payment physically chabahil",
                    style:
                        TextStyle(fontSize: 10, color: Colors.deepOrangeAccent),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        book(_nameController.text, _dateController.text,
                            _totalController.text);
                      },
                      child: Row(
                        children: [ Text("Book Now")],
                      ),
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                  side: const BorderSide(color: Colors.blue)))))
                ],
              )
            ],
          ),
        );
      });
}

// void _newTaskModalBottomSheet(context,name) {
//   showModalBottomSheet(
//       context: context,
//       builder: (BuildContext bc) {
//         return Container(
//           child: new Wrap(
//             children: <Widget>[
//               Padding(padding: EdgeInsets.all(8)
//                   , child:   Column(
//                     children: [
//
//                       Text(name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, fontFamily: "cursive"),),
//
//                 Wrap(
//                       children: List.generate(5, (index) {
//                         return Icon(Icons.star, color: Colors.amberAccent,);
//                       }),
//                     ),
//                         Text("Enter Your Name ", style: TextStyle(
//                           fontSize: 15
//                         ),),
//                           TextFormField(
//
//                             decoration: InputDecoration(
//                               fillColor: Colors.white,
//                               prefixIcon: Icon(Icons.person),
//                               filled: true,
//                               hintText: 'Your Name ',
//                               border: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(10)
//
//                               ),
//                             ),
//
//                             validator: (value) {
//                               if (value!.isEmpty) {
//                                 return "Enter Your Name *";
//                               } else {
//                                 return null;
//                               }
//                             },
//
//                           ),
//
//                           Text("Enter Your Number ", style: TextStyle(
//                               fontSize: 15
//                           ),),
//                           TextFormField(
//
//                             keyboardType: TextInputType.phone,
//                             decoration: InputDecoration(
//                               fillColor: Colors.white,
//                               filled: true,
//                               hintText: 'Your Number ',
//                               border: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(10)
//
//                               ),
//                             ),
//                             validator: (value) {
//                               if (value!.isEmpty) {
//                                 return "Enter Your Number *";
//                               } else {
//                                 return null;
//                               }
//                             },
//
//                           ),
//
//                           Text("Choose Your Date ", style: TextStyle(
//                               fontSize: 15
//                           ),),
//                           TextFormField(
//                             keyboardType: TextInputType.datetime,
//                             decoration: InputDecoration(
//                               icon: Icon(Icons.calendar_today_rounded),
//                               fillColor: Colors.white,
//                               filled: true,
//                               hintText: ' Choose Your Date ',
//                               border: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(10)
//
//                               ),
//                             ),
//                             validator: (value) {
//                               if (value!.isEmpty) {
//                                 return "Please Choose your Date *";
//                               } else {
//                                 return null;
//                               }
//                             },
//
//                           ),
//
//                           Text("How Many People Visit there?", style: TextStyle(
//                               fontSize: 15
//                           ),),
//
//
//                           TextField(
//                             keyboardType: TextInputType.number,
//                             decoration: InputDecoration(
//                               fillColor: Colors.white,
//                               filled: true,
//                               hintText: 'Total person ',
//                               border: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(10)
//
//                               ),
//                             ),
//
//                           ),
//
//
//                   Row(
//                     children: [
//                       Text("data"),
//                       ElevatedButton(onPressed: (){}, child: Text("Book Now"))
//                     ],
//                   )
//
//
//
//                   //
//                   //     Text(name, style: TextStyle(
//                   //
//                   //         fontWeight: FontWeight.bold, fontSize: 30, fontFamily: "cursive"
//                   //     ),),
//                   //   Wrap(
//                   //     children: List.generate(5, (index) {
//                   //       return Icon(Icons.star, color: Colors.amberAccent,);
//                   //     }),
//                   //   ),
//                   //
//                   //   Text("Enter Your Name ", style: TextStyle(
//                   //     fontSize: 15
//                   //   ),),
//                   //     TextFormField(
//                   //
//                   //       decoration: InputDecoration(
//                   //         fillColor: Colors.white,
//                   //         prefixIcon: Icon(Icons.person),
//                   //         filled: true,
//                   //         hintText: 'Your Name ',
//                   //         border: OutlineInputBorder(
//                   //             borderRadius: BorderRadius.circular(10)
//                   //
//                   //         ),
//                   //       ),
//                   //
//                   //       validator: (value) {
//                   //         if (value!.isEmpty) {
//                   //           return "Enter Your Name *";
//                   //         } else {
//                   //           return null;
//                   //         }
//                   //       },
//                   //
//                   //     ),
//                   //
//                   //     Text("Enter Your Number ", style: TextStyle(
//                   //         fontSize: 15
//                   //     ),),
//                   //     TextFormField(
//                   //
//                   //       keyboardType: TextInputType.phone,
//                   //       decoration: InputDecoration(
//                   //         fillColor: Colors.white,
//                   //         filled: true,
//                   //         hintText: 'Your Number ',
//                   //         border: OutlineInputBorder(
//                   //             borderRadius: BorderRadius.circular(10)
//                   //
//                   //         ),
//                   //       ),
//                   //       validator: (value) {
//                   //         if (value!.isEmpty) {
//                   //           return "Enter Your Number *";
//                   //         } else {
//                   //           return null;
//                   //         }
//                   //       },
//                   //
//                   //     ),
//                   //
//                   //     Text("Choose Your Date ", style: TextStyle(
//                   //         fontSize: 15
//                   //     ),),
//                   //     TextFormField(
//                   //       keyboardType: TextInputType.datetime,
//                   //       decoration: InputDecoration(
//                   //         icon: Icon(Icons.calendar_today_rounded),
//                   //         fillColor: Colors.white,
//                   //         filled: true,
//                   //         hintText: ' Choose Your Date ',
//                   //         border: OutlineInputBorder(
//                   //             borderRadius: BorderRadius.circular(10)
//                   //
//                   //         ),
//                   //       ),
//                   //       validator: (value) {
//                   //         if (value!.isEmpty) {
//                   //           return "Please Choose your Date *";
//                   //         } else {
//                   //           return null;
//                   //         }
//                   //       },
//                   //
//                   //     ),
//                   //
//                   //     Text("How Many People Visit there?", style: TextStyle(
//                   //         fontSize: 15
//                   //     ),),
//                   //
//                   //
//                   //     TextField(
//                   //       keyboardType: TextInputType.number,
//                   //       decoration: InputDecoration(
//                   //         fillColor: Colors.white,
//                   //         filled: true,
//                   //         hintText: 'Total person ',
//                   //         border: OutlineInputBorder(
//                   //             borderRadius: BorderRadius.circular(10)
//                   //
//                   //         ),
//                   //       ),
//                   //
//                   //     ),
//                   //
//                   //
//                   //
//                   //     Row(
//                   //       children: [
//                   //
//                   //
//                   //         ElevatedButton(onPressed: (){}, child: Text("30\$")
//                   //         ),
//                   //
//                   //         ElevatedButton(onPressed: (){}, child: Text("Text"))
//                   //       ],
//                   //     ),
//                   //
//                   //     SizedBox(height: 20,)
//                   //
//                   //
//                   //
//                   //
//                   //   ],
//                   // )
//
//
//
//
//              // ),
//
//
//               // Column(
//               //   children: [
//               //     Padding(padding: EdgeInsets.all(15),
//               //       child: Column(
//               //         children: [
//               //           Text("How Many People Visit there?", style: TextStyle(
//               //               fontSize: 15
//               //           ),),
//               //
//               //
//               //           TextFormField(
//               //             keyboardType: TextInputType.number,
//               //             decoration: InputDecoration(
//               //               fillColor: Colors.white,
//               //               filled: true,
//               //               hintText: 'Total person ',
//               //               border: OutlineInputBorder(
//               //                   borderRadius: BorderRadius.circular(10)
//               //
//               //               ),
//               //             ),
//               //
//               //             validator: (value){
//               //               if(value!.isEmpty){
//               //                 print("Enter your Total People");
//               //               }
//               //               return null;
//               //             },
//               //
//               //           ),
//               //
//               //           Row(
//               //             children: [
//               //
//               //
//               //               ElevatedButton(onPressed: (){}, child: Text("30\$")
//               //               ),
//               //
//               //               ElevatedButton(onPressed: (){}, child: Text("Text"))
//               //             ],
//               //           )
//               //
//               //         ],
//               //       ),)
//               //   ],
//               // ),
//               //
//               // Row(
//               //   mainAxisAlignment: MainAxisAlignment.spaceAround,
//               //   children: [
//               //
//               //     Text(" Total : 30\$", style: TextStyle(
//               //          fontSize: 20,
//               //         color: Colors.deepOrangeAccent
//               //     ),),
//               //
//               //     ElevatedButton(onPressed: (){},
//               //         child:
//               //         Row(
//               //           children: [
//               //
//               //             Text("Book Now")
//               //           ],
//               //         ), style: ButtonStyle(
//               //             shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//               //                 RoundedRectangleBorder(
//               //                     borderRadius: BorderRadius.circular(18.0),
//               //                     side: BorderSide(color: Colors.blue)
//               //                 )
//               //             )
//               //         )
//               //
//               //     )
//               //
//               //
//               //   ],
//               // )
//             ],
//           ),
//         )]
//           ));
//       }
//   );
// }
