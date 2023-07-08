class Realestate_Main_Category {
  bool? status;
  List<RealEstateCategories>? realEstateCategories;

  Realestate_Main_Category({this.status, this.realEstateCategories});

  Realestate_Main_Category.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['real_estate_categories'] != null) {
      realEstateCategories = <RealEstateCategories>[];
      json['real_estate_categories'].forEach((v) {
        realEstateCategories!.add(new RealEstateCategories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.realEstateCategories != null) {
      data['real_estate_categories'] =
          this.realEstateCategories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class RealEstateCategories {
  int? id;
  String? name;
  String? icon;

  RealEstateCategories({this.id, this.name, this.icon});

  RealEstateCategories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['icon'] = this.icon;
    return data;
  }
}