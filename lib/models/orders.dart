class Orders {
  bool? success;
  String? message;
  Data? data;

  Orders({this.success, this.message, this.data});

  Orders.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? currentPage;
  List<Order>? orderList;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  String? nextPageUrl;
  String? path;
  int? perPage;
  String? prevPageUrl;
  int? to;
  int? total;

  Data({
    this.currentPage,
    this.orderList,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  Data.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      orderList = <Order>[];
      json['data'].forEach((v) {
        orderList!.add(Order.fromJson(v));
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['current_page'] = currentPage;
    if (orderList != null) {
      data['data'] = orderList!.map((v) => v.toJson()).toList();
    }
    data['first_page_url'] = firstPageUrl;
    data['from'] = from;
    data['last_page'] = lastPage;
    data['last_page_url'] = lastPageUrl;
    data['next_page_url'] = nextPageUrl;
    data['path'] = path;
    data['per_page'] = perPage;
    data['prev_page_url'] = prevPageUrl;
    data['to'] = to;
    data['total'] = total;
    return data;
  }
}

class Order {
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
  String? marketAddress;
  dynamic? deliveryTime;
  int? quantity;

  Order({
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
    this.marketAddress,
    this.deliveryTime,
    this.quantity,
  });

  Order.fromJson(Map<String, dynamic> json) {
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
    marketAddress = json['market_address'];
    deliveryTime = json['delivery_time'];
    quantity = json['quantity'];
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
    data['market_address'] = this.marketAddress;
    data['delivery_time'] = this.deliveryTime;
    data['quantity'] = quantity;
    return data;
  }
}
