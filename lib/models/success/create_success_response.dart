class CreateSuccessResponse {
  String? objectId;
  String? createdAt;

  CreateSuccessResponse({this.objectId, this.createdAt});

  CreateSuccessResponse.fromJson(Map<String, dynamic> json) {
    objectId = json['objectId'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['objectId'] = objectId;
    data['createdAt'] = createdAt;
    return data;
  }
}
