class MyAdsModel {
  bool? status;
  ActiveListing? activeListing;
  PreviousListing? previousListing;
  int? total;
  int? totalActive;
  int? totalPrevious;
  List<UserDetail>? userDetail;

  MyAdsModel(
      {this.status,
      this.activeListing,
      this.previousListing,
      this.total,
      this.totalActive,
      this.totalPrevious,
      this.userDetail});

  MyAdsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    activeListing = json['activeListing'] != null ? new ActiveListing.fromJson(json['activeListing']) : null;
    previousListing =
        json['previousListing'] != null ? new PreviousListing.fromJson(json['previousListing']) : null;
    total = json['total'];
    totalActive = json['totalActive'];
    totalPrevious = json['totalPrevious'];
    if (json['userDetail'] != null) {
      userDetail = <UserDetail>[];
      json['userDetail'].forEach((v) {
        userDetail!.add(new UserDetail.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.activeListing != null) {
      data['activeListing'] = this.activeListing!.toJson();
    }
    if (this.previousListing != null) {
      data['previousListing'] = this.previousListing!.toJson();
    }
    data['total'] = this.total;
    data['totalActive'] = this.totalActive;
    data['totalPrevious'] = this.totalPrevious;
    if (this.userDetail != null) {
      data['userDetail'] = this.userDetail!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ActiveListing {
  int? currentPage;
  List<ActiveData>? data;
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

  ActiveListing(
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

  ActiveListing.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <ActiveData>[];
      json['data'].forEach((v) {
        data!.add(new ActiveData.fromJson(v));
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

class ActiveData {
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

  ActiveData(
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

  ActiveData.fromJson(Map<String, dynamic> json) {
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

class UserDetail {
  int? id;
  String? name;
  String? email;
  String? phone;
  int? awardAmount;
  String? profilePic;

  UserDetail({this.id, this.name, this.email, this.phone, this.awardAmount, this.profilePic});

  UserDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    awardAmount = json['award_amount'];
    profilePic = json['profile_pic'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['award_amount'] = this.awardAmount;
    data['profile_pic'] = this.profilePic;
    return data;
  }
}

class PreviousListing {
  int? currentPage;
  List<Previousdata>? previousdata;
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

  PreviousListing(
      {this.currentPage,
      this.previousdata,
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

  PreviousListing.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['previousdata'] != null) {
      previousdata = <Previousdata>[];
      json['previousdata'].forEach((v) {
        previousdata!.add(new Previousdata.fromJson(v));
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
    if (this.previousdata != null) {
      data['previousdata'] = this.previousdata!.map((v) => v.toJson()).toList();
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

class Previousdata {
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

  Previousdata(
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

  Previousdata.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'] ?? "";
    images = json['images'].cast<String>();
    type = json['type'] ?? "";
    price = json['price'];
    bathrooms = json['bathrooms'] ?? "";
    bedrooms = json['bedrooms'] ?? "";
    features = json['features'].cast<String>();
    area = json['area'] ?? "";
    address = json['address'] ?? "";
    description = json['description'] ?? "";
    createdAt = json['created_at'] ?? "";
    userId = json['user_id'];
    name = json['name'] ?? "";
    email = json['email'] ?? "";
    phone = json['phone'] ?? "";
    awardAmount = json['award_amount'];
    profilePic = json['profile_pic'] ?? "";
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
