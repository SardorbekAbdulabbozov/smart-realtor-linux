class SignUpRequest {
  String? username;
  String? email;
  bool? gender;
  bool? isAdmin;
  bool? isOwner;
  String? password;
  String? phone;

  SignUpRequest({
    this.username,
    this.email,
    this.password,
    this.gender,
    this.isAdmin,
    this.isOwner,
    this.phone,
  });

  SignUpRequest.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    email = json['email'];
    gender = json['gender'];
    isAdmin = json['isAdmin'];
    password = json['password'];
    isOwner = json['isOwner'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = username;
    data['email'] = email;
    data['gender'] = gender;
    data['isAdmin'] = isAdmin;
    data['password'] = password;
    data['isOwner'] = isOwner;
    data['phone'] = phone;
    return data;
  }
}
