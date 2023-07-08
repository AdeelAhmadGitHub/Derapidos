class HomePageProduct {
  bool? success;
  int? message;
  Data? data;

  HomePageProduct({this.success, this.message, this.data});

  HomePageProduct.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  bool? status;
  List<InternationalCuisinesRestaurants>? internationalCuisinesRestaurants;
  List<HomemadeLocalCuisinesRestaurants>? homemadeLocalCuisinesRestaurants;
  List<PopularRestaurants>? popularRestaurants;
  List<DiscountedRestaurants>? discountedRestaurants;
  List<NearbyRestaurants>? nearbyRestaurants;
  List<Products>? products;

  Data(
      {this.status,
        this.internationalCuisinesRestaurants,
        this.homemadeLocalCuisinesRestaurants,
        this.popularRestaurants,
        this.discountedRestaurants,
        this.nearbyRestaurants});

  Data.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['internationalCuisinesRestaurants'] != null) {
      internationalCuisinesRestaurants = <InternationalCuisinesRestaurants>[];
      json['internationalCuisinesRestaurants'].forEach((v) {
        internationalCuisinesRestaurants!
            .add(new InternationalCuisinesRestaurants.fromJson(v));
      });
    }
    if (json['homemadeLocalCuisinesRestaurants'] != null) {
      homemadeLocalCuisinesRestaurants = <HomemadeLocalCuisinesRestaurants>[];
      json['homemadeLocalCuisinesRestaurants'].forEach((v) {
        homemadeLocalCuisinesRestaurants!
            .add(new HomemadeLocalCuisinesRestaurants.fromJson(v));
      });
    }
    if (json['popularRestaurants'] != null) {
      popularRestaurants = <PopularRestaurants>[];
      json['popularRestaurants'].forEach((v) {
        popularRestaurants!.add(new PopularRestaurants.fromJson(v));
      });
    }
    if (json['discountedRestaurants'] != null) {
      discountedRestaurants = <DiscountedRestaurants>[];
      json['discountedRestaurants'].forEach((v) {
        discountedRestaurants!.add(new DiscountedRestaurants.fromJson(v));
      });
    }
    if (json['nearbyRestaurants'] != null) {
      nearbyRestaurants = <NearbyRestaurants>[];
      json['nearbyRestaurants'].forEach((v) {
        nearbyRestaurants!.add(new NearbyRestaurants.fromJson(v));
      });
    }
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.internationalCuisinesRestaurants != null) {
      data['internationalCuisinesRestaurants'] = this
          .internationalCuisinesRestaurants!
          .map((v) => v.toJson())
          .toList();
    }
    if (this.homemadeLocalCuisinesRestaurants != null) {
      data['homemadeLocalCuisinesRestaurants'] = this
          .homemadeLocalCuisinesRestaurants!
          .map((v) => v.toJson())
          .toList();
    }
    if (this.popularRestaurants != null) {
      data['popularRestaurants'] =
          this.popularRestaurants!.map((v) => v.toJson()).toList();
    }
    if (this.discountedRestaurants != null) {
      data['discountedRestaurants'] =
          this.discountedRestaurants!.map((v) => v.toJson()).toList();
    }
    if (this.nearbyRestaurants != null) {
      data['nearbyRestaurants'] =
          this.nearbyRestaurants!.map((v) => v.toJson()).toList();
    }
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class InternationalCuisinesRestaurants {
  dynamic id;
  String? name;
  String? description;
  String? address;
  String? logo;
  String? banner;
  String? deliveryType;
  dynamic restaurantDeliveryCharges;
  String? derapidosDeliveryCharges;
  String? distance;
  String? time;
  String? totalReviews;
  int? averageRating;
  String? openStatus;
  int? favourite;
  String? minimumOrderPrice;
  InternationalCuisinesRestaurants(
      {this.id,
        this.name,
        this.description,
        this.address,
        this.logo,
        this.banner,
        this.deliveryType,
        this.restaurantDeliveryCharges,
        this.derapidosDeliveryCharges,
        this.distance,
        this.time,
        this.totalReviews,
        this.averageRating,
        this.openStatus,
        this.favourite,
        this.minimumOrderPrice
      });

  InternationalCuisinesRestaurants.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    address = json['address'];
    logo = json['logo'];
    banner = json['banner'];
    deliveryType = json['delivery_type'];
    restaurantDeliveryCharges = json['restaurant_delivery_charges'];
    derapidosDeliveryCharges = json['derapidos_delivery_charges'];
    distance = json['distance'];
    time = json['time'];
    totalReviews = json['total_reviews'];
    averageRating = json['average_rating'];
    openStatus = json['open_status'];
    favourite = json['favourite'];
    minimumOrderPrice = json['minimum_order_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['address'] = this.address;
    data['logo'] = this.logo;
    data['banner'] = this.banner;
    data['delivery_type'] = this.deliveryType;
    data['restaurant_delivery_charges'] = this.restaurantDeliveryCharges;
    data['derapidos_delivery_charges'] = this.derapidosDeliveryCharges;
    data['distance'] = this.distance;
    data['time'] = this.time;
    data['total_reviews'] = this.totalReviews;
    data['average_rating'] = this.averageRating;
    data['open_status'] = this.openStatus;
    data['favourite'] = this.favourite;
    data['minimum_order_price'] = this.minimumOrderPrice;
    return data;
  }
}
class HomemadeLocalCuisinesRestaurants {
  dynamic id;
  String? name;
  String? description;
  String? address;
  String? logo;
  String? banner;
  String? deliveryType;
  dynamic restaurantDeliveryCharges;
  String? derapidosDeliveryCharges;
  String? distance;
  String? time;
  String? totalReviews;
  int? averageRating;
  String? openStatus;
  int? favourite;
  String? minimumOrderPrice;
  HomemadeLocalCuisinesRestaurants(
      {this.id,
        this.name,
        this.description,
        this.address,
        this.logo,
        this.banner,
        this.deliveryType,
        this.restaurantDeliveryCharges,
        this.derapidosDeliveryCharges,
        this.distance,
        this.time,
        this.totalReviews,
        this.averageRating,
        this.openStatus,
        this.favourite,
        this.minimumOrderPrice
      });

