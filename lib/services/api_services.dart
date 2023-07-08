import 'dart:convert';
import 'dart:developer';

import 'package:derapidos/base_url/base_url.dart';
import 'package:derapidos/models/cart_item.dart';
import 'package:derapidos/models/customer_reviews.dart';
import 'package:derapidos/models/make_checkout.dart';
import 'package:derapidos/models/payment_cards.dart';
import 'package:derapidos/models/shipping_addresses.dart';
import 'package:derapidos/models/user_profile.dart';
import 'package:derapidos/user_prefs/user_prefs.dart';
import 'package:derapidos/utils/utils.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;

import '../controllers/update_location_controller.dart';

class ApiServices {
  UserProfile? userProfile;
  ApiServices() {
    String? data = UserPreferences.getUserData();
    if (data != null) {
      userProfile = UserProfile.fromJson(jsonDecode(data));
    } else {}
  }

  /// 1.
  // Future<String?> searchAndFilter(int rating,String deliveryType,String priceRange, int? categoryIdF) async {
  //   print(rating);
  //   print(deliveryType);
  //   print(priceRange);
  //   print(categoryIdF);
  //   var url = '$baseUrl/api/getHomepageDetails';
  //   var request = http.MultipartRequest('POST', Uri.parse(url));
  //   request.fields.addAll({
  //     'user_latitude': latitude??"",
  //     'user_longitude': longitude??"",
  //     'category': categoryIdF.toString(),
  //     'rating': rating.toString(),
  //     'delivery_type': deliveryType,
  //     'price_range': priceRange,
  //      });
  //   http.StreamedResponse response = await request.send();
  //   return  dataResponse(response);
  // }
  Future<String?> getSpecialsBreakfast(String? restaurantType, String categorytype) async {
    var uri = '$baseUrl/api/getSpecialsBreakfast';
    var request = http.MultipartRequest('POST', Uri.parse(uri));
    request.fields.addAll({
      'restaurant_type': '$restaurantType',
      'field': '$categorytype',
      'user_latitude': latitude ?? "",
      'user_longitude': longitude ?? "",
    });
    http.StreamedResponse response = await request.send();
    return await dataResponse(response);
  }

  Future<String?> addFavorite(String restaurantID) async {
    print(userProfile!.userData!.id);
    print(restaurantID);
    var apiToken = userProfile!.userData!.apiToken;
    var uri = '$baseUrl/api/favorites';
    var request = http.MultipartRequest('POST', Uri.parse(uri));
    request.fields.addAll({
      'api_token': '$apiToken',
      'user_id': '${userProfile!.userData!.id}', // '29',
      'restaurant_id': restaurantID, // 'NewYear2023','100'
    });
    http.StreamedResponse response = await request.send();
    return await dataResponse(response);
  }

