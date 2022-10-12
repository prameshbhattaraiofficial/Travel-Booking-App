


import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:smarttourism/user/Welcomepage.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'welcome',
    routes: {'welcome' : (context)=>Welcomepage(),},
  ));
}

