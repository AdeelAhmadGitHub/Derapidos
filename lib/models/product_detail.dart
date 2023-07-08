class ProductDetail {
  bool? success;
  String? message;
  Detail? detail;

  ProductDetail({this.success, this.message, this.detail});

  ProductDetail.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    detail = json['data'] != null ? Detail.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (detail != null) {
      data['data'] = detail!.toJson();
    }
    return data;
  }
}

class Detail {
  String? id;
  String? name;
  String? price;
  String? discountPrice;
  String? deliveryFee;
  var tax;
  String? description;
  String? unit;
  String? featured;
  String? deliverable;
  int? favorite;
  String? marketId;
  String? marketName;
  String? marketDistance;
  String? categoryId;
  String? totalReviews;
  var averageRating;
  String? image;
  String? createdAt;
  List<String>? productSize;
  List<ProductExtras>? productExtras;

  Detail({
    this.id,
    this.name,
    this.price,
    this.discountPrice,
    this.deliveryFee,
    this.tax,
    this.description,
    this.unit,
    this.featured,
    this.deliverable,
    this.favorite,
    this.marketId,
    this.marketName,
    this.marketDistance,
    this.categoryId,
    this.totalReviews,
    this.averageRating,
    this.image,
    this.createdAt,
    this.productSize,
    this.productExtras,
  });

  Detail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    discountPrice = json['discount_price'];
    deliveryFee = json['delivery_fee'];
    tax = json['tax'];
    description = json['description'];
    unit = json['unit'];
    featured = json['featured'];
    deliverable = json['deliverable'];
    favorite = json['favorite'];
    marketId = json['market_id'];
    marketName = json['market_name'];
    marketDistance = json['market_distance'];
    categoryId = json['category_id'];
    totalReviews = json['total_reviews'];
    averageRating = json['average_rating'];
    image = json['image'];
    createdAt = json['created_at'];
    productSize = json['product_size'].cast<String>();
    if (json['product_extras'] != null) {
      productExtras = <ProductExtras>[];
      json['product_extras'].forEach((v) {
        productExtras!.add(ProductExtras.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['price'] = price;
    data['discount_price'] = discountPrice;
    data['delivery_fee'] = deliveryFee;
    data['tax'] = tax;
    data['description'] = description;
    data['unit'] = unit;
    data['featured'] = featured;
    data['deliverable'] = deliverable;
    data['favorite'] = favorite;
    data['market_id'] = marketId;
    data['market_name'] = marketName;
    data['market_distance'] = marketDistance;
    data['category_id'] = categoryId;
    data['total_reviews'] = totalReviews;
    data['average_rating'] = averageRating;
    data['image'] = image;
    data['created_at'] = createdAt;
    data['product_size'] = productSize;
    if (productExtras != null) {
      data['product_extras'] = productExtras!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductExtras {
  String? extraId;
  String? name;
  String? description;
  String? price;
  String? sizeName;

  ProductExtras({
    this.extraId,
    this.name,
    this.description,
    this.price,
    this.sizeName,
  });

  ProductExtras.fromJson(Map<String, dynamic> json) {
    extraId = json['extra_id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    sizeName = json['size_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['extra_id'] = extraId;
    data['name'] = name;
    data['description'] = description;
    data['price'] = price;
    data['size_name'] = sizeName;
    return data;
  }
}
