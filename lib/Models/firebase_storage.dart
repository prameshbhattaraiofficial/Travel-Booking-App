import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';
import '../Firebase_Storage/storage_method.dart';
import 'imagemodel.dart';
import 'package:smarttourism/Models/users.dart' as model;

class FireStoreMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> signOut() async {
    await _auth.signOut();
  }

  Future<String> registerUser(
      {required String email,
      required String password,
      required String userFullName,
      required String phoneNumber,
      required String address}) async {
    String res = " Some error occur";
    try {
      if (email.isNotEmpty && password.isNotEmpty && userFullName.isNotEmpty) {
        //register user
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        model.UserModel user = model.UserModel(
          fullName: userFullName,
          uid: cred.user!.uid,
          address: address,
          email: email,
          role: "user",
          phoneNumber: phoneNumber,
        );

        //store to firebase database
        await _firestore
            .collection("Users")
            .doc(cred.user!.uid)
            .set(user.toJson());
        res = "success";
      } else {
        res = "Please enter all the fields";
      }
    } catch (error) {
      res = error.toString();
    }
    return res;
  }

  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    String res = "Some error occurred";
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        // logging in user with email and password
        await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        res = "success";
      } else {
        res = "Please enter all the fields";
      }
    } catch (err) {
      return err.toString();
    }
    return res;
  }

  Future<String> uploadPost(String description, Uint8List file, String name,
      String price, String uid) async {
    String res = "Some error occurred";
    try {
      String travelImage =
          await StorageMethods().uploadImageToStorage('TravelPic', file, true);
      String postId = const Uuid().v1(); // creates unique id based on time
      Post post = Post(
        description: description,
        name: name,
        uid: uid,
        price: price,
        travelImage: travelImage,
        postId: postId,
      );
      FirebaseFirestore.instance
          .collection('Posts')
          .doc(postId)
          .set(post.toJson());
      res = "success";
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future<String> passwordReset({
    required String email,
  }) async {
    String res = "some error occur";
    try {
      if (email.isNotEmpty) {
        await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
        return res = "success";
      } else {
        res = "Enter valid email";
      }
    } catch (e) {
      return e.toString();
    }
    return res;
  }

  Future<String> sendFeedBack(
      String description, String email, String name) async {
    String res = "Some error occurred";
    try {
      if (description.isNotEmpty && name.isNotEmpty && email.isNotEmpty) {
        String feedbackId = const Uuid().v1();
        _firestore.collection('Feedback').doc(feedbackId).set({
          'name': name,
          'email': email,
          'description': description,
          'feedbackId': feedbackId,
          'datePublished': DateTime.now(),
        });
        res = 'success';
      } else {
        res = "Please enter all field";
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future<String> bookNow(String date, String name, String total) async {
    String res = "Some error occurred";
    try {
      if (date.isNotEmpty && name.isNotEmpty && total.isNotEmpty) {
        String bookId = const Uuid().v1();
        _firestore.collection('Book').doc(bookId).set({
          'fullName': name,
          'date': date,
          'total': total,
        });
        res = 'success';
      } else {
        res = "Please enter all field";
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
