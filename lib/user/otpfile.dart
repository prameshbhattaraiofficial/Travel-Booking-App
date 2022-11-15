import 'package:flutter/material.dart';
import 'package:smarttourism/Bottom_nav_bar/bottom_nav_bar.dart';
import 'package:smarttourism/user/Emailauth.dart';
import 'package:smarttourism/user/Housepage.dart';
import 'package:smarttourism/user/forgetpassword.dart';

class Otpfile extends StatefulWidget {
  const Otpfile({Key? key}) : super(key: key);

  @override
  State<Otpfile> createState() => _OtpfileState();
}
class _OtpfileState extends State<Otpfile> {

  GlobalKey<FormState> formkey  =  GlobalKey<FormState>();
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

                            Image(image: AssetImage('Assets/logo.png', ),
                              width: 100,),

                            SizedBox(height: 20,),

                            Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Text("An Email with varification code was sent to your mail.",style: TextStyle(
                                  fontSize: 18
                              ),),
                            ),

                            SizedBox(height: 20,),



                            Text( "OTP  Number ", style: TextStyle(
                              fontSize: 20,
                            ),),
                            SizedBox(height: 20,),
                            Padding(
                              padding: EdgeInsets.only(left: 10, right: 10),
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    fillColor: Colors.black12,
                                    filled: true,
                                    hintText: 'Enter Code',
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10)
                                    )
                                ),
                                validator: (value){
                                  if(value!.isEmpty){
                                    return "Enter Code here *";
                                  }else{
                                    return null;
                                  }
                                },
                              ),
                            ),
                            SizedBox(height: 20,),

                            Padding(
                              padding: EdgeInsets.only(left: 10,right: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    child: Text("Try Another Option", style: TextStyle(decoration: TextDecoration.none, color: Colors.blue, fontSize: 18)),
                                    onTap: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=> ForgetPassword()));
                                    },
                                  ),

                                  ElevatedButton(onPressed: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=> ForgetPassword()));
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

