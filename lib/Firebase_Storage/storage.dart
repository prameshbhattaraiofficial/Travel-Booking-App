// import 'dart:typed_data';
// import 'package:cloud_firestore/cloud_firestore.dart';
//
//
//
// class FireStoreMethods {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//
//   Future<String> uploadPost(String description, Uint8List file, String uid,
//       String username, String profImage) async {
//     String res = "Some error occurred";
//     try {
//       if (description.isNotEmpty) {
//         String photoUrl =
//         await StorageMethods().uploadImageToStorage('Posts', file, true);
//         String postId = const Uuid().v1(); // creates unique id based on time
//         Post post = Post(
//           description: description,
//           uid: uid,
//           username: username,
//           postId: postId,
//           datePublished: DateTime.now(),
//           postUrl: photoUrl,
//           profImage: profImage,
//         );
//         _firestore.collection('Posts').doc(postId).set(post.toJson());
//         res = "success";
//       }
//     } catch (err) {
//       res = err.toString();
//     }
//     return res;
//   }
//
//   Future<String> deletePost(String postId) async {
//     String res = "Some error occurred";
//     try {
//       await _firestore.collection('Posts').doc(postId).delete();
//       res = 'success';
//     } catch (err) {
//       res = err.toString();
//     }
//     return res;
//   }
//
//   Future<String> postComment(String postId, String text, String uid,
//       String name, String profilePic) async {
//     String res = "Some error occurred";
//     try {
//       if (text.isNotEmpty) {
//         String commentId = const Uuid().v1();
//         _firestore
//             .collection('Posts')
//             .doc(postId)
//             .collection('comments')
//             .doc(commentId)
//             .set({
//           'profilePic': profilePic,
//           'name': name,
//           'uid': uid,
//           'text': text,
//           'commentId': commentId,
//           'datePublished': DateTime.now(),
//         });
//         res = 'success';
//       } else {
//         res = "Please enter text";
//       }
//     } catch (err) {
//       res = err.toString();
//     }
//     return res;
//   }
//
//   Future<String> Notification(String title, String username, String description,
//       String uid, String profilePic) async {
//     String res = "Some error occurred";
//     try {
//       if (description.isNotEmpty) {
//         String notificationId = const Uuid().v1();
//         _firestore
//             .collection('Users')
//             .doc(uid)
//             .collection('Notification')
//             .doc(notificationId)
//             .set({
//           'profilePic': profilePic,
//           'Username': username,
//           'uid': uid,
//           'title': title,
//           'description': description,
//           'datePublished': DateTime.now(),
//         });
//         res = 'success';
//       } else {
//         res = "No notification sent..";
//       }
//     } catch (err) {
//       res = err.toString();
//     }
//     return res;
//   }
//
//   Future<String> postReport(String username, String description, String uid,
//       String postId, String profilePic) async {
//     String res = "Some error occurred";
//     try {
//       if (description.isNotEmpty) {
//         String postReportId = const Uid().v1();
//         _firestore
//             .collection('Posts')
//             .doc(postId)
//             .collection('Report')
//             .doc(postReportId)
//             .set({
//           'profilePic': profilePic,
//           'Username': username,
//           'uid': uid,
//           'postId': postId,
//           'description': description,
//           'datePublished': DateTime.now(),
//         });
//         res = 'success';
//       } else {
//         res = "no data";
//       }
//     } catch (err) {
//       res = err.toString();
//     }
//     return res;
//   }
// }