  HomemadeLocalCuisinesRestaurants.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    address = json['address'];
    logo = json['logo'];
    banner = json['banner'];
    deliveryType = json['delivery_type'];
    restaurantDeliveryCharges = json['restaurant_delivery_charges'];
    derapidosDeliveryCharges = json['derapidos_delivery_charges'];
    distance = json['distance'];
    time = json['time'];
    totalReviews = json['total_reviews'];
    averageRating = json['average_rating'];
    openStatus = json['open_status'];
    favourite = json['favourite'];
    minimumOrderPrice = json['minimum_order_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['address'] = this.address;
    data['logo'] = this.logo;
    data['banner'] = this.banner;
    data['delivery_type'] = this.deliveryType;
    data['restaurant_delivery_charges'] = this.restaurantDeliveryCharges;
    data['derapidos_delivery_charges'] = this.derapidosDeliveryCharges;
    data['distance'] = this.distance;
    data['time'] = this.time;
    data['total_reviews'] = this.totalReviews;
    data['average_rating'] = this.averageRating;
    data['open_status'] = this.openStatus;
    data['favourite'] = this.favourite;
    data['minimum_order_price'] = this.minimumOrderPrice;
    return data;
  }
}
class PopularRestaurants {
  dynamic id;
  String? name;
  String? description;
  String? address;
  String? logo;
  String? banner;
  String? deliveryType;
  dynamic? restaurantDeliveryCharges;
  dynamic? derapidosDeliveryCharges;
  String? distance;
  String? time;
  dynamic? totalReviews;
  dynamic? averageRating;
  String? openStatus;
  int? favourite;
  String? minimumOrderPrice;
  PopularRestaurants(
      {this.id,
        this.name,
        this.description,
        this.address,
        this.logo,
        this.banner,
        this.deliveryType,
        this.restaurantDeliveryCharges,
        this.derapidosDeliveryCharges,
        this.distance,
        this.time,
        this.totalReviews,
        this.averageRating,
        this.openStatus,
        this.favourite,
        this.minimumOrderPrice

      });

  PopularRestaurants.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    address = json['address'];
    logo = json['logo'];
    banner = json['banner'];
    deliveryType = json['delivery_type'];
    restaurantDeliveryCharges = json['restaurant_delivery_charges'];
    derapidosDeliveryCharges = json['derapidos_delivery_charges'];
    distance = json['distance'];
    time = json['time'];
    totalReviews = json['total_reviews'];
    averageRating = json['average_rating'];
    openStatus = json['open_status'];
    favourite = json['favourite'];
    minimumOrderPrice = json['minimum_order_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['address'] = this.address;
    data['logo'] = this.logo;
    data['banner'] = this.banner;
    data['delivery_type'] = this.deliveryType;
    data['restaurant_delivery_charges'] = this.restaurantDeliveryCharges;
    data['derapidos_delivery_charges'] = this.derapidosDeliveryCharges;
    data['distance'] = this.distance;
    data['time'] = this.time;
    data['total_reviews'] = this.totalReviews;
    data['average_rating'] = this.averageRating;
    data['open_status'] = this.openStatus;
    data['favourite'] = this.favourite;
    data['minimum_order_price'] = this.minimumOrderPrice;
    return data;
  }
}

