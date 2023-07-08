class FilterModel {
  bool? success;
  int? message;
  Data? data;

  FilterModel({this.success, this.message, this.data});

  FilterModel.fromJson(Map<String, dynamic> json) {
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
    return data;
  }
}

class InternationalCuisinesRestaurants {
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
        this.openStatus});

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
    return data;
  }
}
class HomemadeLocalCuisinesRestaurants {
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
        this.openStatus});

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
    return data;
  }
}
class PopularRestaurants {
  int? id;
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
        this.openStatus});

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
    return data;
  }
}

class DiscountedRestaurants {
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
        this.openStatus});

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
    return data;
  }
}
class NearbyRestaurants {
  dynamic? id;
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
        this.openStatus});

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
    return data;
  }
}