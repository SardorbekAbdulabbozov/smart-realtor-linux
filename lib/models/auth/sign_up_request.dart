class SignUpRequest {
  String? username;
  String? email;
  bool? gender;
  bool? isAdmin;
  String? password;

  SignUpRequest({this.username, this.email, this.password, this.gender, this.isAdmin});

  SignUpRequest.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    email = json['email'];
    gender = json['gender'];
    isAdmin = json['isAdmin'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = username;
    data['email'] = email;
    data['gender'] = gender;
    data['isAdmin'] = isAdmin;
    data['password'] = password;
    return data;
  }
}
