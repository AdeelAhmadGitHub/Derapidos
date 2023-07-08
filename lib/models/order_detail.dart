class OrderDetail {
  bool? success;
  String? message;
  OrderData? orderData;

  OrderDetail({this.success, this.message, this.orderData});

  OrderDetail.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    orderData = json['data'] != null ? OrderData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (orderData != null) {
      data['data'] = orderData!.toJson();
    }
    return data;
  }
}

class OrderData {
  String? id;
  String? orderNo;
  String? trackingNo;
  String? userId;
  String? status;
  String? itemTotal;
  String? discount;
  String? tax;
  String? deliveryFee;
  String? orderTotal;
  String? deliveryDate;
  String? marketName;
  String? marketDescription;
  String? marketImage;
  String? marketBannerImage;
  List<ShippingAddress>? shippingAddress;
  String? paymentMethod;
  String? paymentCardNumberLastfourdigits;
  String? paymentStatus;
  String? promoCode;
  String? marketId;
  String? marketAddress;
  String? driverId;
  String? driverName;
  String? driverProfilePic;

  List<Items>? items;

  OrderData({
    this.id,
    this.orderNo,
    this.trackingNo,
    this.userId,
    this.status,
    this.itemTotal,
    this.discount,
    this.tax,
    this.deliveryFee,
    this.orderTotal,
    this.deliveryDate,
    this.marketName,
    this.marketDescription,
    this.marketImage,
    this.marketBannerImage,
    this.shippingAddress,
    this.paymentMethod,
    this.paymentCardNumberLastfourdigits,
    this.paymentStatus,
    this.promoCode,
    this.marketId,
    this.marketAddress,
    this.driverId,
    this.driverName,
    this.driverProfilePic,
    this.items,
  });

  OrderData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderNo = json['order_no'];
    trackingNo = json['tracking_no'];
    userId = json['user_id'];
    status = json['status'];
    itemTotal = json['item_total'];
    discount = json['discount'];
    tax = json['tax'];
    deliveryFee = json['delivery_fee'];
    orderTotal = json['order_total'];
    deliveryDate = json['delivery_date'];
    marketName = json['market_name'];
    marketDescription = json['market_description'];
    marketImage = json['market_image'];
    marketBannerImage = json['market_banner_image'];
    if (json['shipping_address'] != null) {
      shippingAddress = <ShippingAddress>[];
      json['shipping_address'].forEach((v) {
        shippingAddress!.add(ShippingAddress.fromJson(v));
      });
    }
    paymentMethod = json['payment_method'];
    paymentCardNumberLastfourdigits =
        json['payment_card_number_lastfourdigits'];
    paymentStatus = json['payment_status'];
    promoCode = json['promo_code'];
    marketId = json['market_id'];
    marketAddress = json['market_address'];
    driverId = json['driver_id'];
    driverName = json['driver_name'];
    driverProfilePic = json['driver_profile_pic'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['order_no'] = orderNo;
    data['tracking_no'] = trackingNo;
    data['user_id'] = userId;
    data['status'] = status;
    data['item_total'] = itemTotal;
    data['discount'] = discount;
    data['tax'] = tax;
    data['delivery_fee'] = deliveryFee;
    data['order_total'] = orderTotal;
    data['delivery_date'] = deliveryDate;
    data['market_name'] = marketName;
    data['market_description'] = marketDescription;
    data['market_image'] = marketImage;
    data['market_banner_image'] = marketBannerImage;
    if (shippingAddress != null) {
      data['shipping_address'] =
          shippingAddress!.map((v) => v.toJson()).toList();
    }
    data['payment_method'] = paymentMethod;
    data['payment_card_number_lastfourdigits'] =
        paymentCardNumberLastfourdigits;
    data['payment_status'] = paymentStatus;
    data['promo_code'] = promoCode;
    data['market_id'] = this.marketId;
    data['market_address'] = this.marketAddress;
    data['driver_id'] = this.driverId;
    data['driver_name'] = this.driverName;
    data['driver_profile_pic'] = this.driverProfilePic;
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ShippingAddress {
  String? fullName;
  String? mobile;
  String? address;
  String? city;
  String? state;
  String? zipcode;
  String? country;

  ShippingAddress({
    this.fullName,
    this.mobile,
    this.address,
    this.city,
    this.state,
    this.zipcode,
    this.country,
  });

  ShippingAddress.fromJson(Map<String, dynamic> json) {
    fullName = json['full_name'];
    mobile = json['mobile'];
    address = json['address'];
    city = json['city'];
    state = json['state'];
    zipcode = json['zipcode'];
    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['full_name'] = fullName;
    data['mobile'] = mobile;
    data['address'] = address;
    data['city'] = city;
    data['state'] = state;
    data['zipcode'] = zipcode;
    data['country'] = country;
    return data;
  }
}

class Items {
  String? productId;
  String? price;
  String? quantity;
  String? size;
  String? specialInstructions;
  String? productName;
  String? productDescription;
  String? productImage;
  dynamic? totalExtrasQuantity;

  Items({
    this.productId,
    this.price,
    this.quantity,
    this.size,
    this.specialInstructions,
    this.productName,
    this.productDescription,
    this.productImage,
    this.totalExtrasQuantity,
  });

  Items.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    price = json['price'];
    quantity = json['quantity'];
    size = json['size'];
    specialInstructions = json['special_instructions'];
    productName = json['product_name'];
    productDescription = json['product_description'];
    productImage = json['product_image'];
    totalExtrasQuantity = json['total_extras_quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product_id'] = productId;
    data['price'] = price;
    data['quantity'] = quantity;
    data['size'] = size;
    data['special_instructions'] = specialInstructions;
    data['product_name'] = productName;
    data['product_description'] = productDescription;
    data['product_image'] = productImage;
    data['total_extras_quantity'] = totalExtrasQuantity;
    return data;
  }
}
