import 'dart:async';


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:smarttourism/Bottom_nav_bar/bottom_nav_bar.dart';
import 'package:smarttourism/Widgets/iconbutton.dart';
import '../Models/firebase_storage.dart';
import '../Widgets/error_message.dart';

class VerifyEmailPage extends StatefulWidget {
  final String email;

  const VerifyEmailPage(
      {Key? key,
        required this.email,
      })
      : super(key: key);

  @override
  State<VerifyEmailPage> createState() => _VerifyEmailPageState();
}

class _VerifyEmailPageState extends State<VerifyEmailPage> {
  bool isEmailVerify = false;
  Timer? timer;
  bool canResend = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    isEmailVerify = FirebaseAuth.instance.currentUser!.emailVerified;

    if (!isEmailVerify) {
      sendVerificationLink();

      timer = Timer.periodic(const Duration(seconds: 3), (_) {
        checkEmailVerify();
      });
    }
  }

  Future checkEmailVerify() async {
    await FirebaseAuth.instance.currentUser!.reload();
    setState(() {
      isEmailVerify = FirebaseAuth.instance.currentUser!.emailVerified;
    });
    if (isEmailVerify) timer?.cancel();
  }

  @override
  void dispose() {
    timer?.cancel();
  }

  Future sendVerificationLink() async {
    try {
      final user = FirebaseAuth.instance.currentUser!;
      await user.sendEmailVerification();
      setState(() => canResend = false);
      await Future.delayed(
        const Duration(seconds: 10),
      );
      setState(() => canResend = true);
    } catch (err) {
      showSnackBar(context, err.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return isEmailVerify
        ? const MyApp(
       )
        : Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(child: Container()),
            Container(
              height: MediaQuery.of(context).size.height / 2 - 80,
              margin: const EdgeInsets.all(15),
              padding:
              const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12.withOpacity(.1),
                    spreadRadius: 5,
                    blurRadius: 1,
                    blurStyle: BlurStyle.outer,
                  ),
                ],
                borderRadius: BorderRadius.circular(0),
                border: Border.all(
                    width: 2,
                    color: Colors.black45,
                    style: BorderStyle.solid),
                color: Colors.white70,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.mark_email_read,
                    size: 80,
                  ),
                  Spacer(),
                  Text(
                    "Verification link has been send to your email",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Spacer(),
                  Text(
                    "Check your email for Verification  link.",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: CostumIconButton(
                onTap: () => canResend ? sendVerificationLink : null,
                color: Colors.blue.shade600,
                text: "Resend",
                icons: MdiIcons.email,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: CostumIconButton(
                onTap: () => FireStoreMethods().signOut(),
                color: Colors.blue.shade600,
                text: "Cancel",
                icons: MdiIcons.cancel,
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
