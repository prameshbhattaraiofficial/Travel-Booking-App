import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smarttourism/Bottom_nav_bar/bottom_nav_bar.dart';
import 'package:smarttourism/Models/forget_password.dart';
import 'package:smarttourism/Models/users.dart';
import 'package:smarttourism/user/Emailauth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smarttourism/Models/users.dart';
import 'package:smarttourism/user/register.dart';
import 'package:smarttourism/admin/Dashboard.dart';

import '../Models/firebase_storage.dart';
import '../Widgets/error_message.dart';

class Mylogin extends StatefulWidget {
  const Mylogin({Key? key}) : super(key: key);

  @override
  State<Mylogin> createState() => _MyloginState();
}

class _MyloginState extends State<Mylogin> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;

  // final email = GlobalKey<FormState>();
  // final password = GlobalKey<FormState>();
  // final confirmpassword = GlobalKey<FormState>();
  // final contact = GlobalKey<FormState>();
  // final address = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _confirmpasswordController = TextEditingController();
  final _addressController = TextEditingController();
  final phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final FullnameController = TextEditingController();

  bool isremember = false;
  bool _isObscure = true;
  bool _isloading = false;

  void login() async {
    setState(() {
      _isloading = true;
    });
    String res = await FireStoreMethods().loginUser(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),

    );

    if (res == "success") {
      setState(() {
        _isloading = false;
      });
      Fluttertoast.showToast(msg: "Successfully Login");
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MyApp()));
    } else {
      setState(() {
        _isloading = false;
      });

      showSnackBar(context, res);
    }
  }


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
                  const SizedBox(
                    height: 120,
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Column(
                        children: [
                          Container(
                              decoration: const BoxDecoration(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(12))),
                              child: Image.asset(
                                "Assets/logo.png",
                                width: 100,
                                height: 100,
                              )),
                          const Text(
                            "Login",
                            style: TextStyle(fontSize: 20, color: Colors.green),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          TextFormField(
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
                                  return "Please Enter Your Email *";
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
                                  return "Please Enter Your Password *";
                                }
                                if (!regex.hasMatch(value)) {
                                  return "Please Enter a valid password Min 6";
                                }
                              }),
                          const SizedBox(
                            height: 30,
                          ),
                          ElevatedButton(
                              onPressed: () {
                                // route();
                                login();
                                //signIn(_emailController.text,
                                  //  _passwordController.text);
                              },
                              child: const Text("Login")),
                          const SizedBox(
                            height: 30,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  child: Row(
                                    children: [
                                      Checkbox(
                                          value: isremember,
                                          onChanged: (value) {
                                            setState(() {
                                              isremember = value!;
                                            });
                                          }),
                                      const Text("Remember Me",
                                          style: TextStyle(
                                              decoration: TextDecoration.none,
                                              color: Colors.blue,
                                              fontSize: 15)),
                                    ],
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                            const Emailauth()));
                                  },
                                ),
                                GestureDetector(
                                  child: const Text("Forget Password",
                                      style: TextStyle(
                                          decoration: TextDecoration.none,
                                          color: Colors.blue)),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                            const ForgetpasswordScreen()));
                                  },
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                              child: Row(
                                children: [
                                  const Text("If you have not account "),
                                  GestureDetector(
                                    child: const Text("Click me",
                                        style: TextStyle(
                                            decoration: TextDecoration.none,
                                            color: Colors.blue)),
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                              const Registerpage()));
                                    },
                                  ),
                                ],
                              ),
                              padding: const EdgeInsets.only(left: 50))
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

// _loginUser() async{
//   try {
//     var userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
//         email: _emailController.text.trim(),
//         password: _passwordController.text.trim()
//     ).then((value) => {
//     Navigator.push(
//     context,
//     MaterialPageRoute(builder: (context) =>  MyApp()),
//     )
//     });
//   } on FirebaseAuthException catch (e) {
//     if (e.code == 'user-not-found') {
//       print('No user found for that email.');
//     } else if (e.code == 'wrong-password') {
//       print('Wrong password provided for that user.');
//     }
//
//
//   }
// }
//

//}

