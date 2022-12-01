import 'dart:io';



import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:smarttourism/admin/Analysis.dart';
import 'package:smarttourism/admin/Dashboard.dart';
import 'package:smarttourism/admin/Hotelbooking.dart';
import 'package:smarttourism/admin/customers.dart';
import 'package:smarttourism/admin/messages.dart';
import 'package:smarttourism/admin/setting.dart';
import 'package:smarttourism/user/Welcomepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:smarttourism/user/mylogin.dart';

class Adding_Travel extends StatefulWidget {
  const Adding_Travel({Key? key}) : super(key: key);

  @override
  State<Adding_Travel> createState() => _Adding_TravelState();
}

class _Adding_TravelState extends State<Adding_Travel> {

   FirebaseFirestore firestoreref = FirebaseFirestore.instance;
   FirebaseStorage storageref = FirebaseStorage.instance;

  String imagename  = "";
  XFile? image;
  final ImagePicker Picker = ImagePicker();



  Future GetImage(ImageSource media) async {
    var img = await Picker.pickImage(source: media);

    setState(() {
      image = img;
    });
  }

  void myAlert() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            title: Text('Please choose media to select'),
            content: Container(
              height: MediaQuery.of(context).size.height / 6,
              child: Column(
                children: [
                  ElevatedButton(
                    //if user click this button, user can upload image from gallery
                    onPressed: () {
                      Navigator.pop(context);
                      GetImage(ImageSource.gallery);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.image),
                        Text('From Gallery'),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    //if user click this button. user can upload image from camera
                    onPressed: () {
                      Navigator.pop(context);
                      GetImage(ImageSource.camera);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.camera),
                        Text('From Camera'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  GlobalKey<FormState> formkey = GlobalKey<FormState>();


  final  TextEditingController TravelName = TextEditingController();
  final  TextEditingController PriceName = TextEditingController();


  Future<void> Logout() async{
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Mylogin()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),

        ),
        drawer: Drawer(
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.only(top: 50),
            children: [

              ListTile(
                leading: Icon(
                  Icons.home,
                ),
                title: const Text('Home'),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> Dashboard()));
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
                leading: Icon(
                  Icons.message,
                ),
                title: const Text('Messages'),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> Messages()));
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.analytics,
                ),
                title: const Text('Analysis'),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> Analysis()));
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.book,
                ),
                title: const Text('Hotel Booking'),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> Hotelbooking()));
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.place,
                ),
                title: const Text('Adding Places'),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> Adding_Travel()));
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.settings,
                ),
                title: const Text('Settings'),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> Setting()));
                },
              ),
              SizedBox(height: 300,),
              ListTile(
                leading: Icon(
                  Icons.logout,
                ),
                title: const Text('Logout'),
                onTap: () {

                  Logout();
                  // Navigator.push(context, MaterialPageRoute(builder: (context)=> Welcomepage()));
                },
              ),

            ],
          ),
        ),

        body:
        ListView(
            children: [

              Container(

                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height*0.1
                ),
                child: Form(
                  key: formkey,
                  child: Column(
                      children: [

                        // Image(image: AssetImage('Assets/logo.png'),
                        //   width: 100,),
                        //
                        // SizedBox(height: 20,),

                        Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Text("Adding a Different Places",style: TextStyle(
                              fontSize: 20
                          ),),
                        ),

                        SizedBox(height: 20,),

                        SizedBox(height: 10,),

                        Padding(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: TextFormField(
                            controller: TravelName,
                              keyboardType: TextInputType.emailAddress,
                              onChanged: (val) {
                                var email = val;
                              },
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.place),
                                  fillColor: Colors.black12,
                                  filled: true,
                                  hintText: 'Enter Place Name',
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

                        SizedBox(height: 10,),
                        Padding(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: TextFormField(
                            controller: PriceName,
                              keyboardType: TextInputType.phone,
                              onChanged: (val) {
                                var email = val;
                              },
                              decoration: InputDecoration(

                                  fillColor: Colors.black12,
                                  filled: true,
                                  hintText: 'Enter Price',
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


                        ElevatedButton(
                          onPressed: () {
                            myAlert();
                          },
                          child: Text('Image'),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        //if image not null show the image
                        //if image null show text
                        image != null
                            ? Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.file(
                              //to show image, you type like this.
                              File(image!.path),
                              fit: BoxFit.cover,
                              width: MediaQuery.of(context).size.width,
                              height: 300,
                            ),
                          ),
                        )
                            : Text(
                          "No Image",
                          style: TextStyle(fontSize: 20),
                        ),


                        Padding(
                          padding: EdgeInsets.only(left: 10,right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [



                            ],
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ElevatedButton(onPressed: (){

                                // upload function


                              }, child: Text("Upload")),

                              ElevatedButton(onPressed: (){}, child: Text("Reset")),
                            ],
                          ),
                        )




                      ]),
                ),
              ),]));




  }

  _UploadImage() async{
    var UniqueKey = firestoreref.collection(imagename);
    String UploadFileName = DateTime.now().millisecondsSinceEpoch.toString() +'.jpg';

    Reference reference = storageref.ref().child(UploadFileName);
    // UploadTask uploadTask = reference.putFile(File(kImagePath!.padLeft(width)))

    // UploadTask.snapshotEvents.listen(event){
    //
    // }


  }
}





