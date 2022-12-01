

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smarttourism/Models/forget_password.dart';
import 'package:smarttourism/user/forgetpassword.dart';
import 'package:smarttourism/user/mylogin.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smarttourism/Services/globalmethod.dart';


import 'package:smarttourism/user/otpfile.dart';

class Emailauth extends StatefulWidget {
  const Emailauth({Key? key}) : super(key: key);

  @override
  State<Emailauth> createState() => _EmailauthState();
}

class _EmailauthState extends State<Emailauth> {

  final _auth = FirebaseAuth.instance;


  final email = TextEditingController();

  // Future<String> passwordReset({
  //   required String email,
  // }) async {
  //   String res = "some error occur";
  //   try {
  //     if (email.isNotEmpty) {
  //       await _auth.sendPasswordResetEmail(email: email);
  //       return res = "success";
  //     } else {
  //       res = "Enter valid email";
  //     }
  //   } catch (e) {
  //     return e.toString();
  //   }
  //   return res;
  // }

  // String _emailAddress = '';
  // final _formKey = GlobalKey<FormState>();
  //
  // GlobalMethods _globalMethods = GlobalMethods();
  // bool _isLoading = false;
  // void _submitForm() async {
  //   final isValid = _formKey.currentState.validate();
  //   FocusScope.of(context).unfocus();
  //   if (isValid) {
  //     setState(() {
  //       _isLoading = true;
  //     });
  //     _formKey.currentState.save();
  //     try {
  //       await _auth
  //           .sendPasswordResetEmail(email: _emailAddress.trim().toLowerCase())
  //           .then((value) => Fluttertoast.showToast(
  //           msg: "An email has been sent",
  //           toastLength: Toast.LENGTH_SHORT,
  //           gravity: ToastGravity.CENTER,
  //           timeInSecForIosWeb: 1,
  //           backgroundColor: Colors.red,
  //           textColor: Colors.white,
  //           fontSize: 16.0));
  //
  //       Navigator.canPop(context) ? Navigator.pop(context) : null;
  //     } catch (error) {
  //       //_globalMethods.authErrorHandle(error.message, context);
  //       // print('error occured ${error.message}');
  //     } finally {
  //       setState(() {
  //         _isLoading = false;
  //       });
  //     }
  //   }
  // }


  // Future<void> Logout() async{
  //   await FirebaseAuth.instance.signOut();
  //   Navigator.pushAndRemoveUntil((context), MaterialPageRoute(builder: (context) => Mylogin()), (route) => false);
  // }



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



                                  // passwordReset(email: email.text);
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=> ForgetpasswordScreen()));
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
