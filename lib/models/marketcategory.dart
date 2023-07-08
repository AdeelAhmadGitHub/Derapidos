class MarketCategories {
  bool? success;
  String? message;
  List<MarketCategoriesData>? data;

  MarketCategories({this.success, this.message, this.data});

  MarketCategories.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <MarketCategoriesData>[];
      json['data'].forEach((v) {
        data!.add(new MarketCategoriesData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MarketCategoriesData {
  int? id;
  String? name;
  String? description;
  String? image;

  MarketCategoriesData({this.id, this.name, this.description, this.image});

  MarketCategoriesData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['image'] = this.image;
    return data;
  }
}