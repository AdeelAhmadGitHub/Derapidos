class HomeModel {
  HomeModel({
    this.success,
    this.message,
    this.data,
  });

  HomeModel.fromJson(dynamic json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? Data1.fromJson(json['data']) : null;
  }
  bool? success;
  int? message;
  Data1? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    map['message'] = message;
    if (data != null) {
      map['data'] = data!.toJson();
    }
    return map;
  }
}

class Data1 {
  Data1({
    this.status,
    this.internationalCuisinesRestaurants,
    this.homemadeLocalCuisinesRestaurants,
    this.popularRestaurants,
    this.discountedRestaurants,
    this.nearbyRestaurants,
  });

  Data1.fromJson(dynamic json) {
    status = json['status'];
    if (json['internationalCuisinesRestaurants'] != null) {
      internationalCuisinesRestaurants = [];
      json['internationalCuisinesRestaurants'].forEach((v) {
        internationalCuisinesRestaurants!
            .add(InternationalCuisinesRestaurants.fromJson(v));
      });
    }
    if (json['homemadeLocalCuisinesRestaurants'] != null) {
      homemadeLocalCuisinesRestaurants = [];
      json['homemadeLocalCuisinesRestaurants'].forEach((v) {
        homemadeLocalCuisinesRestaurants!
            .add(HomemadeLocalCuisinesRestaurants.fromJson(v));
      });
    }
    if (json['popularRestaurants'] != null) {
      popularRestaurants = [];
      json['popularRestaurants'].forEach((v) {
        popularRestaurants!.add(PopularRestaurants.fromJson(v));
      });
    }
    if (json['discountedRestaurants'] != null) {
      discountedRestaurants = [];
      json['discountedRestaurants'].forEach((v) {
        discountedRestaurants!.add(DiscountedRestaurants.fromJson(v));
      });
    }
    if (json['nearbyRestaurants'] != null) {
      nearbyRestaurants = [];
      json['nearbyRestaurants'].forEach((v) {
        nearbyRestaurants!.add(NearbyRestaurants.fromJson(v));
      });
    }
  }
  bool? status;
  List<InternationalCuisinesRestaurants>? internationalCuisinesRestaurants;
  List<HomemadeLocalCuisinesRestaurants>? homemadeLocalCuisinesRestaurants;
  List<PopularRestaurants>? popularRestaurants;
  List<DiscountedRestaurants>? discountedRestaurants;
  List<NearbyRestaurants>? nearbyRestaurants;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    if (internationalCuisinesRestaurants != null) {
      map['internationalCuisinesRestaurants'] =
          internationalCuisinesRestaurants!.map((v) => v.toJson()).toList();
    }
    if (homemadeLocalCuisinesRestaurants != null) {
      map['homemadeLocalCuisinesRestaurants'] =
          homemadeLocalCuisinesRestaurants!.map((v) => v.toJson()).toList();
    }
    if (popularRestaurants != null) {
      map['popularRestaurants'] =
          popularRestaurants!.map((v) => v.toJson()).toList();
    }
    if (discountedRestaurants != null) {
      map['discountedRestaurants'] =
          discountedRestaurants!.map((v) => v.toJson()).toList();
    }
    if (nearbyRestaurants != null) {
      map['nearbyRestaurants'] =
          nearbyRestaurants!.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class HomemadeLocalCuisinesRestaurants {
  HomemadeLocalCuisinesRestaurants({
    this.id,
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
  });

  HomemadeLocalCuisinesRestaurants.fromJson(dynamic json) {
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
  }
  int? id;
  String? name;
  String? description;
  String? address;
  String? logo;
  String? banner;
  String? deliveryType;
  int? restaurantDeliveryCharges;
  String? derapidosDeliveryCharges;
  String? distance;
  String? time;
  String? totalReviews;
  int? averageRating;
  String? openStatus;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['description'] = description;
    map['address'] = address;
    map['logo'] = logo;
    map['banner'] = banner;
    map['delivery_type'] = deliveryType;
    map['restaurant_delivery_charges'] = restaurantDeliveryCharges;
    map['derapidos_delivery_charges'] = derapidosDeliveryCharges;
    map['distance'] = distance;
    map['time'] = time;
    map['total_reviews'] = totalReviews;
    map['average_rating'] = averageRating;
    map['open_status'] = openStatus;
    return map;
  }
}

class InternationalCuisinesRestaurants {
  InternationalCuisinesRestaurants({
    this.id,
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
  });

