class UpdateProductResponse {
  UpdateProductResponse({
    this.updatedAt,
  });

  UpdateProductResponse.fromJson(dynamic json) {
    updatedAt = json['updatedAt'];
  }

  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['updatedAt'] = updatedAt;
    return map;
  }
}
