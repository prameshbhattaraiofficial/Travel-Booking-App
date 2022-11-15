

import 'package:flutter/material.dart';


import 'package:smarttourism/user/otpfile.dart';

class Emailauth extends StatefulWidget {
  const Emailauth({Key? key}) : super(key: key);

  @override
  State<Emailauth> createState() => _EmailauthState();
}

class _EmailauthState extends State<Emailauth> {

  GlobalKey<FormState> formkey = GlobalKey<FormState>();
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
                      key: formkey,
                      child: Column(
                          children: [

                            Image(image: AssetImage('Assets/logo.png'),
                            width: 100,),

                            SizedBox(height: 50,),

                            Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Text("This help show that this account really belongs to you.",style: TextStyle(
                                fontSize: 20
                              ),),
                            ),

                            SizedBox(height: 20,),



                            Text( "Email Recovery", style: TextStyle(
                              fontSize: 20,
                            ),),
                            SizedBox(height: 20,),
                            Padding(
                              padding: EdgeInsets.only(left: 10, right: 10),
                              child: TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                onChanged: (val) {
                                  var email = val;
                                },
                                decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.email),
                                    fillColor: Colors.black12,
                                    filled: true,
                                    hintText: 'Enter Email',
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10)
                                    )
                                ),
                                validator: (value){
                                  if(value!.isEmpty){
                                    return "Enter Email here *";
                                  } if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9._]+.[a-z]").hasMatch(value)){
                                    return "Please Enter a valid email";
                                  };
                                  return null;
                                }
                              ),
                            ),
                            SizedBox(height: 20,),

                           Padding(
                             padding: EdgeInsets.only(left: 10,right: 10),
                             child: Row(
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               children: [
                                 GestureDetector(
                                   child: Text("Another Option", style: TextStyle(decoration: TextDecoration.none, color: Colors.blue, fontSize: 18)),
                                   onTap: () {
                                     Navigator.push(context, MaterialPageRoute(builder: (context)=> Emailauth()));
                                   },
                                 ),

                                 ElevatedButton(onPressed: (){
                                   Navigator.push(context, MaterialPageRoute(builder: (context)=> Otpfile()));
                                    if(formkey.currentState!.validate()){

                                    }
                                 }, child: Text(
                                   'Next', style: TextStyle(
                                     decoration: TextDecoration.none,
                                     fontSize: 20,

                                 ),
                                 )),
                               ],
                             ),
                           )

                          ]),
                    ),
                  ),])));

  }
}
