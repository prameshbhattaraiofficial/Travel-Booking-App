import 'package:flutter/material.dart';
import 'package:smarttourism/user/mylogin.dart';

class AfterLinkSent extends StatefulWidget {
  final String email;

  const AfterLinkSent({Key? key, required this.email}) : super(key: key);

  @override
  State<AfterLinkSent> createState() => _AfterLinkSentState();
}

class _AfterLinkSentState extends State<AfterLinkSent> {
  void initState() {
    // TODO: implement initState
    super.initState();
    navto();
  }

  navto() async {
    await Future.delayed(
      const Duration(
        seconds: 15,
      ),
    );
    push();
  }

  push() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const Mylogin(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height / 2 - 80,
          margin: const EdgeInsets.all(15),
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(0),
            border: Border.all(
                width: 2, color: Colors.black45, style: BorderStyle.solid),
            color: Colors.white24,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.mark_email_read,
                size: 80,
              ),
              const Spacer(),
              const Text(
                "Email has been send to:",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              Text(
                widget.email,
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.red,
                ),
              ),
              const Spacer(),
              const Text(
                "Check your email for password reset link.",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
