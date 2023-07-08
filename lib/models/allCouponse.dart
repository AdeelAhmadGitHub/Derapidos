class AllCouponsModel {
  bool? status;
  List<CouponList>? couponList;

  AllCouponsModel({this.status, this.couponList});

  AllCouponsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['couponList'] != null) {
      couponList = <CouponList>[];
      json['couponList'].forEach((v) {
        couponList!.add(new CouponList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.couponList != null) {
      data['couponList'] = this.couponList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CouponList {
  int? id;
  String? code;
  int? discount;
  String? discountType;
  String? description;
  int? marketId;
  String? marketName;
  String? marketAddress;
  String? marketImage;
  String? expireAt;

  CouponList(
      {this.id,
        this.code,
        this.discount,
        this.discountType,
        this.description,
        this.marketId,
        this.marketName,
        this.marketAddress,
        this.marketImage,
        this.expireAt});

  CouponList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    discount = json['discount'];
    discountType = json['discount_type'];
    description = json['description'];
    marketId = json['market_id'];
    marketName = json['market_name'];
    marketAddress = json['market_address'];
    marketImage = json['market_image'];
    expireAt = json['expire_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['code'] = this.code;
    data['discount'] = this.discount;
    data['discount_type'] = this.discountType;
    data['description'] = this.description;
    data['market_id'] = this.marketId;
    data['market_name'] = this.marketName;
    data['market_address'] = this.marketAddress;
    data['market_image'] = this.marketImage;
    data['expire_at'] = this.expireAt;
    return data;
  }
}
