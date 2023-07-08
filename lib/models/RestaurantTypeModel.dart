/// status : true
/// message : {"current_page":1,"data":[{"id":"33","name":"Savour food","description":"asdfjkhgfd.lsjkjhflkfjkgdfkhkljlljhjsjksjhks","address":"G8FC+233, Tariq St, Rehmanpura Colony, Lahore, Punjab 54000, Pakistan","logo":"https://derapidos.citizensadgrace.com/public/storage/markets/market-20230302-09074434431396.jpg","banner":"https://derapidos.citizensadgrace.com/public/storage/markets/market-20230302-09074434431396.jpg","delivery_type":"Restaurant Delivery","restaurant_delivery_charges":"30.00","open_status":"Open","derapidos_delivery_charges":"","distance":"141.438 km","Time":"2 godz. 23 min","total_reviews":"0","average_rating":0},{"id":"34","name":"Savour","description":"lidl;jflsjflsldjflls","address":"G8FC+233, Tariq St, Rehmanpura Colony, Lahore, Punjab 54000, Pakistan","logo":"https://derapidos.citizensadgrace.com/public/storage/markets/market-20230302-09101642173342.jpg","banner":"https://derapidos.citizensadgrace.com/public/storage/markets/market-20230302-09101642173342.jpg","delivery_type":"Both","restaurant_delivery_charges":"30.00","open_status":"Open","derapidos_delivery_charges":"15","distance":"141.438 km","Time":"2 godz. 23 min","total_reviews":"0","average_rating":0}],"first_page_url":"https://derapidos.citizensadgrace.com/public/api/getSpecialsBreakfast?page=1","from":1,"last_page":1,"last_page_url":"https://derapidos.citizensadgrace.com/public/api/getSpecialsBreakfast?page=1","next_page_url":null,"path":"https://derapidos.citizensadgrace.com/public/api/getSpecialsBreakfast","per_page":15,"prev_page_url":null,"to":2,"total":2}

class RestaurantTypeModel {
  RestaurantTypeModel({
      bool? status, 
      Message? message,}){
    _status = status;
    _message = message;
}

  RestaurantTypeModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'] != null ? Message.fromJson(json['message']) : null;
  }
  bool? _status;
  Message? _message;
RestaurantTypeModel copyWith({  bool? status,
  Message? message,
}) => RestaurantTypeModel(  status: status ?? _status,
  message: message ?? _message,
);
  bool? get status => _status;
  Message? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    if (_message != null) {
      map['message'] = _message?.toJson();
    }
    return map;
  }

}

/// current_page : 1
/// data : [{"id":"33","name":"Savour food","description":"asdfjkhgfd.lsjkjhflkfjkgdfkhkljlljhjsjksjhks","address":"G8FC+233, Tariq St, Rehmanpura Colony, Lahore, Punjab 54000, Pakistan","logo":"https://derapidos.citizensadgrace.com/public/storage/markets/market-20230302-09074434431396.jpg","banner":"https://derapidos.citizensadgrace.com/public/storage/markets/market-20230302-09074434431396.jpg","delivery_type":"Restaurant Delivery","restaurant_delivery_charges":"30.00","open_status":"Open","derapidos_delivery_charges":"","distance":"141.438 km","Time":"2 godz. 23 min","total_reviews":"0","average_rating":0},{"id":"34","name":"Savour","description":"lidl;jflsjflsldjflls","address":"G8FC+233, Tariq St, Rehmanpura Colony, Lahore, Punjab 54000, Pakistan","logo":"https://derapidos.citizensadgrace.com/public/storage/markets/market-20230302-09101642173342.jpg","banner":"https://derapidos.citizensadgrace.com/public/storage/markets/market-20230302-09101642173342.jpg","delivery_type":"Both","restaurant_delivery_charges":"30.00","open_status":"Open","derapidos_delivery_charges":"15","distance":"141.438 km","Time":"2 godz. 23 min","total_reviews":"0","average_rating":0}]
/// first_page_url : "https://derapidos.citizensadgrace.com/public/api/getSpecialsBreakfast?page=1"
/// from : 1
/// last_page : 1
/// last_page_url : "https://derapidos.citizensadgrace.com/public/api/getSpecialsBreakfast?page=1"
/// next_page_url : null
/// path : "https://derapidos.citizensadgrace.com/public/api/getSpecialsBreakfast"
/// per_page : 15
/// prev_page_url : null
/// to : 2
/// total : 2

