class FavouriteProduct {
  bool? status;
  FavouriteList? favouriteList;

  FavouriteProduct({this.status, this.favouriteList});

  FavouriteProduct.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    favouriteList = json['favouriteList'] != null
        ? new FavouriteList.fromJson(json['favouriteList'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.favouriteList != null) {
      data['favouriteList'] = this.favouriteList!.toJson();
    }
    return data;
  }
}

class FavouriteList {
  int? currentPage;
  List<Favmodel>? favmodel;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  Null? nextPageUrl;
  String? path;
  int? perPage;
  Null? prevPageUrl;
  int? to;
  int? total;

  FavouriteList(
      {this.currentPage,
        this.favmodel,
        this.firstPageUrl,
        this.from,
        this.lastPage,
        this.lastPageUrl,
        this.nextPageUrl,
        this.path,
        this.perPage,
        this.prevPageUrl,
        this.to,
        this.total});

  FavouriteList.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      favmodel = <Favmodel>[];
      json['data'].forEach((v) {
        favmodel!.add(new Favmodel.fromJson(v));
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_page'] = this.currentPage;
    if (this.favmodel != null) {
      data['data'] = this.favmodel!.map((v) => v.toJson()).toList();
    }
    data['first_page_url'] = this.firstPageUrl;
    data['from'] = this.from;
    data['last_page'] = this.lastPage;
    data['last_page_url'] = this.lastPageUrl;
    data['next_page_url'] = this.nextPageUrl;
    data['path'] = this.path;
    data['per_page'] = this.perPage;
    data['prev_page_url'] = this.prevPageUrl;
    data['to'] = this.to;
    data['total'] = this.total;
    return data;
  }
}

class Favmodel {
  int? id;
  String? name;
  String? description;
  String? address;
  String? deliveryType;
  String? minimumOrderPrice;
  String? logo;
  String? banner;
  String? restaurantDeliveryCharges;
  String? restaurantDeliveryRange;
  String? derapidosDeliveryCharges;
  String? derapidosDeliveryRange;
  String? totalReviews;
  int? averageRating;
  String? openStatus;
  int? discount;
  int? favourite;

  Favmodel(
      {this.id,
        this.name,
        this.description,
        this.address,
        this.deliveryType,
        this.minimumOrderPrice,
        this.logo,
        this.banner,
        this.restaurantDeliveryCharges,
        this.restaurantDeliveryRange,
        this.derapidosDeliveryCharges,
        this.derapidosDeliveryRange,
        this.totalReviews,
        this.averageRating,
        this.openStatus,
        this.discount,
        this.favourite});

  Favmodel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    address = json['address'];
    deliveryType = json['delivery_type'];
    minimumOrderPrice = json['minimum_order_price'];
    logo = json['logo'];
    banner = json['banner'];
    restaurantDeliveryCharges = json['restaurant_delivery_charges'];
    restaurantDeliveryRange = json['restaurant_delivery_range'];
    derapidosDeliveryCharges = json['derapidos_delivery_charges'];
    derapidosDeliveryRange = json['derapidos_delivery_range'];
    totalReviews = json['total_reviews'];
    averageRating = json['average_rating'];
    openStatus = json['open_status'];
    discount = json['discount'];
    favourite = json['favourite'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['address'] = this.address;
    data['delivery_type'] = this.deliveryType;
    data['minimum_order_price'] = this.minimumOrderPrice;
    data['logo'] = this.logo;
    data['banner'] = this.banner;
    data['restaurant_delivery_charges'] = this.restaurantDeliveryCharges;
    data['restaurant_delivery_range'] = this.restaurantDeliveryRange;
    data['derapidos_delivery_charges'] = this.derapidosDeliveryCharges;
    data['derapidos_delivery_range'] = this.derapidosDeliveryRange;
    data['total_reviews'] = this.totalReviews;
    data['average_rating'] = this.averageRating;
    data['open_status'] = this.openStatus;
    data['discount'] = this.discount;
    data['favourite'] = this.favourite;
    return data;
  }
}