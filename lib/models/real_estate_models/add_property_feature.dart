class AddPropertieFeature {
  bool? status;
  List<RealEstateFeatures>? realEstateFeatures;

  AddPropertieFeature({this.status, this.realEstateFeatures});

  AddPropertieFeature.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['real_estate_features'] != null) {
      realEstateFeatures = <RealEstateFeatures>[];
      json['real_estate_features'].forEach((v) {
        realEstateFeatures!.add(new RealEstateFeatures.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.realEstateFeatures != null) {
      data['real_estate_features'] =
          this.realEstateFeatures!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class RealEstateFeatures {
  int? id;
  String? name;

  RealEstateFeatures({this.id, this.name});

  RealEstateFeatures.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}