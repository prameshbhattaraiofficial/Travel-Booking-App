import 'package:cloud_firestore/cloud_firestore.dart';

class FeedbackModel {
  String fullname;
  String email;
  String feedback;
  String feedbackId;
  FieldValue timeStamp;

  FeedbackModel({
    required this.timeStamp,
    required this.feedbackId,
    required this.fullname,
    required this.email,
    required this.feedback,
  });

  //receiving  data from server
  factory FeedbackModel.fromMap(map) {
    return FeedbackModel(
      fullname: map['fullname'],
      email: map['email'],
      feedback: map['feedback'],
      feedbackId: map['feedbackId'],
      timeStamp: map['timeStamp'],
    );
  }

  //sending or pushing data into server
  Map<String, dynamic> toMap() {
    return {
      'fullname': fullname,
      'email': email,
      'feedback': feedback,
      'feedbackId': feedbackId,
      'timeStamp': timeStamp,
    };
  }
}
