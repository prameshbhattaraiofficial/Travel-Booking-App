import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Hotelbooking extends StatefulWidget {
  const Hotelbooking({Key? key}) : super(key: key);

  @override
  State<Hotelbooking> createState() => _HotelbookingState();
}

class _HotelbookingState extends State<Hotelbooking> {

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


  final  TextEditingController NameEditingController = TextEditingController();
  final  TextEditingController Placeeditingcontroller = TextEditingController();
  final TextEditingController PriceEditingController = TextEditingController();
  final TextEditingController ImageEditingController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(

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
                          child: Text("Adding a Different Hotels",style: TextStyle(
                              fontSize: 20
                          ),),
                        ),

                        SizedBox(height: 20,),

                        SizedBox(height: 10,),

                        Padding(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              onChanged: (val) {
                                var email = val;
                              },
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.place),
                                  fillColor: Colors.black12,
                                  filled: true,
                                  hintText: 'Enter Hotel Name',
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

                        ElevatedButton(onPressed: (){}, child: Text("Upload"))
                      ]),
                ),
              ),]));

  }
}




