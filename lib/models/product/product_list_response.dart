import 'package:my_home/models/hive_models/product.dart';

class ProductListResponse {
  ProductListResponse({this.results});

  ProductListResponse.fromJson(dynamic json) {
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results?.add(Results.fromJson(v));
      });
    }
  }

  List<Results>? results;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (results != null) {
      map['results'] = results?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Results {
  Results({
    this.objectId,
    this.images,
    this.isRent,
    this.price,
    this.area,
    this.numberOfRooms,
    this.isRecommended,
    this.createdAt,
    this.updatedAt,
    this.description,
    this.address,
    this.title,
  });

  Results.fromJson(dynamic json) {
    objectId = json['objectId'];
    images = json['images'] != null ? json['images'].cast<String>() : [];
    isRent = json['isRent'];
    price = json['price'];
    area = json['area'];
    numberOfRooms = json['numberOfRooms'];
    isRecommended = json['isRecommended'];
    isLand = json['isLand'];
    isBooked = json['isBooked'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    description = json['description'];
    address = json['address'];
    title = json['title'];
  }

  String? objectId;
  List<String>? images;
  bool? isRent;
  dynamic price;
  dynamic area;
  dynamic numberOfRooms;
  bool? isRecommended;
  bool? isBooked;
  bool? isLand;
  String? createdAt;
  String? updatedAt;
  String? description;
  String? address;
  String? title;

  Results.fromProduct(Product product) {
    objectId = product.objectId;
    images = product.images ?? [];
    isRent = product.isRent;
    price = product.price;
    area = product.area;
    numberOfRooms = product.numberOfRooms;
    isRecommended = product.isRecommended;
    createdAt = product.createdAt;
    updatedAt = product.updatedAt;
    description = product.description;
    address = product.address;
    title = product.title;
    isBooked = product.isBooked;
    isLand = product.isLand;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['objectId'] = objectId;
    map['images'] = images;
    map['isRent'] = isRent;
    map['price'] = price;
    map['area'] = area;
    map['numberOfRooms'] = numberOfRooms;
    map['isRecommended'] = isRecommended;
    map['isBooked'] = isBooked;
    map['isLand'] = isLand;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['description'] = description;
    map['address'] = address;
    map['title'] = title;
    return map;
  }
}
