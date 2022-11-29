class SignUpResponse {
  String? objectId;
  String? createdAt;
  String? sessionToken;

  SignUpResponse({this.objectId, this.createdAt, this.sessionToken});

  SignUpResponse.fromJson(Map<String, dynamic> json) {
    objectId = json['objectId'];
    createdAt = json['createdAt'];
    sessionToken = json['sessionToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['objectId'] = objectId;
    data['createdAt'] = createdAt;
    data['sessionToken'] = sessionToken;
    return data;
  }
}
