import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserNotification extends StatefulWidget {
  const UserNotification({Key? key}) : super(key: key);

  @override
  State<UserNotification> createState() => _UserNotificationState();
}

class _UserNotificationState extends State<UserNotification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
    //   body: Container(
    //     child: StreamBuilder(
    //       stream: FirebaseFirestore.instance.collection('Book').snapshots(),
    //       builder: (context, AsyncSnapshot<QuerySnapshot> snapshot){
    //
    //     },
    //     ),
    //   ),
    // );
    // SafeArea
    //   (child: Scaffold(
    // body: Container(
    //   child: StreamBuilder( stream: FirebaseFirestore.instance.collection('Book').snapshots(),
    //   builder: (context, AsyncSnapshot<QuerySnapshot> Snapshot) {
    //     if(Snapshot.hasData){
    //       return ListView.builder(
    //         itemCount: Snapshot.data?.docs.length,
    //           itemBuilder: (context, index) =>
    //               Padding(
    //                 padding: const EdgeInsets.all(8.0),
    //                 child: Container(
    //             decoration: BoxDecoration(
    //                 borderRadius: BorderRadius.circular(12)
    //             ),
    //             child: Row(
    //                 children: [
    //                   Container(child: Text(Snapshot.data?.docs[index]['fullName']
    //                   )),
    //                   Container()
    //                 ],
    //             ),
    //           ),
    //               ));
    //     }else(){
    //       return Container();
    //     };
    //   },
    //
    //
    //   ),
    // child: StreamBuilder(
    //   stream: FirebaseFirestore.instance.collection('Book').snapshots(),
    //   // builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
    //   builder: (context,AsyncSnapshot<QuerySnapshot> snapshot ){
    //     if (snapshot.hasData){
    //       return ListView.builder(
    //         itemCount: snapshot.data.docs.length,
    //           itemBuilder: (context, index) = Container());
    //
    //     }
    //     else(){
    //       return Container();
    //     };
    //   },
    // ),
    //   ),
    // ));
  }

}

