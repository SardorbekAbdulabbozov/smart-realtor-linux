class OwnerDetailsResponse {
  OwnerDetailsResponse({
    this.username,
    this.phone,
  });

  OwnerDetailsResponse.fromJson(dynamic json) {
    username = json['username'];
    phone = json['phone'];
  }

  String? username;
  String? phone;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['username'] = username;
    map['phone'] = phone;
    return map;
  }
}
