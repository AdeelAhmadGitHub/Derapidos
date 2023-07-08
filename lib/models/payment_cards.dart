class PaymentCards {
  bool? success;
  String? message;
  List<Card>? cards;

  PaymentCards({this.success, this.message, this.cards});

  PaymentCards.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      cards = <Card>[];
      json['data'].forEach((v) {
        cards!.add(Card.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (cards != null) {
      data['data'] = cards!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Card {
  int? id;
  String? userId;
  String? cardHolderName;
  String? lastFourCardDigits;
  String? expireDate;
  String? cvv;

  Card({
    this.id,
    this.userId,
    this.cardHolderName,
    this.lastFourCardDigits,
    this.expireDate,
    this.cvv,
  });

  Card.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    cardHolderName = json['card_holder_name'];
    lastFourCardDigits = json['last_four_card_digits'];
    expireDate = json['expire_date'];
    cvv = json['cvv'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['card_holder_name'] = cardHolderName;
    data['last_four_card_digits'] = lastFourCardDigits;
    data['expire_date'] = expireDate;
    data['cvv'] = cvv;
    return data;
  }
}
