import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Adventure extends StatefulWidget {
  const Adventure({Key? key}) : super(key: key);

  @override
  State<Adventure> createState() => _AdventureState();
}

class _AdventureState extends State<Adventure> {

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
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Column(

            children: [
              Expanded(
                  child:
                  ListView.builder(
                      padding: const EdgeInsets.all(8),
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: entries.length,
                      itemBuilder: (BuildContext context, int index) {
                        return _rows(entries[index], placename[index]);
                      }

                  )


              )
              ,
              Expanded(
                  child:ListView.builder(
                      padding: const EdgeInsets.all(8),
                      scrollDirection: Axis.horizontal,
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
              borderRadius: BorderRadius.circular(20),
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(names, style: TextStyle(
                      fontSize: 20, color: Colors.pink
                  ),),
                  SizedBox(width: 20,),
                  Icon(Icons.favorite_border,),

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
                      TextField(
                        decoration: InputDecoration(


                          fillColor: Colors.white,
                          filled: true,
                          hintText: 'Your Name ',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)

                          ),
                        ),

                      ),

                      Text("Enter Your Number ", style: TextStyle(
                          fontSize: 15
                      ),),
                      TextField(
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          hintText: 'Your Number ',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)

                          ),
                        ),

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







