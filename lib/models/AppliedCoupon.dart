class AppliedCoupon {
  bool? success;
  String? message;
  Data? data;

  AppliedCoupon({this.success, this.message, this.data});

  AppliedCoupon.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data?.toJson();
    }
    return data;
  }
}

class Data {
  int? discount;
  dynamic? totalAfterDiscount;

  Data({this.discount, this.totalAfterDiscount});

  Data.fromJson(Map<String, dynamic> json) {
    discount = json['discount'];
    totalAfterDiscount = json['total_after_discount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['discount'] = this.discount;
    data['total_after_discount'] = this.totalAfterDiscount;
    return data;
  }
}
