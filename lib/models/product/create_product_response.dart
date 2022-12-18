class CreateProductResponse {
  String? objectId;
  String? createdAt;

  CreateProductResponse({this.objectId, this.createdAt});

  CreateProductResponse.fromJson(Map<String, dynamic> json) {
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
