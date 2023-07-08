class Coupons {
  bool? success;
  String? message;
  List<Coupon>? couponsList;

  Coupons({this.success, this.message, this.couponsList});

  Coupons.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      couponsList = <Coupon>[];
      json['data'].forEach((v) {
        couponsList!.add(Coupon.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (couponsList != null) {
      data['data'] = couponsList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Coupon {
  int? id;
  String? code;
  int? discount;
  String? discountType;
  String? description;
  String? expiresAt;
  bool? enabled;
  String? createdAt;
  String? updatedAt;

  Coupon({
    this.id,
    this.code,
    this.discount,
    this.discountType,
    this.description,
    this.expiresAt,
    this.enabled,
    this.createdAt,
    this.updatedAt,
  });

  Coupon.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    discount = json['discount'];
    discountType = json['discount_type'];
    description = json['description'];
    expiresAt = json['expires_at'];
    enabled = json['enabled'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['code'] = code;
    data['discount'] = discount;
    data['discount_type'] = discountType;
    data['description'] = description;
    data['expires_at'] = expiresAt;
    data['enabled'] = enabled;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
