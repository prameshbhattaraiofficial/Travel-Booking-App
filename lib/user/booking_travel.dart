import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../Models/firebase_storage.dart';
import '../Widgets/error_message.dart';

import 'package:http/http.dart' as http;

class TravelBooking extends StatefulWidget {
  const TravelBooking({Key? key}) : super(key: key);

  @override
  State<TravelBooking> createState() => _TravelBookingState();
}

class _TravelBookingState extends State<TravelBooking> {

  // Future sendEmail() async{
  //   final url = Uri.parse("https://api.emailjs.com/api/v1.0/email/send");
  //   const serviceId = 'service_7qc5cpe';
  //   const templateId = 'template_riqf1rc';
  //   const userId = '';
  //   final response = await http.post(url, headers: {'Content-Type':'application/json'},
  //
  //     body: json.encode ({
  //       'service-id' :
  //     })
  //
  //
  //   );
  //
  // }


  bool isLoading = false;
  var userData = {};

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
    setState(() {
      isLoading = true;
    });

    try {
      var userSnap = await FirebaseFirestore.instance
          .collection('Users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get();

      userData = userSnap.data()!;
    } catch (e) {
      showSnackBar(
        context,
        e.toString(),
      );
    }
    setState(() {
      isLoading = false;
    });
  }

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _totalController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _currentAddressController = TextEditingController();
  final TextEditingController _destinationAddressController = TextEditingController();

  void book(

      String name,
      String date,
      String total,
      String currentAddress,
      String phoneNumber,
      String destinationAddress) async {
    try {
      String res = await FireStoreMethods().bookNow(
        date,
        name,
        total,
        currentAddress,
        phoneNumber,
        destinationAddress,

      );
      if (res == 'success') {
        Fluttertoast.showToast(msg: "Successfully booking");
      }
      if (res != 'success') {
        showSnackBar(context, res);
      }
    } catch (err) {
      showSnackBar(
        context,
        err.toString(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Scaffold(
          body: Container(
            padding: const EdgeInsets.all(15),
            child: Form(
              child: ListView(
                children: [
                  Text(
                    "Booking System",
                    style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Note : Payment Physically Chabahil Kathmandu ",
                    style: TextStyle(color: Colors.red),
                  ),
                  const Text("Enter Your Name"),
                  TextFormField(
                    controller: _nameController,
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
                    height: 15,
                  ),
                  const Text("Enter Your date"),
                  TextFormField(
                    controller: _dateController,
                    autofocus: false,
                    decoration: InputDecoration(
                      fillColor: Colors.black12,
                      filled: true,
                      hintText: 'Enter date time  ',
                      prefixIcon: const Icon(Icons.calendar_today_rounded),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter date time *";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text("Enter Current address"),
                  TextFormField(
                    controller: _currentAddressController,
                    autofocus: false,
                    decoration: InputDecoration(
                      fillColor: Colors.black12,
                      filled: true,
                      hintText: 'Enter current address  ',
                      prefixIcon: const Icon(Icons.location_on),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter address*";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text("Enter Destination address"),
                  TextFormField(
                    controller: _destinationAddressController,
                    autofocus: false,
                    decoration: InputDecoration(
                      fillColor: Colors.black12,
                      filled: true,
                      hintText: 'Enter Destination address  ',
                      prefixIcon: const Icon(Icons.location_on),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter address*";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text("Enter Your phone Number"),
                  TextFormField(
                    controller: _numberController,
                    autofocus: false,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      fillColor: Colors.black12,
                      filled: true,
                      hintText: 'Enter number  ',
                      prefixIcon: const Icon(Icons.contact_phone),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter number *";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(" Total Person "),
                  TextFormField(
                    controller: _totalController,
                    keyboardType: TextInputType.number,
                    autofocus: false,
                    decoration: InputDecoration(
                      fillColor: Colors.black12,
                      filled: true,
                      hintText: 'total person ',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter total people *";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        book(
                          _nameController.text,
                          _dateController.text,
                          _totalController.text,
                          _currentAddressController.text,
                          _numberController.text,
                          _destinationAddressController.text,
                        );
                      },
                      child: const Text("Book Now"))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
