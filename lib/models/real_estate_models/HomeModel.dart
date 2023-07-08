class RSHomeModel {
  bool? status;
  List<NearByListing>? nearByListing = [];
  List<RecommendedListing>? recommendedListing = [];

  RSHomeModel({this.status, this.nearByListing, this.recommendedListing});

  RSHomeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['NearByListing'] != null) {
      nearByListing = <NearByListing>[];
      json['NearByListing'].forEach((v) {
        nearByListing!.add(new NearByListing.fromJson(v));
      });
    }
    if (json['RecommendedListing'] != null) {
      recommendedListing = <RecommendedListing>[];
      json['RecommendedListing'].forEach((v) {
        recommendedListing!.add(new RecommendedListing.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.nearByListing != null) {
      data['NearByListing'] = this.nearByListing!.map((v) => v.toJson()).toList();
    }
    if (this.recommendedListing != null) {
      data['RecommendedListing'] = this.recommendedListing!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class NearByListing {
  int? id;
  String? title;
  List<String>? images;
  String? type;
  int? price;
  String? bathrooms;
  String? bedrooms;
  List<String>? features;
  String? area;
  String? address;
  String? description;
  String? createdAt;
  int? userId;
  String? name;
  String? email;
  String? phone;
  int? awardAmount;
  String? profilePic;
  double? distance;
  int? favorite;

  NearByListing(
      {this.id,
      this.title,
      this.images,
      this.type,
      this.price,
      this.bathrooms,
      this.bedrooms,
      this.features,
      this.area,
      this.address,
      this.description,
      this.createdAt,
      this.userId,
      this.name,
      this.email,
      this.phone,
      this.awardAmount,
      this.profilePic,
      this.distance,
      this.favorite});

  NearByListing.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'] ?? "";
    images = json['images'].cast<String>();
    type = json['type'] ?? "";
    price = json['price'];
    bathrooms = json['bathrooms'] ?? "";
    bedrooms = json['bedrooms'] ?? "";
    features = json['features'].cast<String>();
    area = json['area'] ?? "";
    address = json['address'] ?? "";
    description = json['description'] ?? "";
    createdAt = json['created_at'] ?? "";
    userId = json['user_id'] ?? "";
    name = json['name'] ?? "";
    email = json['email'] ?? "";
    phone = json['phone'] ?? "";
    awardAmount = json['award_amount'] ?? "";
    profilePic = json['profile_pic'] ?? "";
    distance = json['distance'];
    favorite = json['favorite'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['images'] = this.images;
    data['type'] = this.type;
    data['price'] = this.price;
    data['bathrooms'] = this.bathrooms;
    data['bedrooms'] = this.bedrooms;
    data['features'] = this.features;
    data['area'] = this.area;
    data['address'] = this.address;
    data['description'] = this.description;
    data['created_at'] = this.createdAt;
    data['user_id'] = this.userId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['award_amount'] = this.awardAmount;
    data['profile_pic'] = this.profilePic;
    data['distance'] = this.distance;
    data['favorite'] = this.favorite;
    return data;
  }
}

class RecommendedListing {
  int? id;
  String? title;
  List<String>? images;
  String? type;
  int? price;
  String? bathrooms;
  String? bedrooms;
  List<String>? features;
  String? area;
  String? address;
  String? description;
  String? createdAt;
  int? userId;
  String? name;
  String? email;
  String? phone;
  int? awardAmount;
  String? profilePic;
  double? distance;
  int? favorite;

  RecommendedListing(
      {this.id,
      this.title,
      this.images,
      this.type,
      this.price,
      this.bathrooms,
      this.bedrooms,
      this.features,
      this.area,
      this.address,
      this.description,
      this.createdAt,
      this.userId,
      this.name,
      this.email,
      this.phone,
      this.awardAmount,
      this.profilePic,
      this.distance,
      this.favorite});

  RecommendedListing.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'] ?? "";
    images = json['images'].cast<String>();
    type = json['type'] ?? "";
    price = json['price'];
    bathrooms = json['bathrooms'] ?? "";
    bedrooms = json['bedrooms'] ?? "";
    features = json['features'].cast<String>();
    area = json['area'] ?? "";
    address = json['address'] ?? "";
    description = json['description'] ?? "";
    createdAt = json['created_at'] ?? "";
    userId = json['user_id'];
    name = json['name'] ?? "";
    email = json['email'] ?? "";
    phone = json['phone'] ?? "";
    awardAmount = json['award_amount'] ?? "";
    profilePic = json['profile_pic'] ?? "";
    distance = json['distance'];
    favorite = json['favorite'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['images'] = this.images;
    data['type'] = this.type;
    data['price'] = this.price;
    data['bathrooms'] = this.bathrooms;
    data['bedrooms'] = this.bedrooms;
    data['features'] = this.features;
    data['area'] = this.area;
    data['address'] = this.address;
    data['description'] = this.description;
    data['created_at'] = this.createdAt;
    data['user_id'] = this.userId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['award_amount'] = this.awardAmount;
    data['profile_pic'] = this.profilePic;
    data['distance'] = this.distance;
    data['favorite'] = this.favorite;
    return data;
  }
}
