

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smarttourism/Bottom_nav_bar/bottom_nav_bar.dart';
import 'package:smarttourism/user/Emailauth.dart';


class Mylogin extends StatefulWidget {


  const Mylogin({Key? key}) : super(key: key);

  @override
  State<Mylogin> createState() => _MyloginState();
}

class _MyloginState extends State<Mylogin> {

  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  var _emailController = TextEditingController();
  var _passwordController = TextEditingController();
   bool isremember = false;
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Container(


        child: SafeArea(
          child: Scaffold(
            body: Container(
                child: Form(
                  key: formkey,
                  child: ListView(
                    children: [
                      SizedBox(height: 120,),
                      Container(
                        child: Padding(
                          padding: EdgeInsets.only(left: 10,right: 10),
                          child: Column(
                            children: [


                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(12))
                                ),

                                  child:

                              Image.asset("Assets/logo.png",width: 100,height: 100,)),

                              Text("Login", style: TextStyle(
                                  fontSize: 20, color: Colors.green
                              ),),

                              SizedBox(height: 40,),

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
                                    return "Please Enter Your Email *";
                                  } if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9._]+.[a-z]").hasMatch(value)){
                                    return "Please Enter a valid email";
                                  };
                                  return null;
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
                                    prefixIcon: Icon(Icons.lock),
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
                                  RegExp regex = new RegExp(r'^.{6,}$');
                                  if(value!.isEmpty){
                                    return "Please Enter Your Password *";
                                  } if(!regex.hasMatch(value)){
                                    return "Please Enter a valid password Min 6";
                                  }
                                }

                              ),

                              SizedBox(height: 30,),
                              ElevatedButton(onPressed: (){
                                 if(formkey.currentState!.validate()){

                                 }
                               _loginUser();

                                Navigator.push(context, MaterialPageRoute(builder: (context)=> MyApp()));
                              }, child:
                              Text("Login")),

                              SizedBox(height: 30,),



                              Padding(
                                padding: EdgeInsets.only(left: 10,right: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [


                                    GestureDetector(
                                      child:
                                      
                                      Row(
                                        children: [

                                          Checkbox(value: isremember, onChanged:(value){
                                            setState(() {
                                              isremember =value!;
                                            });
                                          }),

                                          Text("Remember Me", style: TextStyle(decoration: TextDecoration.none, color: Colors.blue, fontSize: 15)),
                                        ],
                                      ),
                                      onTap: () {
                                        Navigator.push(context, MaterialPageRoute(builder: (context)=> Emailauth()));
                                      },
                                    ),

                                    GestureDetector(
                                      child: Text("Forget Password", style: TextStyle(decoration: TextDecoration.none, color: Colors.blue)),
                                      onTap: () {
                                        Navigator.push(context, MaterialPageRoute(builder: (context)=> Emailauth()));
                                      },
                                    ),
                                  ],
                                ),
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

// void signin(String email, String password) async{
//   if(_formKey.currentState!.validate()){
//     await _auth
//   }
// }