class DiscountedRestaurants {
  dynamic id;
  String? name;
  String? description;
  String? address;
  String? logo;
  String? banner;
  String? deliveryType;
  dynamic restaurantDeliveryCharges;
  String? derapidosDeliveryCharges;
  String? distance;
  String? time;
  String? totalReviews;
  dynamic averageRating;
  String? openStatus;
  int? favourite;
  String? minimumOrderPrice;
  DiscountedRestaurants(
      {this.id,
        this.name,
        this.description,
        this.address,
        this.logo,
        this.banner,
        this.deliveryType,
        this.restaurantDeliveryCharges,
        this.derapidosDeliveryCharges,
        this.distance,
        this.time,
        this.totalReviews,
        this.averageRating,
        this.openStatus,
        this.favourite,
        this.minimumOrderPrice
      });

  DiscountedRestaurants.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    address = json['address'];
    logo = json['logo'];
    banner = json['banner'];
    deliveryType = json['delivery_type'];
    restaurantDeliveryCharges = json['restaurant_delivery_charges'];
    derapidosDeliveryCharges = json['derapidos_delivery_charges'];
    distance = json['distance'];
    time = json['Time'];
    totalReviews = json['total_reviews'];
    averageRating = json['average_rating'];
    openStatus = json['open_status'];
    favourite = json['favourite'];
    minimumOrderPrice = json['minimum_order_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['address'] = this.address;
    data['logo'] = this.logo;
    data['banner'] = this.banner;
    data['delivery_type'] = this.deliveryType;
    data['restaurant_delivery_charges'] = this.restaurantDeliveryCharges;
    data['derapidos_delivery_charges'] = this.derapidosDeliveryCharges;
    data['distance'] = this.distance;
    data['Time'] = this.time;
    data['total_reviews'] = this.totalReviews;
    data['average_rating'] = this.averageRating;
    data['open_status'] = this.openStatus;
    data['favourite'] = this.favourite;
    data['minimum_order_price'] = this.minimumOrderPrice;
    return data;
  }
}
class NearbyRestaurants {
  dynamic id;
  String? name;
  String? description;
  String? address;
  String? logo;
  String? banner;
  String? deliveryType;
  dynamic? restaurantDeliveryCharges;
  String? derapidosDeliveryCharges;
  String? distance;
  String? time;
  String? totalReviews;
  dynamic? averageRating;
  String? openStatus;
  int? favourite;
  String? minimumOrderPrice;
  NearbyRestaurants(
      {this.id,
        this.name,
        this.description,
        this.address,
        this.logo,
        this.banner,
        this.deliveryType,
        this.restaurantDeliveryCharges,
        this.derapidosDeliveryCharges,
        this.distance,
        this.time,
        this.totalReviews,
        this.averageRating,
        this.openStatus,
        this.favourite,
        this.minimumOrderPrice
      });

  NearbyRestaurants.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    address = json['address'];
    logo = json['logo'];
    banner = json['banner'];
    deliveryType = json['delivery_type'];
    restaurantDeliveryCharges = json['restaurant_delivery_charges'];
    derapidosDeliveryCharges = json['derapidos_delivery_charges'];
    distance = json['distance'];
    time = json['time'];
    totalReviews = json['total_reviews'];
    averageRating = json['average_rating'];
    openStatus = json['open_status'];
    favourite = json['favourite'];
    minimumOrderPrice = json['minimum_order_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['address'] = this.address;
    data['logo'] = this.logo;
    data['banner'] = this.banner;
    data['delivery_type'] = this.deliveryType;
    data['restaurant_delivery_charges'] = this.restaurantDeliveryCharges;
    data['derapidos_delivery_charges'] = this.derapidosDeliveryCharges;
    data['distance'] = this.distance;
    data['time'] = this.time;
    data['total_reviews'] = this.totalReviews;
    data['average_rating'] = this.averageRating;
    data['open_status'] = this.openStatus;
    data['favourite'] = this.favourite;
    data['minimum_order_price'] = this.minimumOrderPrice;
    return data;
  }

}
class Products {
  int? id;
  String? name;
  int? price;
  int? discountPrice;
  String? description;
  bool? featured;
  bool? deliverable;
  String? image;
  int? categoryId;
  int? marketId;

  Products({this.id,
    this.name,
    this.price,
    this.discountPrice,
    this.description,
    this.featured,
    this.deliverable,
    this.image,
    this.categoryId,
    this.marketId});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    discountPrice = json['discount_price'];
    description = json['description'];
    featured = json['featured'];
    deliverable = json['deliverable'];
    image = json['image'];
    categoryId = json['category_id'];
    marketId = json['market_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['price'] = this.price;
    data['discount_price'] = this.discountPrice;
    data['description'] = this.description;
    data['featured'] = this.featured;
    data['deliverable'] = this.deliverable;
    data['image'] = this.image;
    data['category_id'] = this.categoryId;
    data['market_id'] = this.marketId;
    return data;
  }
}