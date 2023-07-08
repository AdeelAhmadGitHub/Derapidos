class UserProfile {
  bool? success;
  String? message;
  UserData? userData;

  UserProfile({this.success, this.message, this.userData});

  UserProfile.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    userData = json['data'] != null ? UserData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (userData != null) {
      data['data'] = userData!.toJson();
    }
    return data;
  }
}

class UserData {
  int? id;
  String? name;
  String? email;
  String? apiToken;
  String? deviceToken;
  String? phone;
  String? profilePic;
  String? createdAt;
  String? updatedAt;

  UserData({
    this.id,
    this.name,
    this.email,
    this.apiToken,
    this.deviceToken,
    this.phone,
    this.profilePic,
    this.createdAt,
    this.updatedAt,
  });

  UserData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    apiToken = json['api_token'];
    deviceToken = json['device_token'];
    phone = json['phone'];
    profilePic = json['profile_pic'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['api_token'] = this.apiToken;
    data['device_token'] = this.deviceToken;
    data['phone'] = this.phone;
    data['profile_pic'] = this.profilePic;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

// class UserData {
//   int? id;
//   String? name;
//   String? email;
//   String? deviceToken;
//   String? apiToken;
//   String? profilePic;
//   String? createdAt;

//   UserData({
//     this.id,
//     this.name,
//     this.email,
//     this.deviceToken,
//     this.apiToken,
//     this.profilePic,
//     this.createdAt,
//   });

//   UserData.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     email = json['email'];
//     deviceToken = json['device_token'];
//     apiToken = json['api_token'];
//     profilePic = json['profile_pic'];
//     createdAt = json['created_at'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['name'] = name;
//     data['email'] = email;
//     data['device_token'] = deviceToken;
//     data['api_token'] = apiToken;
//     data['profile_pic'] = profilePic;
//     data['created_at'] = createdAt;
//     return data;
//   }
// }

// class Data {
//   int? id;
//   String? name;
//   String? email;
//   String? apiToken;
//   String? deviceToken;
//   String? phone;
//   String? profilePic;
//   String? createdAt;
//   String? updatedAt;

//   Data(
//       {this.id,
//       this.name,
//       this.email,
//       this.apiToken,
//       this.deviceToken,
//       this.phone,
//       this.profilePic,
//       this.createdAt,
//       this.updatedAt});

//   Data.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     email = json['email'];
//     apiToken = json['api_token'];
//     deviceToken = json['device_token'];
//     phone = json['phone'];
//     profilePic = json['profile_pic'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     data['email'] = this.email;
//     data['api_token'] = this.apiToken;
//     data['device_token'] = this.deviceToken;
//     data['phone'] = this.phone;
//     data['profile_pic'] = this.profilePic;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     return data;
//   }
// }
