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
    this.district,
    this.region,
    this.owner,
    this.ownersPhone,
    this.title,
    this.isBooked,
    this.isLand,
    this.whoBooked,
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
    owner = json['owner'];
    district = json['district'];
    region = json['region'];
    ownersPhone = json['ownersPhone'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    description = json['description'];
    address = json['address'];
    title = json['title'];
    whoBooked = json['whoBooked'];
  }

  Results copyWith({
    String? objectId,
    List<String>? images,
    bool? isRent,
    dynamic price,
    dynamic area,
    dynamic numberOfRooms,
    bool? isRecommended,
    bool? isBooked,
    bool? isLand,
    String? createdAt,
    String? updatedAt,
    String? owner,
    String? region,
    String? district,
    String? ownersPhone,
    String? description,
    String? address,
    String? title,
    String? whoBooked,
  }) =>
      Results(
        objectId: objectId ?? this.objectId,
        images: images ?? this.images,
        isRent: isRent ?? this.isRent,
        price: price ?? this.price,
        area: area ?? this.area,
        numberOfRooms: numberOfRooms ?? this.numberOfRooms,
        isRecommended: isRecommended ?? this.isRecommended,
        isBooked: isBooked ?? this.isBooked,
        isLand: isLand ?? this.isLand,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        description: description ?? this.description,
        address: address ?? this.address,
        district: district ?? this.district,
        region: region ?? this.region,
        owner: owner ?? this.owner,
        ownersPhone: ownersPhone ?? this.ownersPhone,
        title: title ?? this.title,
        whoBooked: whoBooked ?? this.whoBooked,
      );

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
  String? owner;
  String? district;
  String? region;
  String? ownersPhone;
  String? description;
  String? address;
  String? title;
  String? whoBooked;

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
    owner = product.owner;
    district = product.district;
    region = product.region;
    ownersPhone = product.ownersPhone;
    title = product.title;
    isBooked = product.isBooked;
    whoBooked = product.whoBooked;
    isLand = product.isLand;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['images'] = images;
    map['isRent'] = isRent;
    map['price'] = price;
    map['area'] = area;
    map['numberOfRooms'] = numberOfRooms;
    map['isRecommended'] = isRecommended;
    map['isBooked'] = isBooked;
    map['isLand'] = isLand;
    map['description'] = description;
    map['address'] = address;
    map['title'] = title;
    map['whoBooked'] = whoBooked;
    map['owner'] = owner;
    map['ownersPhone'] = ownersPhone;
    map['district'] = district;
    map['region'] = region;
    return map;
  }
}
