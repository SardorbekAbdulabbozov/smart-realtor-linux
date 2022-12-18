class RequestVisitRequest {
  String? visitorsUsername;
  String? productId;
  String? visitingTime;

  RequestVisitRequest(
      {this.visitorsUsername, this.productId, this.visitingTime});

  RequestVisitRequest.fromJson(Map<String, dynamic> json) {
    visitorsUsername = json['visitorsUsername'];
    productId = json['productId'];
    visitingTime = json['visitingTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['visitorsUsername'] = visitorsUsername;
    data['productId'] = productId;
    data['visitingTime'] = visitingTime;
    return data;
  }
}