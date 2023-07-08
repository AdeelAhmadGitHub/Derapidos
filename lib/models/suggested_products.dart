class SuggestedProducts {
  bool? success;
  String? message;
  List<Product>? products;

  SuggestedProducts({this.success, this.message, this.products});

  SuggestedProducts.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      products = <Product>[];
      json['data'].forEach((v) {
        products!.add(Product.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (products != null) {
      data['data'] = products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Product {
  String? id;
  String? name;
  String? price;
  String? discountPrice;
  String? description;
  var capacity;
  var packageItemsCount;
  var unit;
  String? featured;
  String? deliverable;
  String? marketId;
  String? marketName;
  String? categoryId;
  String? totalReviews;
  var averageRating;
  String? image;
  String? createdAt;

  Product({
    this.id,
    this.name,
    this.price,
    this.discountPrice,
    this.description,
    this.capacity,
    this.packageItemsCount,
    this.unit,
    this.featured,
    this.deliverable,
    this.marketId,
    this.marketName,
    this.categoryId,
    this.totalReviews,
    this.averageRating,
    this.image,
    this.createdAt,
  });

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    discountPrice = json['discount_price'];
    description = json['description'];
    capacity = json['capacity'];
    packageItemsCount = json['package_items_count'];
    unit = json['unit'];
    featured = json['featured'];
    deliverable = json['deliverable'];
    marketId = json['market_id'];
    marketName = json['market_name'];
    categoryId = json['category_id'];
    totalReviews = json['total_reviews'];
    averageRating = json['average_rating'];
    image = json['image'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['price'] = price;
    data['discount_price'] = discountPrice;
    data['description'] = description;
    data['capacity'] = capacity;
    data['package_items_count'] = packageItemsCount;
    data['unit'] = unit;
    data['featured'] = featured;
    data['deliverable'] = deliverable;
    data['market_id'] = marketId;
    data['market_name'] = marketName;
    data['category_id'] = categoryId;
    data['total_reviews'] = totalReviews;
    data['average_rating'] = averageRating;
    data['image'] = image;
    data['created_at'] = createdAt;
    return data;
  }
}