class Message {
  Message({
      num? currentPage, 
      List<Data>? data, 
      String? firstPageUrl, 
      num? from, 
      num? lastPage, 
      String? lastPageUrl, 
      dynamic nextPageUrl, 
      String? path, 
      num? perPage, 
      dynamic prevPageUrl, 
      num? to, 
      num? total,}){
    _currentPage = currentPage;
    _data = data;
    _firstPageUrl = firstPageUrl;
    _from = from;
    _lastPage = lastPage;
    _lastPageUrl = lastPageUrl;
    _nextPageUrl = nextPageUrl;
    _path = path;
    _perPage = perPage;
    _prevPageUrl = prevPageUrl;
    _to = to;
    _total = total;
}

  Message.fromJson(dynamic json) {
    _currentPage = json['current_page'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
    _firstPageUrl = json['first_page_url'];
    _from = json['from'];
    _lastPage = json['last_page'];
    _lastPageUrl = json['last_page_url'];
    _nextPageUrl = json['next_page_url'];
    _path = json['path'];
    _perPage = json['per_page'];
    _prevPageUrl = json['prev_page_url'];
    _to = json['to'];
    _total = json['total'];
  }
  num? _currentPage;
  List<Data>? _data;
  String? _firstPageUrl;
  num? _from;
  num? _lastPage;
  String? _lastPageUrl;
  dynamic _nextPageUrl;
  String? _path;
  num? _perPage;
  dynamic _prevPageUrl;
  num? _to;
  num? _total;
Message copyWith({  num? currentPage,
  List<Data>? data,
  String? firstPageUrl,
  num? from,
  num? lastPage,
  String? lastPageUrl,
  dynamic nextPageUrl,
  String? path,
  num? perPage,
  dynamic prevPageUrl,
  num? to,
  num? total,
}) => Message(  currentPage: currentPage ?? _currentPage,
  data: data ?? _data,
  firstPageUrl: firstPageUrl ?? _firstPageUrl,
  from: from ?? _from,
  lastPage: lastPage ?? _lastPage,
  lastPageUrl: lastPageUrl ?? _lastPageUrl,
  nextPageUrl: nextPageUrl ?? _nextPageUrl,
  path: path ?? _path,
  perPage: perPage ?? _perPage,
  prevPageUrl: prevPageUrl ?? _prevPageUrl,
  to: to ?? _to,
  total: total ?? _total,
);
  num? get currentPage => _currentPage;
  List<Data>? get data => _data;
  String? get firstPageUrl => _firstPageUrl;
  num? get from => _from;
  num? get lastPage => _lastPage;
  String? get lastPageUrl => _lastPageUrl;
  dynamic get nextPageUrl => _nextPageUrl;
  String? get path => _path;
  num? get perPage => _perPage;
  dynamic get prevPageUrl => _prevPageUrl;
  num? get to => _to;
  num? get total => _total;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['current_page'] = _currentPage;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    map['first_page_url'] = _firstPageUrl;
    map['from'] = _from;
    map['last_page'] = _lastPage;
    map['last_page_url'] = _lastPageUrl;
    map['next_page_url'] = _nextPageUrl;
    map['path'] = _path;
    map['per_page'] = _perPage;
    map['prev_page_url'] = _prevPageUrl;
    map['to'] = _to;
    map['total'] = _total;
    return map;
  }

}

/// id : "33"
/// name : "Savour food"
/// description : "asdfjkhgfd.lsjkjhflkfjkgdfkhkljlljhjsjksjhks"
/// address : "G8FC+233, Tariq St, Rehmanpura Colony, Lahore, Punjab 54000, Pakistan"
/// logo : "https://derapidos.citizensadgrace.com/public/storage/markets/market-20230302-09074434431396.jpg"
/// banner : "https://derapidos.citizensadgrace.com/public/storage/markets/market-20230302-09074434431396.jpg"
/// delivery_type : "Restaurant Delivery"
/// restaurant_delivery_charges : "30.00"
/// open_status : "Open"
/// derapidos_delivery_charges : ""
/// distance : "141.438 km"
/// Time : "2 godz. 23 min"
/// total_reviews : "0"
/// average_rating : 0

