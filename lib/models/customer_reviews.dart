class CustomerReviews {
  bool? success;
  String? message;
  Data? data;

  CustomerReviews({this.success, this.message, this.data});

  CustomerReviews.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? currentPage;
  List<Review>? reviews;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  String? nextPageUrl;
  String? path;
  int? perPage;
  String? prevPageUrl;
  int? to;
  int? total;

  Data({
    this.currentPage,
    this.reviews,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  Data.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      reviews = <Review>[];
      json['data'].forEach((v) {
        reviews!.add(Review.fromJson(v));
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['current_page'] = currentPage;
    if (reviews != null) {
      data['data'] = reviews!.map((v) => v.toJson()).toList();
    }
    data['first_page_url'] = firstPageUrl;
    data['from'] = from;
    data['last_page'] = lastPage;
    data['last_page_url'] = lastPageUrl;
    data['next_page_url'] = nextPageUrl;
    data['path'] = path;
    data['per_page'] = perPage;
    data['prev_page_url'] = prevPageUrl;
    data['to'] = to;
    data['total'] = total;
    return data;
  }
}

class Review {
  String? orderId;
  String? userId;
  String? rating;
  String? review;
  List<String>? reviewPhotos;
  String? reviewDate;
  String? customerName;
  String? profilePic;

  Review({
    this.orderId,
    this.userId,
    this.rating,
    this.review,
    this.reviewPhotos,
    this.reviewDate,
    this.customerName,
    this.profilePic,
  });

  Review.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    userId = json['user_id'];
    rating = json['rating'];
    review = json['review'];
    reviewPhotos = json['review_photos'].cast<String>();
    reviewDate = json['review_date'];
    customerName = json['customer_name'];
    profilePic = json['profile_pic'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['order_id'] = orderId;
    data['user_id'] = userId;
    data['rating'] = rating;
    data['review'] = review;
    data['review_photos'] = reviewPhotos;
    data['review_date'] = reviewDate;
    data['customer_name'] = customerName;
    data['profile_pic'] = profilePic;
    return data;
  }
}
