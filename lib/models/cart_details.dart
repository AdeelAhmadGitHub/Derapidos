class CartDetails {
  bool? success;
  String? message;
  List<Details>? details;

  CartDetails({this.success, this.message, this.details});

  CartDetails.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      details = <Details>[];
      json['data'].forEach((v) {
        details!.add(Details.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (details != null) {
      data['data'] = details!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Details {
  String? cartId;
  String? userId;
  String? productId;
  String? marketId;
  String? marketTaxPercentage;
  String? quantity;
  String? deliveryCharges;
  String? specialInstructions;
  String? productName;
  String? productPrice;
  String? productDiscountPrice;
  String? productDescription;
  String? productImage;
  String? size;
  List<ProductExtras>? productExtras;

  Details({
    this.cartId,
    this.userId,
    this.productId,
    this.marketId,
    this.marketTaxPercentage,
    this.quantity,
    this.deliveryCharges,
    this.specialInstructions,
    this.productName,
    this.productPrice,
    this.productDiscountPrice,
    this.productDescription,
    this.productImage,
    this.size,
    this.productExtras,
  });

  Details.fromJson(Map<String, dynamic> json) {
    cartId = json['cart_id'];
    userId = json['user_id'];
    productId = json['product_id'];
    marketId = json['market_id'];
    marketTaxPercentage = json['market_tax_percentage'];
    quantity = json['quantity'];
    deliveryCharges = json['delivery_charges'];
    specialInstructions = json['special_instructions'];
    productName = json['product_name'];
    productPrice = json['product_price'];
    productDiscountPrice = json['product_discount_price'];
    productDescription = json['product_description'];
    productImage = json['product_image'];
    size = json['size'];
    if (json['product_extras'] != null) {
      productExtras = <ProductExtras>[];
      json['product_extras'].forEach((v) {
        productExtras!.add(ProductExtras.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cart_id'] = cartId;
    data['user_id'] = userId;
    data['product_id'] = productId;
    data['market_id'] = marketId;
    data['market_tax_percentage'] = marketTaxPercentage;
    data['quantity'] = quantity;
    data['delivery_charges'] = deliveryCharges;
    data['special_instructions'] = specialInstructions;
    data['product_name'] = productName;
    data['product_price'] = productPrice;
    data['product_discount_price'] = productDiscountPrice;
    data['product_description'] = productDescription;
    data['product_image'] = productImage;
    data['size'] = size;
    if (productExtras != null) {
      data['product_extras'] = productExtras!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductExtras {
  int? id;
  String? name;
  String? price;
  String? quantity;

  ProductExtras({this.id, this.name, this.price, this.quantity});

  ProductExtras.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['price'] = price;
    data['quantity'] = quantity;
    return data;
  }
}

// class Details {
//   String? cartId;
//   String? userId;
//   String? productId;
//   String? quantity;
//   String? specialInstructions;
//   String? productName;
//   String? productPrice;
//   String? productDiscountPrice;
//   String? productDescription;
//   String? productImage;

//   Details({
//     this.cartId,
//     this.userId,
//     this.productId,
//     this.quantity,
//     this.specialInstructions,
//     this.productName,
//     this.productPrice,
//     this.productDiscountPrice,
//     this.productDescription,
//     this.productImage,
//   });

//   Details.fromJson(Map<String, dynamic> json) {
//     cartId = json['cart_id'];
//     userId = json['user_id'];
//     productId = json['product_id'];
//     quantity = json['quantity'];
//     specialInstructions = json['special_instructions'];
//     productName = json['product_name'];
//     productPrice = json['product_price'];
//     productDiscountPrice = json['product_discount_price'];
//     productDescription = json['product_description'];
//     productImage = json['product_image'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['cart_id'] = cartId;
//     data['user_id'] = userId;
//     data['product_id'] = productId;
//     data['quantity'] = quantity;
//     data['special_instructions'] = specialInstructions;
//     data['product_name'] = productName;
//     data['product_price'] = productPrice;
//     data['product_discount_price'] = productDiscountPrice;
//     data['product_description'] = productDescription;
//     data['product_image'] = productImage;
//     return data;
//   }
// }
