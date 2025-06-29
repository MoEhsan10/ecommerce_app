class RegisterRequest {

  String name;
  String email;
  String password;
  String rePassword;
  String phone;


  RegisterRequest({
    required this.name,
    required this.email,
    required this.password,
    required  this.rePassword,
    required  this.phone,});



  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    map['password'] = password;
    map['rePassword'] =password;
    map['phone'] = phone;
    return map;
  }

}