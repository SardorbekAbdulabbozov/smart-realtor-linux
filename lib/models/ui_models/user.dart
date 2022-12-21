class User {
  String? email;
  String? username;
  String? phone;
  String? sessionToken;
  bool? gender;
  bool? isAdmin;
  bool? isOwner;
  bool? isEmailVerified;
  User({
    this.email,
    this.username,
    this.phone,
    this.sessionToken,
    this.gender,
    this.isAdmin,
    this.isOwner,
    this.isEmailVerified,
  });
}
