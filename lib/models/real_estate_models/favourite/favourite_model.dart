class RSFavouriteModel {
  int? currentPage;
  List<Data>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  Null? nextPageUrl;
  String? path;
  int? perPage;
  Null? prevPageUrl;
  int? to;
  int? total;

  RSFavouriteModel(
      {this.currentPage,
        this.data,
        this.firstPageUrl,
        this.from,
        this.lastPage,
        this.lastPageUrl,
        this.nextPageUrl,
        this.path,
        this.perPage,
        this.prevPageUrl,
        this.to,
        this.total});

  RSFavouriteModel.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_page'] = this.currentPage;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['first_page_url'] = this.firstPageUrl;
    data['from'] = this.from;
    data['last_page'] = this.lastPage;
    data['last_page_url'] = this.lastPageUrl;
    data['next_page_url'] = this.nextPageUrl;
    data['path'] = this.path;
    data['per_page'] = this.perPage;
    data['prev_page_url'] = this.prevPageUrl;
    data['to'] = this.to;
    data['total'] = this.total;
    return data;
  }
}

class Data {
  int? id;
  String? title;
  List<String>? images;
  String? type;
  int? price;
  String? bathrooms;
  String? bedrooms;
  List<String>? features;
  String? area;
  String? address;
  String? description;
  String? createdAt;
  int? userId;
  String? name;
  String? email;
  String? phone;
  int? awardAmount;
  String? profilePic;
  int? favorite;

  Data(
      {this.id,
        this.title,
        this.images,
        this.type,
        this.price,
        this.bathrooms,
        this.bedrooms,
        this.features,
        this.area,
        this.address,
        this.description,
        this.createdAt,
        this.userId,
        this.name,
        this.email,
        this.phone,
        this.awardAmount,
        this.profilePic,
        this.favorite});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    images = json['images'].cast<String>();
    type = json['type'];
    price = json['price'];
    bathrooms = json['bathrooms'];
    bedrooms = json['bedrooms'];
    features = json['features'].cast<String>();
    area = json['area'];
    address = json['address'];
    description = json['description'];
    createdAt = json['created_at'];
    userId = json['user_id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    awardAmount = json['award_amount'];
    profilePic = json['profile_pic'];
    favorite = json['favorite'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['images'] = this.images;
    data['type'] = this.type;
    data['price'] = this.price;
    data['bathrooms'] = this.bathrooms;
    data['bedrooms'] = this.bedrooms;
    data['features'] = this.features;
    data['area'] = this.area;
    data['address'] = this.address;
    data['description'] = this.description;
    data['created_at'] = this.createdAt;
    data['user_id'] = this.userId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['award_amount'] = this.awardAmount;
    data['profile_pic'] = this.profilePic;
    data['favorite'] = this.favorite;
    return data;
  }
}