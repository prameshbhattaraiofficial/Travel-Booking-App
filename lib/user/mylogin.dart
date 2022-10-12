

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smarttourism/Bottom_nav_bar/bottom_nav_bar.dart';
import 'package:smarttourism/user/Emailauth.dart';
import 'package:smarttourism/user/Housepage.dart';

class Mylogin extends StatefulWidget {


  const Mylogin({Key? key}) : super(key: key);

  @override
  State<Mylogin> createState() => _MyloginState();
}

class _MyloginState extends State<Mylogin> {

  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  var _emailController = TextEditingController();
  var _passwordController = TextEditingController();

  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Container(
        child: SafeArea(
          child: Scaffold(
            body:
            Container(


                child: Form(
                  key: formkey,
                  child: ListView(
                    children: [

                      Container(

                        padding: EdgeInsets.only(
                            top: MediaQuery
                                .of(context)
                                .size
                                .height *0.4
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(left: 10,right: 10),
                          child: Column(
                            children: [

                              Text("Login", style: TextStyle(
                                fontSize: 30, color: Colors.green
                              ),),

                              SizedBox(height: 20,),

                              TextFormField(
                                controller: _emailController,

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
                                    return "required";
                                  }else{
                                    return null;
                                  }
                                }



                              ),

                              SizedBox(height: 30,),
                              TextFormField(
                                controller: _passwordController,
                                  obscureText: _isObscure,
                                  decoration: InputDecoration(
                                    fillColor: Colors.black12,
                                    filled: true,
                                    hintText: 'Enter Password',
                                    suffixIcon: IconButton(
                                        icon: Icon(
                                            _isObscure ? Icons.visibility : Icons
                                                .visibility_off),
                                        onPressed: () {
                                          setState(() {
                                            _isObscure = !_isObscure;
                                          });
                                        }),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10)

                                    ),
                                  ),
                                validator: (value){
                                  if(value!.isEmpty){
                                    return "required";
                                  } else{
                                    return null;
                                  }
                                }

                              ),

                              SizedBox(height: 30,),
                              ElevatedButton(onPressed: (){
                                // if(formkey.currentState!.validate()){
                                //
                                // }
                              // _loginUser();

                                Navigator.push(context, MaterialPageRoute(builder: (context)=> MyApp()));
                              }, child:
                              Text("Login")),

                              SizedBox(height: 30,),




                              GestureDetector(
                                child: Text("Forget Password", style: TextStyle(decoration: TextDecoration.none, color: Colors.blue)),
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=> Emailauth()));
                                },
                              )




                            ],
                          ),
                        ),
                      )


                    ],
                  ),
                ),
              ),
            ),
          ),
        );
  }

  _loginUser() async{
    try {

      var userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim()
      ).then((value) => {
      Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>  MyApp()),
      )
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }
}
