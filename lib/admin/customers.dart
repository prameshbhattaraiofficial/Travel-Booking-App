import 'package:flutter/material.dart';

class CustomerAdmin extends StatefulWidget {
  const CustomerAdmin({Key? key}) : super(key: key);

  @override
  State<CustomerAdmin> createState() => _CustomerAdminState();
}

class _CustomerAdminState extends State<CustomerAdmin> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: ListView(
          children: [
            Text("Welcome to Customer Admin")
          ],
        ),
      ),
    );
  }
}
