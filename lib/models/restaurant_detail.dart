import 'package:derapidos/models/categories.dart';

class RestaurantDetails {
  bool? success;
  String? message;
  Data? data;

  RestaurantDetails({this.success, this.message, this.data});

  RestaurantDetails.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  MarketDetails? marketDetails;
  List<Category>? categoryList;
  ProductList? productList;

  Data({this.marketDetails, this.categoryList, this.productList});

  Data.fromJson(Map<String, dynamic> json) {
    marketDetails = json['market_details'] != null ? MarketDetails.fromJson(json['market_details']) : null;
    if (json['category_list'] != null) {
      categoryList = <Category>[];
      json['category_list'].forEach((v) {
        categoryList!.add(Category.fromJson(v));
      });
    }
    productList = json['product_list'] != null ? ProductList.fromJson(json['product_list']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (marketDetails != null) {
      data['market_details'] = marketDetails!.toJson();
    }
    if (categoryList != null) {
      data['category_list'] = categoryList!.map((v) => v.toJson()).toList();
    }
    if (productList != null) {
      data['product_list'] = productList!.toJson();
    }
    return data;
  }
}

class MarketDetails {
  int? id;
  String? name;
  String? description;
  String? address;
  String? openStatus;
  dynamic totalReviews;
  dynamic? averageRating;
  String? distance;
  dynamic? time;
  String? logo;
  String? bannerImage;
  String? deliveryType;
  dynamic? restaurantDeliveryCharges;
  dynamic derapidosDeliveryCharges;
  String? minimumOrderPrice;
  MarketDetails({
    this.id,
    this.name,
    this.description,
    this.address,
    this.openStatus,
    this.totalReviews,
    this.averageRating,
    this.distance,
    this.time,
    this.logo,
    this.bannerImage,
    this.deliveryType,
    this.restaurantDeliveryCharges,
    this.derapidosDeliveryCharges,
    this.minimumOrderPrice
  });

  MarketDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    address = json['address'];
    openStatus = json['open_status'];
    totalReviews = json['total_reviews'];
    averageRating = json['average_rating'];
    distance = json['distance'];
    time = json['time'];
    logo = json['logo'];
    bannerImage = json['banner_image'];
    deliveryType = json['delivery_type'];
    restaurantDeliveryCharges = json['restaurant_delivery_charges'];
    derapidosDeliveryCharges = json['derapidos_delivery_charges'];
    minimumOrderPrice = json['minimum_order_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['address'] = address;
    data['open_status'] = openStatus;
    data['total_reviews'] = totalReviews;
    data['average_rating'] = averageRating;
    data['distance'] = distance;
    data['time'] = this.time;
    data['logo'] = logo;
    data['banner_image'] = bannerImage;
    data['delivery_type'] = this.deliveryType;
    data['restaurant_delivery_charges'] = this.restaurantDeliveryCharges;
    data['derapidos_delivery_charges'] = this.derapidosDeliveryCharges;
    data['minimum_order_price'] = this.minimumOrderPrice;
    return data;
  }
}

/*
class Category {
  String? id;
  String? name;
  String? description;

  Category({this.id, this.name, this.description});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    return data;
  }
}

*/
class ProductList {
  int? currentPage;
  List<StoreProduct>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  String? nextPageUrl;
  String? path;
  int? perPage;
  String? prevPageUrl;
  int? to;
  int? total;

  ProductList({
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  ProductList.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <StoreProduct>[];
      json['data'].forEach((v) {
        data!.add(StoreProduct.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['current_page'] = currentPage;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['first_page_url'] = firstPageUrl;
    data['from'] = from;
    data['last_page'] = lastPage;
    data['last_page_url'] = lastPageUrl;
    data['next_page_url'] = nextPageUrl;
    data['path'] = path;
    data['per_page'] = perPage;
    data['prev_page_url'] = prevPageUrl;
    data['to'] = to;
    data['total'] = total;
    return data;
  }
}

class StoreProduct {
  String? id;
  String? name;
  String? price;
  String? discountPrice;
  String? description;
  String? featured;
  String? deliverable;
  String? image;
  int? favorite;
  String? categoryId;
  bool? isAddToCart;
  bool? isLoadingShow;
  int? updateQuantity;

  StoreProduct({
    this.id,
    this.name,
    this.price,
    this.discountPrice,
    this.description,
    this.featured,
    this.deliverable,
    this.image,
    this.favorite,
    this.categoryId,
    this.isAddToCart,
    this.isLoadingShow,
    this.updateQuantity,
  });

  StoreProduct.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    discountPrice = json['discount_price'];
    description = json['description'];
    featured = json['featured'];
    deliverable = json['deliverable'];
    image = json['image'];
    favorite = json['favorite'];
    categoryId = json['category_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['price'] = price;
    data['discount_price'] = discountPrice;
    data['description'] = description;
    data['featured'] = featured;
    data['deliverable'] = deliverable;
    data['image'] = image;
    data['favorite'] = favorite;
    data['category_id'] = categoryId;
    return data;
  }
}
