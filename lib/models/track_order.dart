class TrackOrder {
  bool? success;
  String? message;
  List<TrackData>? trackData;

  TrackOrder({this.success, this.message, this.trackData});

  TrackOrder.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      trackData = <TrackData>[];
      json['data'].forEach((v) {
        trackData!.add(TrackData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (this.trackData != null) {
      data['data'] = this.trackData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TrackData {
  String? status;
  String? time;
  String? driverId;
  String? driverName;
  String? driverPhone;
  String? deliveryTime;

  TrackData({
    this.status,
    this.time,
    this.driverId,
    this.driverName,
    this.driverPhone,
    this.deliveryTime,
  });

  TrackData.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    time = json['time'];
    driverId = json['driver_id'];
    driverName = json['driver_name'];
    driverPhone = json['driver_phone'];
    deliveryTime = json['delivery_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['time'] = time;
    data['driver_id'] = driverId;
    data['driver_name'] = driverName;
    data['driver_phone'] = driverPhone;
    data['delivery_time'] = deliveryTime;
    return data;
  }
}
