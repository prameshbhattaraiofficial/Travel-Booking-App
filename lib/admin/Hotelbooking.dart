import 'dart:io';
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smarttourism/admin/Adding_Travel.dart';
import 'package:smarttourism/admin/Analysis.dart';
import 'package:smarttourism/admin/Dashboard.dart';
import 'package:smarttourism/admin/customers.dart';
import 'package:smarttourism/admin/messages.dart';
import 'package:smarttourism/admin/setting.dart';
import 'package:smarttourism/user/Welcomepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:smarttourism/user/mylogin.dart';
import 'package:smarttourism/Firebase_Storage/storage_method.dart';
import 'package:smarttourism/Models/firebase_storage.dart';
import 'package:smarttourism/Widgets/error_message.dart';

class Hotelbooking extends StatefulWidget {
  const Hotelbooking({Key? key}) : super(key: key);

  @override
  State<Hotelbooking> createState() => _HotelbookingState();
}

class _HotelbookingState extends State<Hotelbooking> {
  String username = "";
  String uid = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUsername();
  }

  void getUsername() async {
    DocumentSnapshot snap = await FirebaseFirestore.instance
        .collection("Users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();

    setState(() {
      username = (snap.data() as Map<String, dynamic>)['fullName'];
      uid = (snap.data() as Map<String, dynamic>)['uid'];
    });
  }

  bool _isLoading = false;
  Future<void> Logout() async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const Mylogin()));
  }

  Uint8List? _file;
  final ImagePicker Picker = ImagePicker();

  final TextEditingController _HotelName = TextEditingController();
  final TextEditingController _Pricevalue = TextEditingController();
  _selectImage() async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text('Create a Post'),
          children: <Widget>[
            SimpleDialogOption(
                padding: const EdgeInsets.all(20),
                child: const Text('Take a photo'),
                onPressed: () async {
                  Navigator.pop(context);
                  Uint8List file = await pickImage(ImageSource.camera);
                  setState(() {
                    _file = file;
                  });
                }),
            SimpleDialogOption(
                padding: const EdgeInsets.all(20),
                child: const Text('Choose from Gallery'),
                onPressed: () async {
                  Navigator.of(context).pop();
                  Uint8List file = await pickImage(ImageSource.gallery);
                  setState(() {
                    _file = file;
                  });
                }),
            SimpleDialogOption(
              padding: const EdgeInsets.all(20),
              child: const Text("Cancel"),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        );
      },
    );
  }

  void postData(String name, String uid) async {
    setState(() {
      _isLoading = true;
    });
    try {
      String res = await FireStoreMethods()
          .uploadPost(_HotelName.text, _file!, name, _Pricevalue.text, uid);
      if (res == "success") {
        setState(() {
          _isLoading = false;
        });
        showSnackBar(
          context,
          'Posted!',
        );
      } else {
        showSnackBar(context, res);
      }
    } catch (err) {
      setState(() {
        _isLoading = false;
      });
      showSnackBar(
        context,
        err.toString(),
      );
    }
  }

  GlobalKey<FormState> formkey = GlobalKey<FormState>();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
        ),
        drawer: Drawer(
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: const EdgeInsets.only(top: 50),
            children: [
              ListTile(
                leading: const Icon(
                  Icons.home,
                ),
                title: const Text('Home'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Dashboard()));
                },
              ),
              // ListTile(
              //   leading: Icon(
              //     Icons.people,
              //   ),
              //   title: const Text('Customer'),
              //   onTap: () {
              //     Navigator.push(context, MaterialPageRoute(builder: (context)=> CustomerAdmin()));
              //   },
              // ),

              ListTile(
                leading: const Icon(
                  Icons.message,
                ),
                title: const Text('Messages'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Messages()));
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.analytics,
                ),
                title: const Text('Analysis'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Analysis()));
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.book,
                ),
                title: const Text('Hotel Booking'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Hotelbooking()));
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.place,
                ),
                title: const Text('Adding Places'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Adding_Travel()));
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.settings,
                ),
                title: const Text('Settings'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Setting()));
                },
              ),
              const SizedBox(
                height: 300,
              ),
              ListTile(
                leading: const Icon(
                  Icons.logout,
                ),
                title: const Text('Logout'),
                onTap: () {
                  // Navigator.of(context).pop();
                  // ref.read(authProvider).userLogOut();
                  Logout();
                },
              ),
            ],
          ),
        ),
        body: ListView(children: [
          Container(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
            child: Form(
              key: formkey,
              child: Column(children: [
                // Image(image: AssetImage('Assets/logo.png'),
                //   width: 100,),
                //
                // SizedBox(height: 20,),

                const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    "Adding a Different Hotels",
                    style: TextStyle(fontSize: 20),
                  ),
                ),

                const SizedBox(
                  height: 30,
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: TextFormField(
                      controller: _HotelName,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.place),
                          fillColor: Colors.black12,
                          filled: true,
                          hintText: 'Enter Hotel Name',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),

                      ),
                ),

                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: TextFormField(
                      controller: _Pricevalue,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          fillColor: Colors.black12,
                          filled: true,
                          hintText: 'Enter Price',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                     ),
                ),
                const SizedBox(
                  height: 20,
                ),

                ElevatedButton(
                  onPressed: () {
                    _selectImage();
                  },
                  child: const Text('Image'),
                ),
                const SizedBox(
                  height: 10,
                ),
                //if image not null show the image
                //if image null show text
                _file != null
                    ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image(
                            image: MemoryImage(_file!),
                          ),
                        ),
                      )
                    : const Text(
                        "No Image",
                        style: TextStyle(fontSize: 20),
                      ),

                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            postData(username, uid);
                          },
                          child: const Text("Upload")),
                      ElevatedButton(
                          onPressed: () {}, child: const Text("Reset")),
                    ],
                  ),
                )
              ]),
            ),
          ),
        ]));
  }
}