//
//   void signup(String email, String password) async
//   {
//     if (formkey.currentState!.validate()
//     ) {
//       await _auth.createUserWithEmailAndPassword(
//           email: email, password: password)
//           .then((value) =>
//       {
//         postDetailsToFirestore()}).catchError((e) {
//         Fluttertoast.showToast(msg: e!.message);
//       });
//     }
//   }
//
//   postDetailsToFirestore() async {
//     //calling our firestore
//     //calling our user model
//     //sending these valued
//
//     FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
//     User? user = _auth.currentUser;
//     UserModel userModel = UserModel();
//
//     //writing all the values
//     userModel.email = user!.email;
//     userModel.fullname = FullnameController.text;
//     userModel.email = _emailController.text;
//     userModel.address = _addressController.text;
//     userModel.phonenumber = phoneController.text;
//
//
//     userModel.password = _passwordController.toString();
//     userModel.confirmpassword = _confirmpasswordController.toString();
//
//
//     await firebaseFirestore.collection("users")
//         .doc(user.uid)
//         .set(userModel.toMap());
//     Fluttertoast.showToast(msg: "Account has been created");
//
//     Navigator.pushAndRemoveUntil(
//         (context), MaterialPageRoute(builder: (context) => Mylogin()), (
//         route) => false);
//   }
// }

///////////////////////// Usable Code //////////////////////////////////////////////////////////////////////////////

void signin(String email, String password) async {
  if (formkey.currentState!.validate()) {
    await _auth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((uid) =>
    {
      Fluttertoast.showToast(msg: "Login Successful"),
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => MyApp())),
    }).catchError((e) {
      Fluttertoast.showToast(msg: e!.message);
    });
  }
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// void route() {
//   User? user = FirebaseAuth.instance.currentUser;
//   var kk = FirebaseFirestore.instance
//       .collection('users')
//       .doc(user!.uid)
//       .get()
//       .then((DocumentSnapshot documentSnapshot) {
//     if (documentSnapshot.exists) {
//       if (documentSnapshot.get('role') == "Admin") {
//         Fluttertoast.showToast(msg: "Login Successfull");
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(
//             builder: (context) => DashBoards(),
//           ),
//         );
//       } else {
//         Fluttertoast.showToast(msg: "Login Successfull");
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(
//             builder: (context) => Dashboard(),
//           ),
//         );
//       }
//     } else {
//       print('Document does not exist on the database');
//     }
//   });
// }
//
// //login function
// void signIn(String email, String password) async {
//   CircularProgressIndicator(
//     backgroundColor: Colors.cyan,
//   );
//   if (formkey.currentState!.validate() ){
//     try {
//       UserCredential userCredential = await _auth.signInWithEmailAndPassword(
//           email: email, password: password);
//       route();
//     } on FirebaseAuthException catch (e) {
//       Fluttertoast.showToast(msg: e.code);
//     }
//   }
//
// }


//   void route() {
//     User? user = FirebaseAuth.instance.currentUser;
//     var kk = FirebaseFirestore.instance
//         .collection('Users')
//         .doc(user!.uid)
//         .get()
//         .then((DocumentSnapshot documentSnapshot) {
//       if (documentSnapshot.exists) {
//         if (documentSnapshot.get('role') == "Admin") {
//           Navigator.pushReplacement(
//             context,
//             MaterialPageRoute(
//               builder: (context) =>  DashBoards(),
//             ),
//           );
//         }else{
//           Navigator.pushReplacement(
//             context,
//             MaterialPageRoute(
//               builder: (context) =>  MyApp(),
//             ),
//           );
//         }
//       } else {
//         print('Document does not exist on the database');
//       }
//     });
//   }
//
//   void signIn(String email, String password) async {
//     if (formkey.currentState!.validate()) {
//       try {
//         UserCredential userCredential =
//         await FirebaseAuth.instance.signInWithEmailAndPassword(
//           email: email,
//           password: password,
//         );
//         route();
//       } on FirebaseAuthException catch (e) {
//         if (e.code == 'user-not-found') {
//           print('No user found for that email.');
//         } else if (e.code == 'wrong-password') {
//           print('Wrong password provided for that user.');
//         }
//       }
//     }
//   }
// }
}


