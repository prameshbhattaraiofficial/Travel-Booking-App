class UserModel {
  String uid;
  String fullName;
  String email;
  String phoneNumber;
  String address;
  String? role;

  UserModel(
      {required this.uid,
      required this.fullName,
      required this.email,
      required this.phoneNumber,
      required this.address,
      this.role});

  //receiving  data from server
  factory UserModel.fromMap(map) {
    return UserModel(
        uid: map['uid'],
        fullName: map['fullName'],
        email: map['email'],
        phoneNumber: map['phoneNumber'],
        address: map['address'],
        role: map['role']);
  }

  //sending or pushing data into server
  Map<String, dynamic> toJson() => {
        'uid': uid,
        'fullName': fullName,
        'email': email,
        'phoneNumber': phoneNumber,
        'address': address,
        'role': role
      };
}
