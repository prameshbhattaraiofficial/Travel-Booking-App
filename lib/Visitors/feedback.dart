import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../Models/firebase_storage.dart';
import '../Widgets/error_message.dart';

class Feedbacksystem extends StatefulWidget {
  const Feedbacksystem({Key? key}) : super(key: key);

  @override
  State<Feedbacksystem> createState() => _FeedbacksystemState();
}

class _FeedbacksystemState extends State<Feedbacksystem> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  void feedbackpost() async {
    try {
      String res = await FireStoreMethods().sendFeedBack(
        _descriptionController.text,
        _emailController.text,
        _fullNameController.text,
      );

      if (res != 'success') {
        showSnackBar(context, res);
      }
      setState(() {
        _emailController.text = "";
        _fullNameController.text = '';
        _descriptionController.text = "";
      });
      Fluttertoast.showToast(msg: "Feedback Successfully");
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
                  Text("Feedback System", style: TextStyle(
                    fontSize: 32, fontWeight: FontWeight.bold, color: Colors.blue
                  ),),
                  const SizedBox(
                    height: 120,
                  ),
                  const Text("Enter Your Name"),
                  TextFormField(
                    controller: _fullNameController,
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
                  const Text("Enter Your Email"),
                  TextFormField(
                    controller: _emailController,
                    autofocus: false,
                    decoration: InputDecoration(
                      fillColor: Colors.black12,
                      filled: true,
                      hintText: 'Enter Email  ',
                      prefixIcon: const Icon(Icons.email),
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
                  const Text("Feedback Text"),
                  TextFormField(
                    controller: _descriptionController,
                    keyboardType: TextInputType.multiline,
                    maxLines: 5,
                    autofocus: false,
                    decoration: InputDecoration(
                      fillColor: Colors.black12,
                      filled: true,
                      hintText: 'Enter Your Feedback ',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter Your Feedback *";
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
                        feedbackpost();
                      },
                      child: const Text("Send"))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
