class CartItem {
  String? apiToken;
  String? productId;
  num? quantity;
  num? deliveryCharges;
  String? size;
  String? specialInstructions;
  List<Extra>? extras;

  CartItem({
    this.apiToken,
    this.productId,
    this.quantity,
    this.deliveryCharges,
    this.size,
    this.specialInstructions,
    this.extras,
  });

  CartItem.fromJson(Map<String, dynamic> json) {
    apiToken = json['api_token'];
    productId = json['product_id'];
    quantity = json['quantity'];
    deliveryCharges = json['delivery_charges'];
    size = json['size'];
    specialInstructions = json['special_instructions'];
    if (json['extras'] != null) {
      extras = <Extra>[];
      json['extras'].forEach((v) {
        extras!.add(Extra.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['api_token'] = apiToken;
    data['product_id'] = productId;
    data['quantity'] = quantity;
    data['delivery_charges'] = deliveryCharges;
    data['size'] = size;
    data['special_instructions'] = specialInstructions;
    if (extras != null) {
      data['extras'] = extras!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Extra {
  int? extrasId;
  int? extrasQuantity;

  Extra({this.extrasId, this.extrasQuantity});

  Extra.fromJson(Map<String, dynamic> json) {
    extrasId = json['extras_id'];
    extrasQuantity = json['extras_quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['extras_id'] = extrasId;
    data['extras_quantity'] = extrasQuantity;
    return data;
  }
}

/*
class CartItem {
  String? apiToken;
  String? userId;
  String? productId;
  String? quantity;
  List<Extras>? extras;

  CartItem(
      {this.apiToken, this.userId, this.productId, this.quantity, this.extras});

  CartItem.fromJson(Map<String, dynamic> json) {
    apiToken = json['api_token'];
    userId = json['user_id'];
    productId = json['product_id'];
    quantity = json['quantity'];
    if (json['extras'] != null) {
      extras = <Extras>[];
      json['extras'].forEach((v) {
        extras!.add(new Extras.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['api_token'] = this.apiToken;
    data['user_id'] = this.userId;
    data['product_id'] = this.productId;
    data['quantity'] = this.quantity;
    if (this.extras != null) {
      data['extras'] = this.extras!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Extras {
  int? extrasId;
  int? quantity;

  Extras({this.extrasId, this.quantity});

  Extras.fromJson(Map<String, dynamic> json) {
    extrasId = json['extras_id'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['extras_id'] = this.extrasId;
    data['quantity'] = this.quantity;
    return data;
  }
}

*/
