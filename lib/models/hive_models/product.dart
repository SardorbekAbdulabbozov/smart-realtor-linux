import 'package:hive/hive.dart';
import 'package:my_home/models/product/product_list_response.dart';

part 'product.g.dart';

@HiveType(typeId: 1)
class Product {
  @HiveField(0)
  String? objectId;

  @HiveField(1)
  List<String>? images;

  @HiveField(2)
  bool? isRent;

  @HiveField(3)
  dynamic price;

  @HiveField(4)
  dynamic area;

  @HiveField(5)
  dynamic numberOfRooms;

  @HiveField(6)
  bool? isRecommended;

  @HiveField(7)
  String? createdAt;

  @HiveField(8)
  String? updatedAt;

  @HiveField(9)
  String? description;

  @HiveField(10)
  String? address;

  @HiveField(11)
  String? title;

  @HiveField(12)
  bool? isLand;

  @HiveField(13)
  bool? isBooked;

  Product({
    this.objectId,
    this.images,
    this.isRent,
    this.price,
    this.area,
    this.numberOfRooms,
    this.isRecommended,
    this.isLand,
    this.isBooked,
    this.createdAt,
    this.updatedAt,
    this.description,
    this.address,
    this.title,
  });

  Product.fromResults(Results results) {
    objectId = results.objectId;
    images = results.images ?? [];
    isRent = results.isRent;
    price = results.price;
    area = results.area;
    numberOfRooms = results.numberOfRooms;
    isRecommended = results.isRecommended;
    createdAt = results.createdAt;
    updatedAt = results.updatedAt;
    description = results.description;
    address = results.address;
    title = results.title;
    isLand = results.isLand;
    isBooked = results.isBooked;
  }
}