  static Future<bool?> register(
      String? name, String? email, String? password, String? phone, String? image) async {
    var uri = '$baseUrl/api/register';
    var request = http.MultipartRequest('POST', Uri.parse(uri));
    request.fields.addAll({
      'name': '$name', // 'Muhammad Ismail',
      'email': '$email', //  'ismail@gmail.com',
      'phone': '$phone', // '03002109329',
      'password': '$password', //  '12345678'
    });
    if (image != null) {
      var file = await http.MultipartFile.fromPath('profile_pic', image);
      request.files.add(file);
    }
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var data = await response.stream.bytesToString();
      dprint(data);
      await UserPreferences.setUserData(data);
      await UserPreferences.setLoginCheck(true);
      return true;
    } else {
      dprint(response.reasonPhrase);
      return false;
    }
  }

  /// 2.
  static Future<bool?> login(String? email, String? password) async {
    var uri = '$baseUrl/api/login';
    var request = http.MultipartRequest('POST', Uri.parse(uri));
    request.fields.addAll({
      'email': '$email', //  'ismail@gmail.com',
      'password': '$password', //  '12345678'
    });
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var data = await response.stream.bytesToString();
      dprint(data);
      await UserPreferences.setUserData(data);
      await UserPreferences.setLoginCheck(true);
      return true;
    } else {
      dprint(response.reasonPhrase);
      return false;
    }
  }

  ///
  Future<bool?> editProfile(UserData? userData) async {
    var uri = '$baseUrl/api/edit_user_profile';
    var request = http.MultipartRequest('POST', Uri.parse(uri));
    request.fields.addAll({
      'api_token': '${userData!.apiToken}',
      'user_id': '${userProfile!.userData!.id}', // '9',
      'name': '${userData.name}', // 'Muhammad Ismail',
      'email': '${userData.email}', // 'ismail@gmail.com',
      'phone': '${userData.phone}', // '03010112109',
      'password': '${userData.deviceToken}', // '12345678'
    });
    if (userData.profilePic != null) {
      request.files.add(await http.MultipartFile.fromPath('profile_pic', '${userData.profilePic}'));
    }
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var data = await response.stream.bytesToString();
      print(data);
      await UserPreferences.setUserData(data);
      return true;
    } else {
      dprint(response.reasonPhrase);
      return false;
    }
  }

  Future<bool?> rsEditProfile(
    String? image,
    String? name,
    String? email,
    String? phone,
    String? password,
    UserData? userData,
  ) async {
    var uri = '$baseUrl/api/edit_user_profile';
    var request = http.MultipartRequest('POST', Uri.parse(uri));
    request.fields.addAll({
      'api_token': '${userData!.apiToken}',
      'user_id': '${userProfile!.userData!.id}',
      'name': name!, // 'Muhammad Ismail',
      'email': email!, //  'ismail@gmail.com',
      'phone': phone!, // '03002109329',
      'password': password!, //  '12345678'
    });
    if (image != null) {
      var file = await http.MultipartFile.fromPath('profile_pic', image);
      request.files.add(file);
    }
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      print("Api success");
      var data = await response.stream.bytesToString();
      dprint(data);
      await UserPreferences.setUserData(data);
      return true;
    } else {
      dprint(response.reasonPhrase);
      return false;
    }
  }
  // Future rsEditProfile(
  //     UserData? userData, String? image, String? name, String? email, String? phone, String? password) async {
  //   var uri = '$baseUrl/api/edit_user_profile';
  //   var request = http.MultipartRequest('POST', Uri.parse(uri));
  //   request.fields.addAll({
  //     'api_token': '${userData!.apiToken}',
  //     'user_id': '${userProfile!.userData!.id}', // '9',
  //     'name': '${name}', // 'Muhammad Ismail',
  //     'email': '${email}', // 'ismail@gmail.com',
  //     'phone': '${phone}', // '03010112109',
  //     'password': '${userData.deviceToken}', // '12345678'
  //   });
  //   if (userData.profilePic != null) {
  //     request.files.add(await http.MultipartFile.fromPath('profile_pic', '${userData.profilePic}'));
  //   }
  //   http.StreamedResponse response = await request.send();
  //   print("enter api");
  //   print(name);
  //   if (response.statusCode == 200) {
  //     var data = await response.stream.bytesToString();
  //     print("api success");
  //     print("profile edit ${data}");
  //     await UserPreferences.setUserData(data);
  //     return true;
  //   } else {
  //     dprint(response.reasonPhrase);
  //     return false;
  //   }
  // }

  Future<bool?> changePassword(String? password) async {
    var uri = '$baseUrl/api/change_password';
    var request = http.MultipartRequest('POST', Uri.parse(uri));
    request.fields.addAll({
      'api_token': '${userProfile!.userData!.apiToken}',
      'password': '$password', // '87654321'
    });
    http.StreamedResponse response = await request.send();
    return await checkResponse(response);
  }

  ///
  Future<bool?> logOut() async {
    var apiToken = userProfile!.userData!.apiToken;
    var uri = '$baseUrl/api/logout?api_token=$apiToken';
    var request = http.MultipartRequest('GET', Uri.parse(uri));
    http.StreamedResponse response = await request.send();
    return await checkResponse(response);
  }

  ///
  Future<bool?> deleteAccount() async {
    var uri = '$baseUrl/api/delete_account';
    var request = http.MultipartRequest('POST', Uri.parse(uri));
    request.fields.addAll({
      'api_token': '${userProfile!.userData!.apiToken}',
      'user_id': '${userProfile!.userData!.id}', // '9',
    });
    http.StreamedResponse response = await request.send();
    return await checkResponse(response);
  }

  /// 3.
  Future<String?> getBanners(String bannertype) async {
    var uri = '$baseUrl/api/banners';
    var request = http.MultipartRequest('POST', Uri.parse(uri));
    request.fields.addAll({
      'field': bannertype,
    });
    http.StreamedResponse response = await request.send();
    return await dataResponse(response);
  }

  Future<String?> activeOrderMarketDetail() async {
    var uri = '$baseUrl/api/getActiveOrderMarketDetail';
    var request = http.MultipartRequest('POST', Uri.parse(uri));
    request.fields.addAll({
      'api_token': '${userProfile!.userData!.apiToken}',
      'user_id': '${userProfile!.userData!.id}',
    });
    http.StreamedResponse response = await request.send();
    return await dataResponse(response);
  }

  /// 4.
  Future<String?> getCategorieshome(String categorytype) async {
    log("category type: $categorytype");
    var uri = '$baseUrl/api/categories';
    var request = http.MultipartRequest('POST', Uri.parse(uri));
    request.fields.addAll({
      'field': categorytype ?? "" // '46',
    });
    http.StreamedResponse response = await request.send();
    return await dataResponse(response);
  }

  /// 5.
  Future<String?> getSuggestedProducts(
      String rating,
      String deliveryType,
      String priceRange,
      String categoryIdF,
      String derapidostype,
      String markettype,
      String restaurant_sub_type,
      String userIDCheck,
      String radius,
      String product_date) async {
    print("////////////////////////////////////////");
    print(latitude);
    print(longitude);
    print(rating);
    print(deliveryType);
    print(priceRange);
    print(categoryIdF);
    print("/////////////////");
    var uri = '$baseUrl/api/getHomepageDetails';
    var request = http.MultipartRequest('POST', Uri.parse(uri));
    request.fields.addAll({
      'user_latitude': latitude ?? "",
      'user_longitude': longitude ?? "",
      'category': categoryIdF.toString() ?? "",
      'rating': rating.toString() ?? "",
      'delivery_type': deliveryType ?? "",
      'price_range': priceRange ?? "", // '46',
      'field': derapidostype, // '46',
      'type': markettype, // '46',
      'restaurant_sub_type': restaurant_sub_type, // '46',
      'user_id': userIDCheck, // '46',
      'radius': radius, // '46',
      'product_date': product_date, // '46',
    });
    http.StreamedResponse response = await request.send();
    return await dataResponse(response);
  }

  Future<String?> getSuggestedProductss(String rating, String deliveryType, String priceRange,
      String categorytypeid, String derapidostype, String markettype, String restaurant_sub_type) async {
    print("////////////////////////////////////////");
    print(latitude);
    print(longitude);
    print(rating);
    print(deliveryType);
    print(priceRange);
    print(categorytypeid);
    print("/////////////////");
    var uri = '$baseUrl/api/getHomepageDetails';
    var request = http.MultipartRequest('POST', Uri.parse(uri));
    request.fields.addAll({
      'user_latitude': latitude ?? "",
      'user_longitude': longitude ?? "",
      'category': categorytypeid.toString() ?? "",
      'rating': rating.toString() ?? "",
      'delivery_type': deliveryType ?? "",
      'price_range': priceRange ?? "", // '46',
      'field': derapidostype, // '46',
      'type': markettype, // '46',
      'restaurant_sub_type': restaurant_sub_type, // '46',
    });
    http.StreamedResponse response = await request.send();
    return await dataResponse(response);
  }

  /// 5.
  /// 5.1
  Future<String?> getSuggestedProductsGrocery(
      String rating, String deliveryType, String priceRange, String categoryIdF) async {
    print("////////////////////////////////////////");
    print(latitude);
    print(longitude);
    print(rating);
    print(deliveryType);
    print(priceRange);
    print(categoryIdF);
    print("/////////////////");
    var uri = '$baseUrl/api/getHomepageDetails';
    var request = http.MultipartRequest('POST', Uri.parse(uri));
    request.fields.addAll({
      'user_id': '${userProfile?.userData?.id}',
      'user_latitude': latitude ?? "",
      'user_longitude': longitude ?? "",
      'category': categoryIdF.toString() ?? "",
      'rating': rating.toString() ?? "",
      'delivery_type': deliveryType ?? "",
      'price_range': priceRange ?? "", // '46',
      'field': "3", // '46',
    });
    http.StreamedResponse response = await request.send();
    return await dataResponse(response);
  }

  ///5.1
  ///5.2
  Future<String?> getSuggestedProductsSuprmarket(
      String rating, String deliveryType, String priceRange, String categoryIdF) async {
    print("////////////////////////////////////////");
    print(latitude);
    print(longitude);
    print(rating);
    print(deliveryType);
    print(priceRange);
    print(categoryIdF);
    print("/////////////////");
    var uri = '$baseUrl/api/getHomepageDetails';
    var request = http.MultipartRequest('POST', Uri.parse(uri));
    request.fields.addAll({
      'user_latitude': latitude ?? "",
      'user_longitude': longitude ?? "",
      'category': categoryIdF.toString() ?? "",
      'rating': rating.toString() ?? "",
      'delivery_type': deliveryType ?? "",
      'price_range': priceRange ?? "", // '46',
      'field': "2", // '46',
    });
    http.StreamedResponse response = await request.send();
    return await dataResponse(response);
  }

  ///5.2
  Future<String?> getData1() async {
    var uri = '$baseUrl/api/getHomepageDetails';
    var request = http.MultipartRequest('POST', Uri.parse(uri));
    http.StreamedResponse response = await request.send();
    return await dataResponse(response);
  }

  ///
  Future<String?> getFavouriteApi() async {
    var apiToken = userProfile!.userData!.apiToken;
    var uri = '$baseUrl/api/getFavorites';
    var request = http.MultipartRequest('POST', Uri.parse(uri));
    request.fields.addAll({
      'user_latitude': latitude ?? "",
      'user_longitude': longitude ?? "",
      'api_token': '$apiToken',
      'user_id': '${userProfile!.userData!.id}',
    });
    http.StreamedResponse response = await request.send();
    return await dataResponse(response);
  }

  ///
  /// 6.
  Future<String?> getProductDetail(String? productId) async {
    var uri = '$baseUrl/api/get_product_details';
    var request = http.MultipartRequest('POST', Uri.parse(uri));
    request.fields.addAll({
      'product_id': '$productId', // '46',
    });
    http.StreamedResponse response = await request.send();
    return await dataResponse(response);
  }

  ///
  Future<String?> getAllCoupons() async {
    var apiToken = userProfile!.userData!.apiToken;
    var uri = '$baseUrl/api/coupons';
    var request = http.MultipartRequest('POST', Uri.parse(uri));
    request.fields.addAll({
      'api_token': '$apiToken',
      'user_latitude': latitude ?? "", // '29',
      'user_longitude': longitude ?? "", // 'NewYear2023',// '100'
    });
    http.StreamedResponse response = await request.send();
    return await dataResponse(response);
  }

  ///
  Future<String?> applyCouponCode(String? couponCode, String? amount) async {
    var apiToken = userProfile!.userData!.apiToken;
    var uri = '$baseUrl/api/apply_code';
    var request = http.MultipartRequest('POST', Uri.parse(uri));
    request.fields.addAll({
      'api_token': '$apiToken',
      'user_id': '${userProfile!.userData!.id}', // '29',
      'coupon_code': '$couponCode', // 'NewYear2023',
      'total_amount': '$amount', // '100'
    });
    http.StreamedResponse response = await request.send();
    return await dataResponse(response);
  }

  /// 6.1
  Future<String?> getRestaurantDetail(String? marketId) async {
    var uri = '$baseUrl/api/get_restaurant_details';
    var request = http.MultipartRequest('POST', Uri.parse(uri));
    request.fields.addAll({
      'market_id': '$marketId',
      'user_latitude': latitude ?? "", // '29',
      'user_longitude': longitude ?? "", // '46',
    });
    http.StreamedResponse response = await request.send();
    return await dataResponse(response);
  }

  Future<String?> getRestaurantDetailSupermarket(String? marketId) async {
    var uri = '$baseUrl/api/get_restaurant_details';
    var request = http.MultipartRequest('POST', Uri.parse(uri));
    request.fields.addAll({
      'market_id': '$marketId', // '46',
    });
    http.StreamedResponse response = await request.send();
    return await dataResponse(response);
  }

  /// 7.0
  Future<String?> getNearByRestaurants() async {
    var uri = '$baseUrl/api/nearby_restaurants';
    var request = http.MultipartRequest('POST', Uri.parse(uri));
    http.StreamedResponse response = await request.send();
    return await dataResponse(response);
  }

  /// 7.1
  Future<String?> getMarketDetail(String? marketId) async {
    var uri = '$baseUrl/api/get_restaurant_details';
    var request = http.MultipartRequest('POST', Uri.parse(uri));
    request.fields.addAll({
      'user_id': '${userProfile!.userData!.id}', // '9',
      'market_id': '$marketId', // '25',
    });
    http.StreamedResponse response = await request.send();
    return await dataResponse(response);
  }

  /// 8.
  Future<bool?> addToFavouriteProducts(String? productId) async {
    var uri = '$baseUrl/api/favorites';
    var request = http.MultipartRequest('POST', Uri.parse(uri));
    request.fields.addAll({
      'api_token': '${userProfile!.userData!.apiToken}',
      'user_id': '${userProfile!.userData!.id}', // '9',
      'product_id': '$productId', // '46',
    });
    http.StreamedResponse response = await request.send();
    return await checkResponse(response);
  }

  /// 9.
  Future<String?> getFavouriteProducts() async {
    var apiToken = userProfile!.userData!.apiToken;
    var url = '$baseUrl/api/favorites?api_token=$apiToken';
    var request = http.MultipartRequest('GET', Uri.parse(url));
    http.StreamedResponse response = await request.send();
    return await dataResponse(response);
  }

  /// 10.
  Future<bool?> removeFromFavourites(String? productId) async {
    var apiToken = userProfile!.userData!.apiToken;
    var url = '$baseUrl/api/favorites/$productId?api_token=$apiToken';
    var request = http.MultipartRequest('DELETE', Uri.parse(url));
    http.StreamedResponse response = await request.send();
    return await checkResponse(response);
  }

  /// 11.
  Future<bool?> addToCart(CartItem? cartItem) async {
    // String? productId, String? quantity, var extras) async {
    var apiToken = userProfile!.userData!.apiToken;
    var url = '$baseUrl/api/add_to_cart';
    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.fields.addAll({
      'api_token': '$apiToken',
      'user_id': '${userProfile!.userData!.id}', // '9',
      'product_id': '${cartItem!.productId}', // '46',
      'quantity': '${cartItem.quantity}', // '2',
      'delivery_charges': '${cartItem.deliveryCharges}', // '2',
      'size': '${cartItem.size}', // 'Small',
      'special_instructions': '${cartItem.specialInstructions}', // 'Add extras cheese',
      'extras': jsonEncode(cartItem.extras!.map((e) => e.toJson()).toList()),
      // extras
      // '[\n    {\n        "extras_id": 92,\n        "extras_quantity": 2\n    },\n    {\n        "extras_id": 93,\n        "extras_quantity": 1\n    }\n]'
    });
    http.StreamedResponse response = await request.send();
    return await checkResponse(response);
  }

  /// 11.
  Future<bool?> updateCartProductQuantity(String productId, int quantity) async {
    var apiToken = userProfile!.userData!.apiToken;
    var url = '$baseUrl/api/update_cart_product_quantity';
    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.fields.addAll({
      'api_token': '$apiToken',
      'user_id': '${userProfile!.userData!.id}', // '9',
      'product_id': productId, // '46',
      'quantity': quantity.toString(), //'36'
    });
    http.StreamedResponse response = await request.send();
    return await checkResponse(response);
  }

  ///
  Future<bool?> removeProductFromCart(String? cartId) async {
    var apiToken = userProfile!.userData!.apiToken;
    var uid = userProfile!.userData!.id;
    var uri = '$baseUrl/api/remove_product_from_cart';
    var request = http.MultipartRequest('POST', Uri.parse(uri));
    request.fields.addAll({'api_token': '$apiToken', 'user_id': '$uid', 'cart_id': '$cartId'});
    http.StreamedResponse response = await request.send();
    return await checkResponse(response);
  }

  ///
  Future<String?> updateCartProduct(cartId, CartItem? cartItem) async {
    var apiToken = userProfile!.userData!.apiToken;
    var uid = userProfile!.userData!.id;
    var uri = '$baseUrl/api/update_cart_product';
    var request = http.MultipartRequest('POST', Uri.parse(uri));
    request.fields.addAll({
      'api_token': '$apiToken',
      'user_id': '$uid',
      'cart_id': '$cartId',
      'product_id': '${cartItem!.productId}', // '46',
      'quantity': '${cartItem.quantity}', // '2',
      'delivery_charges': '${cartItem.deliveryCharges}', // '2',
      'size': '${cartItem.size}', // 'Small',
      'special_instructions': '${cartItem.specialInstructions}', // 'Add extras cheese',
      'extras': jsonEncode(cartItem.extras!.map((e) => e.toJson()).toList()),
      // 'extras':
      //     '[\n    {\n        "extras_id": 92,\n        "extras_quantity": 2\n    },\n    {\n        "extras_id": 93,\n        "extras_quantity": 1\n    }\n]'
    });
    http.StreamedResponse response = await request.send();
    return await dataResponse(response);
  }

  ///
  Future<String?> getCartDetails() async {
    var apiToken = userProfile!.userData!.apiToken;
    var uri = '$baseUrl/api/get_cart_details';
    var request = http.MultipartRequest('POST', Uri.parse(uri));
    request.fields.addAll({
      'api_token': '$apiToken',
      'user_id': '${userProfile!.userData!.id}',
    });
    http.StreamedResponse response = await request.send();
    return await dataResponse(response);
  }

  // ///
  // Future<String?> getCoupens(String? productId) async {
  //   var apiToken = userProfile!.userData!.apiToken;
  //   var url = '$baseUrl/api/coupons?api_token=$apiToken';
  //   var request = http.MultipartRequest('GET', Uri.parse(url));
  //   http.StreamedResponse response = await request.send();
  //   return await dataResponse(response);
  // }

  ///
  Future<String?> checkOut(MakeCheckout checkout) async {
    var apiToken = userProfile!.userData!.apiToken;
    var uid = userProfile!.userData!.id;
    var uri = '$baseUrl/api/checkout';
    var request = http.MultipartRequest('POST', Uri.parse(uri));
    request.fields.addAll({
      'api_token': '$apiToken',
      'user_id': '$uid',
      'market_id': '${checkout.marketId}', // '29',
      'items': jsonEncode(checkout.items!.map((e) => e.toJson()).toList()),
      // '[\n    {\n        "product_id": 47,\n        "product_quantity": 2,\n        "product_price": 16.19,\n        "product_size": "Medium",\n        "product_special_instructions": "Add Extra Cheese",\n        "extras": [\n            {\n                "extras_id": 92,\n                "extras_price": 6,\n                "extras_quantity": 2\n            },\n            {\n                "extras_id": 93,\n                "extras_price": 4,\n                "extras_quantity": 1\n            }\n        ]\n    }\n]',
      'shipping_address_id': '${checkout.shippingAddressId}', // '1',
      'payment_method_type': '${checkout.paymentMethodType}', //'Cash on Delivery',
      'delivery_type': 'Both', //'Cash on Delivery',
      'item_total': '${checkout.itemTotal}', // '32.38',
      'discount': '${checkout.discount}', // '0.00',
      'taxes': '${checkout.taxes}', // '2.62',
      'delivery_charges': '${checkout.deliveryCharges}', // '5.00',
      'order_total': '${checkout.orderTotal}', //'40.00',
      'promo_code': '${checkout.promoCode}', //''
    });
    http.StreamedResponse response = await request.send();
    return await dataResponse(response);
  }

  ///
  Future<String?> getShippingAddresses() async {
    var apiToken = userProfile!.userData!.apiToken;
    var uid = userProfile!.userData!.id;
    var uri = '$baseUrl/api/get_shipping_address';
    var request = http.MultipartRequest('POST', Uri.parse(uri));
    request.fields.addAll({'api_token': '$apiToken', 'user_id': '$uid'});
    http.StreamedResponse response = await request.send();
    return await dataResponse(response);
  }

  ///
  Future<bool?> activeShippingAddresses(addressId) async {
    var apiToken = userProfile!.userData!.apiToken;
    var uid = userProfile!.userData!.id;
    var uri = '$baseUrl/api/use_as_shipping_address';
    var request = http.MultipartRequest('POST', Uri.parse(uri));
    request.fields.addAll({
      'api_token': '$apiToken',
      'user_id': '$uid',
      'shipping_id': '$addressId', // '1',
    });
    http.StreamedResponse response = await request.send();
    return await checkResponse(response);
  }

  ///
  Future<bool?> addShippingAddress(Address address) async {
    var apiToken = userProfile!.userData!.apiToken;
    var uid = userProfile!.userData!.id;
    var uri = '$baseUrl/api/add_shipping_address';
    var request = http.MultipartRequest('POST', Uri.parse(uri));
    request.fields.addAll({
      'api_token': '$apiToken',
      'user_id': '$uid',
      'full_name': '${address.fullName}', // 'Mukhtar Abbas',
      'mobile': '${address.mobile}', // '+92 333 1751075',
      'address': '${address.address}', // 'C block Millat Town Faisalabad',
      'city': '${address.city}', // 'Faisalabad',
      'state': '${address.state}', // 'Pakistan',
      'zip_code': '${address.zipcode}', // '78000',
      'country': '${address.country}', // 'Pakistan'
    });
    http.StreamedResponse response = await request.send();
    return await checkResponse(response);
  }

  ///
  Future<bool?> addPaymentCard(Card card) async {
    var jsonresponse =
        '''{"success": true,"message": "Payment card added successfully","data": {"user_id": "23"}}''';
    var apiToken = userProfile!.userData!.apiToken;
    var uid = userProfile!.userData!.id;
    var uri = '$baseUrl/api/add_payment_card';
    var request = http.MultipartRequest('POST', Uri.parse(uri));
    request.fields.addAll({
      'api_token': '$apiToken',
      'user_id': '$uid',
      'card_holder_name': '${card.id}', // 'Jane Deo',
      'card_number': '${card.lastFourCardDigits}', // '12345678912345',
      'expire_date': '${card.expireDate}', // '12/23',
      'cvv': '${card.cvv}', // '123'
    });
    http.StreamedResponse response = await request.send();
    return await checkResponse(response);
  }

  ///
  Future<String?> getAllPaymentCards() async {
    var apiToken = userProfile!.userData!.apiToken;
    var uid = userProfile!.userData!.id;
    var uri = '$baseUrl/api/get_payment_cards';
    var request = http.MultipartRequest('POST', Uri.parse(uri));
    request.fields.addAll({'api_token': '$apiToken', 'user_id': '$uid'});
    http.StreamedResponse response = await request.send();
    return await dataResponse(response);
  }

  ///
  Future<bool?> activePaymentCard(int? cardId) async {
    var apiToken = userProfile!.userData!.apiToken;
    var uid = userProfile!.userData!.id;
    var uri = '$baseUrl/api/use_as_payment_card';
    var request = http.MultipartRequest('POST', Uri.parse(uri));
    request.fields.addAll({'api_token': '$apiToken', 'user_id': '$uid', 'card_id': '$cardId'});
    http.StreamedResponse response = await request.send();
    return await checkResponse(response);
  }

  ///
  Future<String?> getDeliveredOrders(int getProcessingPage) async {
    var apiToken = userProfile!.userData!.apiToken;
    var uid = userProfile!.userData!.id;
    var uri = '$baseUrl/api/delivered_orders?page=$getProcessingPage';
    var request = http.MultipartRequest('POST', Uri.parse(uri));
    request.fields.addAll({'api_token': '$apiToken', 'user_id': '$uid'});
    http.StreamedResponse response = await request.send();
    return await dataResponse(response);
  }

  ///
  Future<String?> getProcessingOrders(int getProcessingPage) async {
    var apiToken = userProfile!.userData!.apiToken;
    var uid = userProfile!.userData!.id;
    var uri = '$baseUrl/api/processing_orders?page=$getProcessingPage';
    var request = http.MultipartRequest('POST', Uri.parse(uri));
    request.fields.addAll({'api_token': '$apiToken', 'user_id': '$uid'});
    http.StreamedResponse response = await request.send();
    return await dataResponse(response);
  }

  ///
  Future<String?> getCancelledOrders() async {
    var apiToken = userProfile!.userData!.apiToken;
    var uid = userProfile!.userData!.id;
    var uri = '$baseUrl/api/cancelled_orders';
    var request = http.MultipartRequest('POST', Uri.parse(uri));
    request.fields.addAll({'api_token': '$apiToken', 'user_id': '$uid'});
    http.StreamedResponse response = await request.send();
    return await dataResponse(response);
  }

  ///
  Future<String?> getOrderDetail(String? orderId) async {
    var apiToken = userProfile!.userData!.apiToken;
    var uid = userProfile!.userData!.id;
    var uri = '$baseUrl/api/order_detail';
    var request = http.MultipartRequest('POST', Uri.parse(uri));
    request.fields.addAll({
      'api_token': '$apiToken',
      'user_id': '$uid',
      'order_id': '$orderId', // '8',
    });
    http.StreamedResponse response = await request.send();
    return await dataResponse(response);
  }

  ///
  ///
  Future<String?> getReorderApi(String? Userid, String? Orderid) async {
    var apiToken = userProfile!.userData!.apiToken;
    var uri = '$baseUrl/api/reorder';
    var request = http.MultipartRequest('POST', Uri.parse(uri));
    request.fields.addAll({
      'api_token': '$apiToken',
      'user_id': '$Userid',
      'order_id': '$Orderid', // '8',
      'payment_method_type': 'Cash on Delivery', // '8',
    });
    http.StreamedResponse response = await request.send();
    return await dataResponse(response);
  }

  ///
  Future<bool?> cancelOrder(String? orderId) async {
    var apiToken = userProfile!.userData!.apiToken;
    var uid = userProfile!.userData!.id;
    var uri = '$baseUrl/api/cancel_order';
    var request = http.MultipartRequest('POST', Uri.parse(uri));
    request.fields.addAll({
      'api_token': '$apiToken',
      'user_id': '$uid',
      'order_id': '$orderId', // '8',
    });
    http.StreamedResponse response = await request.send();
    return await checkResponse(response);
  }

  ///
  Future<String?> trackOrder(String ordertracId) async {
    var apiToken = userProfile!.userData!.apiToken;
    var uid = userProfile!.userData!.id;
    var uri = '$baseUrl/api/track_order';
    var request = http.MultipartRequest('POST', Uri.parse(uri));
    request.fields.addAll({
      'api_token': '$apiToken',
      'user_id': '$uid',
      'order_id': '$ordertracId', // '8',
    });
    http.StreamedResponse response = await request.send();
    return await dataResponse(response);
  }

  ///
  Future<bool?> orderRating(Review? review) async {
    var apiToken = userProfile!.userData!.apiToken;
    var uri = '$baseUrl/api/order_rating';
    var request = http.MultipartRequest('POST', Uri.parse(uri));
    request.fields.addAll({
      'api_token': '$apiToken',
      'user_id': '${review!.userId}', // 3
      'order_id': '${review.orderId}', // '8',
      'rating': '${review.rating}', // '4',
      'review': '${review.review}', // 'Good service and quality food'
    });
    if (review.reviewPhotos!.isNotEmpty) {
      request.files.add(await http.MultipartFile.fromPath('photos[]', review.reviewPhotos![0]));
    }
    if (review.reviewPhotos!.length >= 2) {
      request.files.add(await http.MultipartFile.fromPath('photos[]', review.reviewPhotos![1]));
    }
    if (review.reviewPhotos!.length >= 3) {
      request.files.add(await http.MultipartFile.fromPath('photos[]', review.reviewPhotos![2]));
    }
    if (review.reviewPhotos!.length >= 4) {
      request.files.add(await http.MultipartFile.fromPath('photos[]', review.reviewPhotos![3]));
    }

    http.StreamedResponse response = await request.send();
    return await checkResponse(response);
  }

  ///

  Future<String?> customerReviews(String? userId) async {
    var apiToken = userProfile!.userData!.apiToken;

    var uri = '$baseUrl/api/customer_reviews';
    var request = http.MultipartRequest('POST', Uri.parse(uri));
    request.fields.addAll({'api_token': '$apiToken', 'user_id': '$userId'});
    http.StreamedResponse response = await request.send();
    return await dataResponse(response);
  }

  //////////////////////////////////////////////////////////////////////////////
  /// Response Functions
  static Future<String?> dataResponse(http.StreamedResponse response) async {
    if (response.statusCode == 200) {
      var data = await response.stream.bytesToString();
      // print(data);
      return data;
    } else {
      dprint(response.reasonPhrase);
      return null;
    }
  }

  ///
  static Future<bool?> checkResponse(http.StreamedResponse response) async {
    if (response.statusCode == 200) {
      var data = await response.stream.bytesToString();
      dprint(data);
      return true;
    } else {
      dprint(response.reasonPhrase);
      return false;
    }
  }

  /// real estate featurelist  api.
  Future<String?> getFeatureList() async {
    var uri = '$baseUrl/api/realestate/get_all_features';
    var request = http.MultipartRequest('POST', Uri.parse(uri));
    http.StreamedResponse response = await request.send();
    return await dataResponse(response);
  }

  /// real estate saveProperty  api.

  Future<String?> saveProperty(
      String title,
      String price,
      String area,
      String description,
      String areaUnitValue,
      String bedRoomValue,
      String bathRoomValue,
      String isfurneshedValue,
      String saleRenttype,
      String isFloorLevel,
      String commercialTypes,
      String isCategoryValue,
      String addressL,
      String latitudeL,
      String longitudeL,
      List<String> imagepath,
      List featurelist) async {
    print(title);
    print(price);
    print(area);
    print(description);
    print(areaUnitValue);
    print(bedRoomValue);
    print(bathRoomValue);
    print(isfurneshedValue);
    print(latitudeL);
    print(addressL);
    print(longitudeL);
    print(saleRenttype);

    var headers = {'Accept': 'application/json'};
    var apiToken = userProfile!.userData!.apiToken;
    var uri = '$baseUrl/api/realestate/add_property_listing';
    var request = http.MultipartRequest('POST', Uri.parse(uri));
    request.fields.addAll({
      'api_token': '$apiToken',
      'type': saleRenttype,
      'category_id': isCategoryValue,
      'title': title,
      'price': price,
      'furnished_status': isfurneshedValue,
      'land_type': 'Agriculture Land',
      'commercial_type': commercialTypes,
      'bedroom': bedRoomValue,
      'bathroom': bathRoomValue,
      'features': jsonEncode(featurelist),
      'area_unit': areaUnitValue,
      'area': area,
      'address': addressL,
      'latitude': latitudeL,
      'longitude': longitudeL,
      'description': description,
      'floor_level': isFloorLevel
    });
    if (imagepath.isNotEmpty) {
      for (int i = 0; i < imagepath.length; i++) {
        request.files.add(await http.MultipartFile.fromPath('images[]', imagepath[i]));
      }
    }
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }

    if (imagepath.isNotEmpty) {
      for (int i = 0; i < imagepath.length; i++) {
        request.files.add(await http.MultipartFile.fromPath('images[]', imagepath[i]));
      }
    }
  }

  Future<String?> getRSHomeData(
      String userId,
      String listing_type,
      String category_id,
      String price_min,
      String price_max,
      String statusIsfurneshed,
      String bedrooms,
      String bathrooms,
      String area_unit,
      String area_start,
      String area_end) async {
    print("????????????????");
    print(latitude);
    print(longitude);
    print("?>?>?>?>?>?>?>>?>?>?");
    var uri = '$baseUrl/api/realestate/get_homepage_details';
    var request = http.MultipartRequest('POST', Uri.parse(uri));
    request.fields.addAll({
      'user_latitude': latitude ?? "",
      'user_longitude': longitude ?? "",
      'user_id': userId ?? "",
      'listing_type': listing_type ?? "",
      'category_id': category_id ?? "",
      'price_min': price_min ?? "",
      'price_max': price_max ?? "",
      'status': statusIsfurneshed ?? "",
      'bedrooms': bedrooms ?? "",
      'bathrooms': bathrooms ?? "",
      'area_unit': area_unit ?? "",
      'area_start': area_start ?? "",
      'area_end': area_end ?? "",
    });
    http.StreamedResponse response = await request.send();
    return await dataResponse(response);
  }

  /// real estate viewall  api.

  Future<String?> getREViewAll(int getProcessingPage, String viewValue, String userID) async {
    print(viewValue);
    var uri = '$baseUrl/api/realestate/view_all_nearby_and_recommended?page=$getProcessingPage';
    var request = http.MultipartRequest('POST', Uri.parse(uri));
    request.fields.addAll({
      'user_latitude': latitude ?? "",
      'user_longitude': longitude ?? "",
      'type': viewValue,
      'user_id': userID,
    });
    http.StreamedResponse response = await request.send();
    return await dataResponse(response);
  }

  /// real Myads api.

  Future<String?> getMyads(int getProcessingPage,String useriD) async {
    var apiToken = userProfile!.userData!.apiToken;
    var uri = '$baseUrl/api/realestate/my_ads?page=$getProcessingPage';
    var request = http.MultipartRequest('POST', Uri.parse(uri));
    request.fields.addAll({
      'api_token': '$apiToken',
      'user_id': useriD,
    });
    http.StreamedResponse response = await request.send();
    return await dataResponse(response);
  }

  /// real add favourite api.

  Future<String?> addRSFavorite(String restaurantID) async {
    print(userProfile!.userData!.id);
    print(restaurantID);
    var apiToken = userProfile!.userData!.apiToken;
    var uri = '$baseUrl/api/realestate/favorite_listings';
    var request = http.MultipartRequest('POST', Uri.parse(uri));
    request.fields.addAll({
      'api_token': '$apiToken',
      'listing_id': restaurantID, // 'NewYear2023','100'
    });
    http.StreamedResponse response = await request.send();
    return await dataResponse(response);
  }

  /// real get my favourite api.

  Future<String?> getmyFavouriteAds(int getProcessingPage) async {
    var apiToken = userProfile!.userData!.apiToken;
    var uri = '$baseUrl/api/realestate/get_all_favorite_listings?page=$getProcessingPage';
    var request = http.MultipartRequest('POST', Uri.parse(uri));
    request.fields.addAll({
      'api_token': '$apiToken',
    });
    http.StreamedResponse response = await request.send();
    return await dataResponse(response);
  }
}
