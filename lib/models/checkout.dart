class Checkout {
  bool? success;
  String? message;
  Data? data;

  Checkout({this.success, this.message, this.data});

  Checkout.fromJson(Map<String, dynamic> json) {
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
  int? orderId;
  String? orderNo;
  String? trackingNo;

  Data({this.orderId, this.orderNo, this.trackingNo});

  Data.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    orderNo = json['order_no'];
    trackingNo = json['tracking_no'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['order_id'] = orderId;
    data['order_no'] = orderNo;
    data['tracking_no'] = trackingNo;
    return data;
  }
}
