/// success : true
/// message : "Categories retrieved successfully"
/// data : [{"id":7,"name":"Pizza","description":"reshdgd","image":"https://derapidos.citizensadgrace.com/public/storage/categories/category-20230130-09154314100883.jpg"},{"id":10,"name":"Burger","description":"Burger","image":"https://derapidos.citizensadgrace.com/public/storage/categories/category-20230130-09171582285142.jpg"},{"id":14,"name":"Cheese","description":"Cheese","image":"https://derapidos.citizensadgrace.com/public/storage/categories/category-20230130-09163358046339.jpg"}]

class GetCategoryModel {
  GetCategoryModel({
      bool? success, 
      String? message, 
      List<Data>? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  GetCategoryModel.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }
  bool? _success;
  String? _message;
  List<Data>? _data;
GetCategoryModel copyWith({  bool? success,
  String? message,
  List<Data>? data,
}) => GetCategoryModel(  success: success ?? _success,
  message: message ?? _message,
  data: data ?? _data,
);
  bool? get success => _success;
  String? get message => _message;
  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 7
/// name : "Pizza"
/// description : "reshdgd"
/// image : "https://derapidos.citizensadgrace.com/public/storage/categories/category-20230130-09154314100883.jpg"

class Data {
  Data({
      num? id, 
      String? name, 
      String? description, 
      String? image,}){
    _id = id;
    _name = name;
    _description = description;
    _image = image;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _description = json['description'];
    _image = json['image'];
  }
  num? _id;
  String? _name;
  String? _description;
  String? _image;
Data copyWith({  num? id,
  String? name,
  String? description,
  String? image,
}) => Data(  id: id ?? _id,
  name: name ?? _name,
  description: description ?? _description,
  image: image ?? _image,
);
  num? get id => _id;
  String? get name => _name;
  String? get description => _description;
  String? get image => _image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['description'] = _description;
    map['image'] = _image;
    return map;
  }

}