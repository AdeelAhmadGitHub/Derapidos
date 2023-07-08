class ActiveOrderMarketDetailModel {
  bool? status;
  List<ActiveOrderMarketDetail>? activeOrderMarketDetail;

  ActiveOrderMarketDetailModel({this.status, this.activeOrderMarketDetail});

  ActiveOrderMarketDetailModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['activeOrderMarketDetail'] != null) {
      activeOrderMarketDetail = <ActiveOrderMarketDetail>[];
      json['activeOrderMarketDetail'].forEach((v) {
        activeOrderMarketDetail!.add(new ActiveOrderMarketDetail.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.activeOrderMarketDetail != null) {
      data['activeOrderMarketDetail'] =
          this.activeOrderMarketDetail!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ActiveOrderMarketDetail {
  int? id;
  String? name;
  String? deliveryType;

  ActiveOrderMarketDetail({this.id, this.name, this.deliveryType});

  ActiveOrderMarketDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    deliveryType = json['delivery_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['delivery_type'] = this.deliveryType;
    return data;
  }
}
