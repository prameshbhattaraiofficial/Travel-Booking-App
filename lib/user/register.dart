import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smarttourism/Bottom_nav_bar/bottom_nav_bar.dart';
import 'package:smarttourism/user/mylogin.dart';
import 'package:email_validator/email_validator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:smarttourism/Models/users.dart';
import 'package:smarttourism/user/verify_email.dart';
import 'package:uuid/uuid.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../Models/firebase_storage.dart';
import '../Widgets/error_message.dart';
import 'Housepage.dart';

class Registerpage extends StatefulWidget {
  const Registerpage({Key? key}) : super(key: key);

  @override
  State<Registerpage> createState() => _RegisterpageState();
}

class _RegisterpageState extends State<Registerpage> {
  final _auth = FirebaseAuth.instance;
  bool _isloading = false;
  void signup() async {
    setState(() {
      _isloading = true;
    });
    String res = await FireStoreMethods().registerUser(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
      userFullName: FullnameEditingText.text.trim(),
      phoneNumber: ContactEditingText.text.trim(),
      address: _address.text.trim(),
    );

    if (res == "success") {
      setState(() {
        _isloading = false;
      });
      Fluttertoast.showToast(msg: "Account has been created");
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Mylogin()));
    } else {
      setState(() {
        _isloading = false;
      });

      showSnackBar(context, res);
    }
  }

  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  // GlobalKey<FormState> Fullname = GlobalKey<FormState>();
  // GlobalKey<FormState> emailaddress = GlobalKey<FormState>();
  // GlobalKey<FormState> Contact = GlobalKey<FormState>();
  // GlobalKey<FormState> Password = GlobalKey<FormState>();
  // GlobalKey<FormState> ConfirmPassword = GlobalKey<FormState>();
  // GlobalKey<FormState> Address = GlobalKey<FormState>();

  String _errorMessage = '';
  bool _isObscure = true;

  String id = const Uuid().v1();
  final TextEditingController FullnameEditingText = TextEditingController();
  final TextEditingController ContactEditingText = TextEditingController();
  final TextEditingController ConfirmPasswordEditingText =
      TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _address = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // final emailfield = TextFormField(
    //     autofocus: false,
    //     controller: _emailController,
    //     keyboardType: TextInputType.emailAddress,
    //
    //
    //     onSaved: (value) {
    //       _emailController.text = value!;
    //     }
    // );
    //
    //
    // final ContactEditingText = TextFormField(
    //   autofocus: false,
    // );
    //
    // final ConfirmPasswordEditingText = TextFormField(
    //   autofocus: false,
    // );
    //
    // final passwordfield = TextFormField(
    //   autofocus: false,
    //   controller: _passwordController,
    //
    //   onSaved: (value) {
    //     _passwordController.text = value!;
    //   },
    //   textInputAction: TextInputAction.next,
    //
    //   decoration: InputDecoration(
    //       prefixIcon: Icon(Icons.lock),
    //       contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
    //       hintText: "Password",
    //       border: OutlineInputBorder(
    //         borderRadius: BorderRadius.circular(12),
    //       )
    //   ),
    // );
    return Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage('Assets/register.png'),
          fit: BoxFit.cover,
        )),
        child: SafeArea(
            child: Scaffold(
          body: SingleChildScrollView(
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Container(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("Assets/logo.png"),
                          fit: BoxFit.cover)),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                padding: const EdgeInsets.only(top: 10, left: 50),
                child: const Center(
                  child: Text(
                    " create an account ",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
              Container(
                  padding: const EdgeInsets.all(12),
                  child: Form(
                    key: formkey,
                    child: Column(children: [
                      TextFormField(
                        controller: FullnameEditingText,
                        autofocus: false,
                        decoration: InputDecoration(
                          fillColor: Colors.black12,
                          filled: true,
                          hintText: 'Enter Full Name ',
                          prefixIcon: const Icon(Icons.person),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter Your Name *";
                          } else {
                            return null;
                          }
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: _address,
                        autofocus: false,
                        decoration: InputDecoration(
                          fillColor: Colors.black12,
                          filled: true,
                          hintText: 'Enter your address ',
                          prefixIcon: const Icon(Icons.location_on),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),

                      TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: _emailController,
                          onChanged: (val) {
                            var email = val;
                          },
                          decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.email),
                              fillColor: Colors.black12,
                              filled: true,
                              hintText: 'Enter Email',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter Email Address *";
                            }
                            if (!RegExp(
                                    "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9._]+.[a-z]")
                                .hasMatch(value)) {
                              return "Please Enter a valid email";
                            }
                            ;
                            return null;
                          }),

                      const SizedBox(
                        height: 30,
                      ),

                      TextFormField(
                        controller: ContactEditingText,
                        // controller: ContactEditingText,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.phone),
                            fillColor: Colors.black12,
                            filled: true,
                            hintText: 'Enter Contact',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter Contact  *";
                          } else {
                            return null;
                          }
                        },
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: _isObscure,
                        decoration: InputDecoration(
                          fillColor: Colors.black12,
                          filled: true,
                          hintText: 'Enter Password',
                          prefixIcon: const Icon(Icons.lock),
                          suffixIcon: IconButton(
                              icon: Icon(_isObscure
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                              onPressed: () {
                                setState(() {
                                  _isObscure = !_isObscure;
                                });
                              }),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        validator: (value) {
                          RegExp regex = new RegExp(r'^.{6,}$');
                          if (value!.isEmpty) {
                            return "Enter Your Password *";
                          }

                          if (!regex.hasMatch(value)) {
                            return "Please Enter a valid password Min 6";
                          }
                        },
                      ),

                      const SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        controller: ConfirmPasswordEditingText,
                        // controller: ,
                        obscureText: _isObscure,
                        decoration: InputDecoration(
                          fillColor: Colors.black12,
                          filled: true,
                          hintText: 'Enter Confirm Password',
                          prefixIcon: const Icon(Icons.lock),
                          suffixIcon: IconButton(
                              icon: Icon(_isObscure
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                              onPressed: () {
                                setState(() {
                                  _isObscure = !_isObscure;
                                });
                              }),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        validator: (value) {
                          // RegExp regex = new RegExp(r'^.{6,}$');
                          // if (value!.isEmpty) {
                          //   return "Enter Confirm Password *";
                          // }
                          // if (!regex.hasMatch(value)) {
                          //   return "Please Enter a valid password Min 6";
                          // }

                          if (ConfirmPasswordEditingText.text.length > 6 &&
                              _passwordController.text != value) {
                            return "password don't match";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),

                      ElevatedButton(
                          onPressed: () {
                            signup();
                            // _createAccount();

                            // signup (  String email , password password);

                            // signup(email: _emailController, password: _passwordController)

                            // Navigator.push((context), MaterialPageRoute(builder: (context)=> VerifyEmailPage(email: _emailController.text )));
                          },
                          child: Container(
                              height: 30,
                              width: MediaQuery.of(context).size.width * 0.3,
                              child: const Center(
                                  child: Text(
                                "Register",
                                style: TextStyle(fontSize: 19),
                              )))),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "If you Already Register ",
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                          GestureDetector(
                            child: const Text("Click here",
                                style: TextStyle(
                                    decoration: TextDecoration.none,
                                    color: Colors.blue,
                                    fontSize: 15)),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Mylogin()));
                            },
                          )
                        ],
                      ),

                      //   )
                    ]),
                  ))
            ]),
          ),
        )));
  }