class Data {
  Data({
      String? id, 
      String? name, 
      String? description, 
      String? address, 
      String? logo, 
      String? banner, 
      String? deliveryType, 
      String? restaurantDeliveryCharges, 
      String? openStatus, 
      String? derapidosDeliveryCharges, 
      String? distance, 
      String? time, 
      String? totalReviews, 
      num? averageRating,}){
    _id = id;
    _name = name;
    _description = description;
    _address = address;
    _logo = logo;
    _banner = banner;
    _deliveryType = deliveryType;
    _restaurantDeliveryCharges = restaurantDeliveryCharges;
    _openStatus = openStatus;
    _derapidosDeliveryCharges = derapidosDeliveryCharges;
    _distance = distance;
    _time = time;
    _totalReviews = totalReviews;
    _averageRating = averageRating;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _description = json['description'];
    _address = json['address'];
    _logo = json['logo'];
    _banner = json['banner'];
    _deliveryType = json['delivery_type'];
    _restaurantDeliveryCharges = json['restaurant_delivery_charges'];
    _openStatus = json['open_status'];
    _derapidosDeliveryCharges = json['derapidos_delivery_charges'];
    _distance = json['distance'];
    _time = json['Time'];
    _totalReviews = json['total_reviews'];
    _averageRating = json['average_rating'];
  }
  String? _id;
  String? _name;
  String? _description;
  String? _address;
  String? _logo;
  String? _banner;
  String? _deliveryType;
  String? _restaurantDeliveryCharges;
  String? _openStatus;
  String? _derapidosDeliveryCharges;
  String? _distance;
  String? _time;
  String? _totalReviews;
  num? _averageRating;
Data copyWith({  String? id,
  String? name,
  String? description,
  String? address,
  String? logo,
  String? banner,
  String? deliveryType,
  String? restaurantDeliveryCharges,
  String? openStatus,
  String? derapidosDeliveryCharges,
  String? distance,
  String? time,
  String? totalReviews,
  num? averageRating,
}) => Data(  id: id ?? _id,
  name: name ?? _name,
  description: description ?? _description,
  address: address ?? _address,
  logo: logo ?? _logo,
  banner: banner ?? _banner,
  deliveryType: deliveryType ?? _deliveryType,
  restaurantDeliveryCharges: restaurantDeliveryCharges ?? _restaurantDeliveryCharges,
  openStatus: openStatus ?? _openStatus,
  derapidosDeliveryCharges: derapidosDeliveryCharges ?? _derapidosDeliveryCharges,
  distance: distance ?? _distance,
  time: time ?? _time,
  totalReviews: totalReviews ?? _totalReviews,
  averageRating: averageRating ?? _averageRating,
);
  String? get id => _id;
  String? get name => _name;
  String? get description => _description;
  String? get address => _address;
  String? get logo => _logo;
  String? get banner => _banner;
  String? get deliveryType => _deliveryType;
  String? get restaurantDeliveryCharges => _restaurantDeliveryCharges;
  String? get openStatus => _openStatus;
  String? get derapidosDeliveryCharges => _derapidosDeliveryCharges;
  String? get distance => _distance;
  String? get time => _time;
  String? get totalReviews => _totalReviews;
  num? get averageRating => _averageRating;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['description'] = _description;
    map['address'] = _address;
    map['logo'] = _logo;
    map['banner'] = _banner;
    map['delivery_type'] = _deliveryType;
    map['restaurant_delivery_charges'] = _restaurantDeliveryCharges;
    map['open_status'] = _openStatus;
    map['derapidos_delivery_charges'] = _derapidosDeliveryCharges;
    map['distance'] = _distance;
    map['Time'] = _time;
    map['total_reviews'] = _totalReviews;
    map['average_rating'] = _averageRating;
    return map;
  }

}