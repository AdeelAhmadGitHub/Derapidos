class Banners {
  bool? success;
  String? message;
  List<String>? banners;

  Banners({this.success, this.message, this.banners});

  Banners.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    banners = json['data'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    data['data'] = this.banners;
    return data;
  }
}
