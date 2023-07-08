class NearByRestaurants {
  bool? success;
  String? message;
  List<Restaurant>? restaurants;

  NearByRestaurants({this.success, this.message, this.restaurants});

  NearByRestaurants.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      restaurants = <Restaurant>[];
      json['data'].forEach((v) {
        restaurants!.add(Restaurant.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (restaurants != null) {
      data['data'] = restaurants!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Restaurant {
  String? id;
  String? name;
  String? description;
  String? address;
  String? openStatus;
  String? totalReviews;
  var averageRating;
  String? distance;
  var deliveryCharges;
  String? logo;

  Restaurant({
    this.id,
    this.name,
    this.description,
    this.address,
    this.openStatus,
    this.totalReviews,
    this.averageRating,
    this.distance,
    this.deliveryCharges,
    this.logo,
  });

  Restaurant.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    address = json['address'];
    openStatus = json['open_status'];
    totalReviews = json['total_reviews'];
    averageRating = json['average_rating'];
    distance = json['distance'];
    deliveryCharges = json['delivery_charges'];
    logo = json['logo'];
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
    data['delivery_charges'] = deliveryCharges;
    data['logo'] = logo;
    return data;
  }
}

// class Restaurant {
//   String? id;
//   String? name;
//   String? description;
//   String? address;
//   String? openStatus;
//   String? totalReviews;
//   int? averageRating;
//   String? distance;
//   String? logo;

//   Restaurant({
//     this.id,
//     this.name,
//     this.description,
//     this.address,
//     this.openStatus,
//     this.totalReviews,
//     this.averageRating,
//     this.distance,
//     this.logo,
//   });

//   Restaurant.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     description = json['description'];
//     address = json['address'];
//     openStatus = json['open_status'];
//     totalReviews = json['total_reviews'];
//     averageRating = json['average_rating'];
//     distance = json['distance'];
//     logo = json['logo'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['name'] = name;
//     data['description'] = description;
//     data['address'] = address;
//     data['open_status'] = openStatus;
//     data['total_reviews'] = totalReviews;
//     data['average_rating'] = averageRating;
//     data['distance'] = distance;
//     data['logo'] = logo;
//     return data;
//   }
// }
