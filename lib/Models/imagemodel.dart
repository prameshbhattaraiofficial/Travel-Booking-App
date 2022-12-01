import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  String name;
  String uid;
  String travelImage;
  String price;
  String description;
  String postId;

  Post({
    required this.name,
    required this.uid,
    required this.price,
    required this.travelImage,
    required this.description,
    required this.postId,
  });

  static Post fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return Post(
        postId: snapshot['postId'],
        name: snapshot["name"],
        uid: snapshot['uid'],
        travelImage: snapshot["travelImage"],
        price: snapshot["price"],
        description: snapshot['description']);
  }

  Map<String, dynamic> toJson() => {
        "description": description,
        'uid': uid,
        "travelImage": travelImage,
        "price": price,
        "name": name,
        'postId': postId,
      };
}
