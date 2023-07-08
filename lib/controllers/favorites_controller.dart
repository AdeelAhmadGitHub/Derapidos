import 'dart:convert';
import 'dart:developer';

import 'package:derapidos/models/cart_details.dart';
import 'package:derapidos/models/favorite_products.dart';
import 'package:derapidos/models/favouriteproduct.dart';
import 'package:derapidos/models/product_detail.dart';
import 'package:derapidos/models/restaurant_detail.dart';
import 'package:derapidos/models/suggested_products.dart';
import 'package:derapidos/services/api_services.dart';
import 'package:derapidos/user_prefs/user_prefs.dart';
import 'package:get/get.dart';

class FavoritesController extends GetxController {
  var loading = true.obs;

  FavoriteProducts? favoritesProducts;
  String? currentProductId;

  String? restaurantIDFF;

  String? currentRestaurantIdd;
  Future addRemoveFavorite() async {
    print("good");
    log('fav id: $restaurantIDFF');

    var data = await ApiServices().addFavorite(restaurantIDFF ?? "");
  }
  Future getFavoriteProducts() async {
    var data = await ApiServices().getFavouriteProducts();
    favoritesProducts = FavoriteProducts.fromJson(jsonDecode(data!));
    loading.value = false;
  }

  ///
  FavoriteProduct? favoriteProduct;
  assignProductFromCategoryProduct(Product? product) {
    favoriteProduct = FavoriteProduct(
      id: product!.id,
      name: product.name,
      price: product.price,
      image: product.image,
      marketName: product.marketName,
      averageRating: product.averageRating,
    );
  }
  FavouriteProduct?  favouriteProduct ;
  Future getFavourite() async {
    loading.value = true;
    var data = await ApiServices().getFavouriteApi();
    favouriteProduct = FavouriteProduct.fromJson(jsonDecode(data!));
    loading.value = false;
    update();
  }
  assignProductFromProductDetail(Detail detail) {
    favoriteProduct = FavoriteProduct(
      id: detail.id,
      name: detail.name,
      price: detail.price,
      image: detail.image,
      marketName: detail.marketName,
      averageRating: detail.averageRating,
    );
  }

  assignProductFromStoreDetail(StoreProduct? product) {
    favoriteProduct = FavoriteProduct(
      id: product!.id,
      name: product.name,
      price: product.price,
      image: product.image,
      marketName: '', //product.marketName,
      averageRating: '', //product.averageRating,
    );
  }

  Future<bool?> addToFavorites() async {
    // UserPreferences.removeFavoriteList();

    List<String>? favList = [];
    if (UserPreferences.retrieveFavoriteList() == null) {
      favList = [];
    } else {
      favList = UserPreferences.retrieveFavoriteList();
    }
    String? product = jsonEncode(favoriteProduct!.toJson());
    favList!.add(product);
    return await UserPreferences.saveFavoriteList(favList);
  }

  List<FavoriteProduct>? favoriteProducts = [];
  Future getFavoriteList() async {
    // FavoriteProduct favoriteProduct;
    favoriteProducts = [];
    List<String>? favList = [];
    if (UserPreferences.retrieveFavoriteList() == null) {
      favList = [];
    } else {
      favList = UserPreferences.retrieveFavoriteList();
    }
    for (var fP in favList!) {
      FavoriteProduct favoriteProduct =
          FavoriteProduct.fromJson(jsonDecode(fP));
      favoriteProducts!.add(favoriteProduct);
    }
    loading.value = false;
    // return favoriteProducts;
  }
}
