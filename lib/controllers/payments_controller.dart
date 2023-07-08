import 'dart:convert';

import 'package:derapidos/models/payment_cards.dart';
import 'package:derapidos/models/shipping_addresses.dart';
import 'package:derapidos/services/api_services.dart';
import 'package:get/get.dart';

class PaymentsController extends GetxController {
  var loading = true.obs;
  var newLoading = false.obs;

  Future getPaymentCards() async {
    await getAllPaymentCards();
    loading.value = false;
  }

  ///
  PaymentCards? paymentCards;
  Card? currentCard;
  getAllPaymentCards() async {
    var data = await ApiServices().getAllPaymentCards();
    paymentCards = PaymentCards.fromJson(jsonDecode(data!));
  }

  Future<bool?> activatePaymentCard(int cardId) async {
    var res = await ApiServices().activePaymentCard(cardId);
    return res;
  }

  Card? newCard = Card();
  Future<bool?> addPaymentCard() async {
    var res = await ApiServices().addPaymentCard(newCard!);
    return res;
  }

  ///

}