  InternationalCuisinesRestaurants.fromJson(dynamic json) {
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
  }
  int? id;
  String? name;
  String? description;
  String? address;
  String? logo;
  String? banner;
  String? deliveryType;
  int? restaurantDeliveryCharges;
  String? derapidosDeliveryCharges;
  String? distance;
  String? time;
  String? totalReviews;
  int? averageRating;
  String? openStatus;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['description'] = description;
    map['address'] = address;
    map['logo'] = logo;
    map['banner'] = banner;
    map['delivery_type'] = deliveryType;
    map['restaurant_delivery_charges'] = restaurantDeliveryCharges;
    map['derapidos_delivery_charges'] = derapidosDeliveryCharges;
    map['distance'] = distance;
    map['time'] = time;
    map['total_reviews'] = totalReviews;
    map['average_rating'] = averageRating;
    map['open_status'] = openStatus;
    return map;
  }
}

class NearbyRestaurants {
  NearbyRestaurants({
    this.id,
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
  });

  NearbyRestaurants.fromJson(dynamic json) {
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
  }
  int? id;
  String? name;
  String? description;
  String? address;
  String? logo;
  String? banner;
  String? deliveryType;
  String? restaurantDeliveryCharges;
  String? derapidosDeliveryCharges;
  String? distance;
  String? time;
  String? totalReviews;
  double? averageRating;
  String? openStatus;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['description'] = description;
    map['address'] = address;
    map['logo'] = logo;
    map['banner'] = banner;
    map['delivery_type'] = deliveryType;
    map['restaurant_delivery_charges'] = restaurantDeliveryCharges;
    map['derapidos_delivery_charges'] = derapidosDeliveryCharges;
    map['distance'] = distance;
    map['time'] = time;
    map['total_reviews'] = totalReviews;
    map['average_rating'] = averageRating;
    map['open_status'] = openStatus;
    return map;
  }
}

class DiscountedRestaurants {
  DiscountedRestaurants({
    this.id,
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
  });

  DiscountedRestaurants.fromJson(dynamic json) {
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
  }
  int? id;
  String? name;
  String? description;
  String? address;
  String? logo;
  String? banner;
  String? deliveryType;
  int? restaurantDeliveryCharges;
  String? derapidosDeliveryCharges;
  String? distance;
  String? time;
  String? totalReviews;
  int? averageRating;
  String? openStatus;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['description'] = description;
    map['address'] = address;
    map['logo'] = logo;
    map['banner'] = banner;
    map['delivery_type'] = deliveryType;
    map['restaurant_delivery_charges'] = restaurantDeliveryCharges;
    map['derapidos_delivery_charges'] = derapidosDeliveryCharges;
    map['distance'] = distance;
    map['Time'] = time;
    map['total_reviews'] = totalReviews;
    map['average_rating'] = averageRating;
    map['open_status'] = openStatus;
    return map;
  }
}

class PopularRestaurants {
  PopularRestaurants({
    this.id,
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
  });

  PopularRestaurants.fromJson(dynamic json) {
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
  }
  int? id;
  String? name;
  String? description;
  String? address;
  String? logo;
  String? banner;
  String? deliveryType;
  String? restaurantDeliveryCharges;
  String? derapidosDeliveryCharges;
  String? distance;
  String? time;
  String? totalReviews;
  double? averageRating;
  String? openStatus;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['description'] = description;
    map['address'] = address;
    map['logo'] = logo;
    map['banner'] = banner;
    map['delivery_type'] = deliveryType;
    map['restaurant_delivery_charges'] = restaurantDeliveryCharges;
    map['derapidos_delivery_charges'] = derapidosDeliveryCharges;
    map['distance'] = distance;
    map['time'] = time;
    map['total_reviews'] = totalReviews;
    map['average_rating'] = averageRating;
    map['open_status'] = openStatus;
    return map;
  }
}
