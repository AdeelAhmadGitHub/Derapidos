class BannersModel {
  bool? status;
  List<BannerList>? bannerList;

  BannersModel({this.status, this.bannerList});

  BannersModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['bannerList'] != null) {
      bannerList = <BannerList>[];
      json['bannerList'].forEach((v) {
        bannerList!.add(new BannerList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.bannerList != null) {
      data['bannerList'] = this.bannerList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BannerList {
  int? id;
  int? marketId;
  String? bannerImage;

  BannerList({this.id, this.marketId, this.bannerImage});

  BannerList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    marketId = json['market_id'];
    bannerImage = json['banner_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['market_id'] = this.marketId;
    data['banner_image'] = this.bannerImage;
    return data;
  }
}
