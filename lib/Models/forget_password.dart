

import 'package:flutter/material.dart';
import 'afterlinksend.dart';
import 'firebase_storage.dart';


class ForgetpasswordScreen extends StatefulWidget {
  const ForgetpasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgetpasswordScreen> createState() => _ForgetpasswordScreenState();
}

class _ForgetpasswordScreenState extends State<ForgetpasswordScreen> {
  final TextEditingController _emailController = TextEditingController();

  bool _isloading = false;

  @override
  void dispose() {
    // TODO: implement dispose
    _emailController.dispose();
    super.dispose();
  }

  goto() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AfterLinkSent(email: _emailController.text),
        ));
  }

  Future resetPassword() async {
    setState(() {
      _isloading = true;
    });
    String res = await FireStoreMethods().passwordReset(email: _emailController.text);

    if (res == "success") {
      goto();
      setState(() {
        _isloading = false;
      });
    } else {
      setState(() {
        _isloading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(res),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   automaticallyImplyLeading: true,
      //   title: const Text('Forget Password'),
     // ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Enter your valid email for password rest link:",
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 10,
            ),
          TextField(
            controller:  _emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.email_outlined),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Colors.transparent, width: 0),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Colors.transparent, width: 0),
              ),
              contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              hintText:  "Enter your email",
              hintStyle: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),

            const SizedBox(
              height: 10,
            ),
            MaterialButton(
              onPressed: (){resetPassword();},
              minWidth: double.infinity,
              color: Colors.blue,
              splashColor: Colors.blueAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: !_isloading
                    ? const Text(
                  "Send",
                  style: TextStyle(color: Colors.black87, fontSize: 20),
                )
                    : const CircularProgressIndicator(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
