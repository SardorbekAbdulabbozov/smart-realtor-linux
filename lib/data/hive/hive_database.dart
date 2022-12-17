import 'dart:io';

import 'package:hive/hive.dart';
import 'package:my_home/data/keys/app_keys.dart';
import 'package:my_home/models/hive_models/product.dart';
import 'package:my_home/models/product/product_list_response.dart';
import 'package:path_provider/path_provider.dart';

class HiveDatabase {
  static HiveDatabase instance = HiveDatabase._();

  HiveDatabase._();

  static HiveDatabase getInstance() {
    return instance;
  }

  late Box<Product> productsBox;

  Future<void> initializeHive() async {
    Directory directory = await getApplicationDocumentsDirectory();
    Hive.init(directory.path);
    Hive.registerAdapter(ProductAdapter());
    productsBox = await Hive.openBox<Product>(AppKeys.FAVOURITE);
  }

  List<Results> getAllFavouriteProducts() {
    List<Results> favouriteProducts = [];
    productsBox.values.toList().forEach((element) {
      favouriteProducts.add(Results.fromProduct(element));
    });
    return favouriteProducts;
  }

  Future<void> deleteFromFavourites(String id) async {
    await productsBox.delete(id);
  }

  Future<void> clearFavourites() async {
    await productsBox.clear();
  }

  Future<void> addToFavourites(Results result) async {
    await productsBox.put(result.objectId ?? '', Product.fromResults(result));
  }
} /*flutter packages pub run build_runner build*/