// void signup (String email, String Password) async {
//   if(formkey.currentState!.validate()){
//     await _auth
//         .CreateUserWithEmailandPassword(email:email, Password : Password).then(value) =>
//   } postDetailstoFireStore()})
// }

//   _createAccount() async {
//     try {
//       print("Email : ${_emailController.text.trim()}");
//       print("Email : ${_passwordController.text.trim()}");
//       var userCredential = await FirebaseAuth.instance
//           .createUserWithEmailAndPassword(
//           email: _emailController.text.trim(),
//           password: _passwordController.text.trim()
//       ).then((value) =>
//       {
//         Navigator.push(
//             context, MaterialPageRoute(builder: (context) => MyApp()))
//       });
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'weak-password') {
//         print('The password provided is too weak.');
//       } else if (e.code == 'email-already-in-use') {
//         print('The account already exists for that email.');
//       }
//     } catch (e) {
//       print("Error $e");
//
//
//       void validateEmail(String val) {
//         if (val.isEmpty) {
//           setState(() {
//             _errorMessage = "Email can not be empty";
//           });
//         } else if (!EmailValidator.validate(val, true)) {
//           setState(() {
//             _errorMessage = "Invalid Email Address";
//           });
//         } else {
//           setState(() {
//             _errorMessage = "";
//           });
//         }
//       }
//     }
//   }
// }

// void signup(String email, String password) async
// {
//        if () // if (formkey.currentState!.validate()
//
//   {
//     await _auth.createUserWithEmailAndPassword(email: email, password: password)
//         .then((value) => {
//       postDetailsToFirestore()}).catchError((e){
//       Fluttertoast.showToast(msg: e!.message);
//     });
//   }
// }
// postDetailsToFirestore() async {
//   //calling our firestore
//   //calling our user model
//   //sending these valued
//
//   FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
//   User? user = _auth.currentUser;
//   UserModel userModel =UserModel();
//
//   //writing all the values
//   userModel.email = user!.email;
//   userModel.fullname = name.text;
//   // userModel.email = email.text;
//   userModel.address = address.text;
//   userModel.phonenumber =phonenumber.text;
//   userModel.hotelname = hotelname.text;
//   userModel.password = password.text;
//   userModel.conformpassword = conformpassword.text;
//
//
//
//   await firebaseFirestore.collection("users")
//       .doc(user.uid)
//       .set(userModel.toMap());
//   Fluttertoast.showToast(msg: "Account has been created");
//
//   // Navigator.pushAndRemoveUntil((context), MaterialPageRoute(builder: (context)=> Mylogin()), (route) => false);
//
//   Navigator.pushAndRemoveUntil((context), MaterialPageRoute(builder: (context) => Mylogin()), (route) => false);
// }

}
