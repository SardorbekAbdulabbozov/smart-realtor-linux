class UserDetailsResponse {
  String? objectId;
  String? username;
  String? email;
  String? createdAt;
  String? updatedAt;
  bool? gender;
  bool? emailVerified;
  bool? isAdmin;
  bool? isOwner;
  String? className;
  String? phone;
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
    this.isOwner,
    this.className,
    this.phone,
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
    isOwner = json['isOwner'];
    phone = json['phone'];
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
    data['isOwner'] = isOwner;
    data['phone'] = phone;
    return data;
  }
}
