import 'package:flutter/material.dart';
import 'package:smarttourism/Bottom_nav_bar/bottom_nav_bar.dart';
import 'package:smarttourism/user/Housepage.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("Assets/register.png") ,fit: BoxFit.cover
          ),
        ),
        child: Scaffold(

            body:
            ListView(
                children: [

                  Container(

                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height*0.2
                    ),
                    child: Form(

                      child: Column(
                          children: [

                            Image(image: AssetImage('Assets/logo.png'),
                              width: 100,),




                            SizedBox(height: 20,),
                            Padding(
                              padding: EdgeInsets.only(left: 10, right: 10),
                              child:
                              Column(
                                children: [

                                  Text("Enter Password" , style: TextStyle(
                                    fontSize: 15
                                  ),),
                                  TextFormField(

                                    decoration: InputDecoration(

                                        fillColor: Colors.black12,
                                        filled: true,
                                        hintText: 'Enter Password',
                                        prefixIcon: Icon(Icons.lock),
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(10)
                                        )
                                    ),
                                    validator: (value){
                                      RegExp regex = new RegExp(r'^.{6,}$');
                                      if(value!.isEmpty){
                                        return "Required";
                                      } if(!regex.hasMatch(value)){
                                        return "Please Enter a valid password Min 6";
                                      }
                                    },
                                  ),
                                  SizedBox(height: 20,),

                                  Text("Enter Confirm Password", style: TextStyle(
                                    fontSize: 15
                                  ),),

                                  TextFormField(

                                    decoration: InputDecoration(

                                        fillColor: Colors.black12,
                                        filled: true,
                                        hintText: 'Enter Confirm Password',
                                        prefixIcon: Icon(Icons.lock),
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(10)
                                        )
                                    ),


                                    validator: (value){
                                      RegExp regex = new RegExp(r'^.{6,}$');
                                      if(value!.isEmpty){
                                        return "Required";
                                      } if(!regex.hasMatch(value)){
                                        return "Please Enter a valid password Min 6";
                                      }
                                    },
                                  ),
                                ],
                              ),

                            ),
                            SizedBox(height: 20,),



                            ElevatedButton(onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> MyApp()));

                            }, child: Text(
                              'Submit', style: TextStyle(
                                decoration: TextDecoration.none,
                                fontSize: 20,

                            ),
                            ))

                          ]),
                    ),
                  ),])));

  }
}

