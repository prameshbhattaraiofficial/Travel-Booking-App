
class UserModel{
  String? uid;
  String? fullname;
  String? email;
  String? phone;
  String? password;
  String? confirmpassword;

  UserModel ({
    this.phone,this.confirmpassword,this.email,this.fullname,this.password,this.uid
});

  factory UserModel.fromMap(map){
    return UserModel(
      uid: map['uid'],
      fullname: map['fullname'],
      email: map['email'],
      phone: map['phone'],
      password: map['password'],
      confirmpassword: map['confirmpassword']
    );
  }

  //sending or pushing data into server

  Map <String, dynamic>toMap(){
    return{
      'uid' : uid,
      'fullname': fullname,
      'email':email,
      'phone': phone,
      'password':password,
      'confirmpassword':confirmpassword,

    };
  }

}


