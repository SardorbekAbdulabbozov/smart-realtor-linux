class UserDetailsResponse {
  String? objectId;
  String? username;
  String? email;
  String? createdAt;
  String? updatedAt;
  bool? gender;
  bool? emailVerified;
  bool? isAdmin;
  String? className;
  String? sessionToken;

  UserDetailsResponse({
    this.objectId,
    this.username,
    this.email,
    this.createdAt,
    this.updatedAt,
    this.gender,
    this.emailVerified,
    this.isAdmin,
    this.className,
    this.sessionToken,
  });

  UserDetailsResponse.fromJson(Map<String, dynamic> json) {
    objectId = json['objectId'];
    username = json['username'];
    email = json['email'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    gender = json['gender'];
    emailVerified = json['emailVerified'];
    isAdmin = json['isAdmin'];
    className = json['className'];
    sessionToken = json['sessionToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['objectId'] = objectId;
    data['username'] = username;
    data['email'] = email;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['gender'] = gender;
    data['emailVerified'] = emailVerified;
    data['isAdmin'] = isAdmin;
    data['className'] = className;
    data['sessionToken'] = sessionToken;
    return data;
  }
}
