class RequestVisitResponse {
  List<Visit>? visits;

  RequestVisitResponse({this.visits});

  RequestVisitResponse.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      visits = <Visit>[];
      json['results'].forEach((v) {
        visits!.add(Visit.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (visits != null) {
      data['results'] = visits!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Visit {
  String? objectId;
  String? visitorsUsername;
  String? productId;
  String? visitingTime;
  String? createdAt;
  String? updatedAt;

  Visit({
    this.objectId,
    this.visitorsUsername,
    this.productId,
    this.visitingTime,
    this.createdAt,
    this.updatedAt,
  });

  Visit.fromJson(Map<String, dynamic> json) {
    objectId = json['objectId'];
    visitorsUsername = json['visitorsUsername'];
    productId = json['productId'];
    visitingTime = json['visitingTime'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['objectId'] = objectId;
    data['visitorsUsername'] = visitorsUsername;
    data['productId'] = productId;
    data['visitingTime'] = visitingTime;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
