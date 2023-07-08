class MakeCheckout {
  String? apiToken;
  String? userId;
  String? marketId;
  List<Items>? items;
  String? shippingAddressId;
  String? paymentMethodType;
  String? itemTotal;
  String? discount;
  String? taxes;
  String? deliveryCharges;
  String? orderTotal;
  String? promoCode;

  MakeCheckout({
    this.apiToken,
    this.userId,
    this.marketId,
    this.items,
    this.shippingAddressId,
    this.paymentMethodType,
    this.itemTotal,
    this.discount,
    this.taxes,
    this.deliveryCharges,
    this.orderTotal,
    this.promoCode,
  });

  MakeCheckout.fromJson(Map<String, dynamic> json) {
    apiToken = json['api_token'];
    userId = json['user_id'];
    marketId = json['market_id'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(Items.fromJson(v));
      });
    }
    shippingAddressId = json['shipping_address_id'];
    paymentMethodType = json['payment_method_type'];
    itemTotal = json['item_total'];
    discount = json['discount'];
    taxes = json['taxes'];
    deliveryCharges = json['delivery_charges'];
    orderTotal = json['order_total'];
    promoCode = json['promo_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['api_token'] = apiToken;
    data['user_id'] = userId;
    data['market_id'] = marketId;
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    data['shipping_address_id'] = shippingAddressId;
    data['payment_method_type'] = paymentMethodType;
    data['item_total'] = itemTotal;
    data['discount'] = discount;
    data['taxes'] = taxes;
    data['delivery_charges'] = deliveryCharges;
    data['order_total'] = orderTotal;
    data['promo_code'] = promoCode;
    return data;
  }
}

class Items {
  int? productId;
  int? productQuantity;
  double? productPrice;
  String? productSize;
  String? productSpecialInstructions;
  List<Extras>? extras;

  Items({
    this.productId,
    this.productQuantity,
    this.productPrice,
    this.productSize,
    this.productSpecialInstructions,
    this.extras,
  });

  Items.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    productQuantity = json['product_quantity'];
    productPrice = json['product_price'];
    productSize = json['product_size'];
    productSpecialInstructions = json['product_special_instructions'];
    if (json['extras'] != null) {
      extras = <Extras>[];
      json['extras'].forEach((v) {
        extras!.add(Extras.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product_id'] = productId;
    data['product_quantity'] = productQuantity;
    data['product_price'] = productPrice;
    data['product_size'] = productSize;
    data['product_special_instructions'] = productSpecialInstructions;
    if (extras != null) {
      data['extras'] = extras!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Extras {
  int? extrasId;
  int? extrasPrice;
  int? extrasQuantity;

  Extras({this.extrasId, this.extrasPrice, this.extrasQuantity});

  Extras.fromJson(Map<String, dynamic> json) {
    extrasId = json['extras_id'];
    extrasPrice = json['extras_price'];
    extrasQuantity = json['extras_quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['extras_id'] = extrasId;
    data['extras_price'] = extrasPrice;
    data['extras_quantity'] = extrasQuantity;
    return data;
  }
}
