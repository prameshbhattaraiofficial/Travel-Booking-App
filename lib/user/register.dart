
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smarttourism/Bottom_nav_bar/bottom_nav_bar.dart';
import 'package:smarttourism/user/alert.dart';
import 'package:smarttourism/user/mylogin.dart';
import 'package:rflutter_alert/rflutter_alert.dart';


class Registerpage extends StatefulWidget {
  const Registerpage({Key? key}) : super(key: key);

  @override
  State<Registerpage> createState() => _RegisterpageState();
}

class _RegisterpageState extends State<Registerpage> {

  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  bool _isObscure = true;
  var _emailController = TextEditingController();
  var _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('Assets/register.png'), fit: BoxFit.cover,

            )
        ),
        child: SafeArea(
          child: Scaffold(


            body:

             SingleChildScrollView(
               child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("Assets/register.png"),
                            fit: BoxFit.cover
                          )
                        ),
                      ),
                    )

                    ,Container(

                      padding: EdgeInsets.only(top:10, left: 50),

                      child: Text(" Register Now ", style: TextStyle(
                        fontSize: 30,
                        color: Colors.black,


                      ),),),
                    Container(

                      padding: EdgeInsets.only(
                          top: MediaQuery
                              .of(context)
                              .size
                              .height *0.2
                      ),
                      child: Form(
                        key: formkey,
                        child: Column(
                          children: [
                            TextFormField(
                              decoration: InputDecoration(


                                fillColor: Colors.white,
                                filled: true,
                                hintText: 'Enter Full Name ',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)

                                ),
                              ),
                              validator: (value){
                                if(value!.isEmpty){
                                  return "required";
                                }else{
                                  return null;
                                }
                              },

                            ),
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
                              },
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

                                  ),),
                              validator: (value){
                                if(value!.isEmpty){
                                  return "required";
                                }else{
                                  return null;
                                }
                              },
                            ),

                            SizedBox(height: 30,),
                            TextFormField(
                                obscureText: _isObscure,
                                decoration: InputDecoration(
                                  fillColor: Colors.black12,
                                  filled: true,
                                  hintText: 'Enter Confirm Password',
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

                                  ),),
                                validator: (value){
                      if(value!.isEmpty){
                      return "required";
                      }else{
                      return null;
                      }
                      },
                            ),
                            SizedBox(height: 20,),

                            ElevatedButton(onPressed: (){


                             _createAccount();
                             if(formkey.currentState!.validate()){

                             }
                            }, child: Text("Register")






    ),
                            Text("If you Already Register "),




                            GestureDetector(
                              child: Text("Click here", style: TextStyle(decoration: TextDecoration.underline, color: Colors.blue)),
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context)=> Mylogin()));
                              },
                            )
                            //   )
                          ]),
                      ))]),
             ),
            )));
  }

  _createAccount() async {
    try {
      print("Email : ${_emailController.text.trim()}");
      print("Email : ${_passwordController.text.trim()}");
      var userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim()
      ).then((value) => {
      Navigator.push(context, MaterialPageRoute(builder: (context)=> MyApp()))

      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print("Error $e");
    }
  }
}
