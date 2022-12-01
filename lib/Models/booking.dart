// class UserModel{
//   String? uid;
//   String? name;
//   String? date;
//   String? phonenumber;
//   String? address;
//   String? password;
//   String? confirmpassword;
//   String? role;
//
//   UserModel({this.uid, this.fullname, this.email, this.phonenumber,  this.address, this.password, this.confirmpassword, this.role
//   });
//
//   //receiving  data from server
//   factory UserModel.fromMap(map){
//     return UserModel(
//         uid: map['uid'],
//         fullname: map['fullname'],
//         email: map['email'],
//         phonenumber: map['phonenumber'],
//         address: map['address'],
//         password: map['password'],
//         confirmpassword: map['confirmpassword'],
//         role:map['role']
//     );
//   }
//
//   //sending or pushing data into server
//   Map<String, dynamic> toMap(){
//     return {
//       'uid': uid,
//       'fullname': fullname,
//       'email': email,
//       'phonenumber':phonenumber,
//       'address': address,
//       'password': password,
//       'confirmpassword': confirmpassword,
//       'role': role
//
//     };
//   }
//
//
// }