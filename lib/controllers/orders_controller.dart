import 'dart:convert';

import 'package:derapidos/models/checkout.dart';
import 'package:derapidos/models/customer_reviews.dart';
import 'package:derapidos/models/order_detail.dart';
import 'package:derapidos/models/orders.dart';
import 'package:derapidos/services/api_services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class OrdersController extends GetxController {
  var loading = true.obs;
  var odLoading = true.obs;
  var reviewLoading = true.obs;
  var addReviewLoading = false.obs;

  Orders? deliveredOrders, processingOrders, cancelledOrders;
  List<Order> processingList = [], deliveredList = [], cancelledlist = [];

  int getProcessingPage = 1;
  int getDeliveredPage = 1;

  bool isProcessing = true;

  Future getAllOrders() async {
    ///
    var dData = await ApiServices().getDeliveredOrders(getProcessingPage);
    deliveredOrders = Orders.fromJson(jsonDecode(dData!));
    deliveredList.addAll(Orders.fromJson(jsonDecode(dData)).data!.orderList!);

    ///
    var pData = await ApiServices().getProcessingOrders(getProcessingPage);
    processingOrders = Orders.fromJson(jsonDecode(pData!));
    processingList.addAll(Orders.fromJson(jsonDecode(pData)).data!.orderList!);

    ///
    var cData = await ApiServices().getCancelledOrders();
    cancelledOrders = Orders.fromJson(jsonDecode(cData!));
    loading.value = false;
  }

  OrderDetail? orderDetail;
  Checkout? checkout;
  String? currentOrderId;
  Future getOrderDetail() async {
    odLoading.value = true;
    var data = await ApiServices().getOrderDetail(currentOrderId);
    orderDetail = OrderDetail.fromJson(jsonDecode(data!));
    odLoading.value = false;
  }

  CustomerReviews? customerReviews;
  String? customerId;
  String? orderId;
  Future getCustomerReviews() async {
    reviewLoading.value = true;
    var data = await ApiServices().customerReviews(customerId);
    customerReviews = CustomerReviews.fromJson(jsonDecode(data!));
    calculateRatings(customerReviews);
    reviewLoading.value = false;
  }

  Future getReorder() async {
    odLoading.value = true;
    var data = await ApiServices().getReorderApi(customerId, orderId);
    if (data != null) {
      checkout = Checkout.fromJson(jsonDecode(data));
      orderId = checkout!.data!.orderId.toString();
      odLoading.value = false;
      return true;
    } else {
      odLoading.value = false;
      return false;
    }
  }

  var averageRating = 0.0;
  var oneRatings = 0;
  var twoRatings = 0;
  var threeRatings = 0;
  var fourRatings = 0;
  var fiveRatings = 0;
  var oneWidth = 0.0;
  var twoWidth = 0.0;
  var threeWidth = 0.0;
  var fourWidth = 0.0;
  var fiveWidth = 0.0;

  calculateRatings(CustomerReviews? customerReviews) {
    averageRating = 0.0;
    oneRatings = 0;
    twoRatings = 0;
    threeRatings = 0;
    fourRatings = 0;
    fiveRatings = 0;
    //
    for (var revu in customerReviews!.data!.reviews!) {
      //
      var rating = double.parse(revu.rating!);
      averageRating = averageRating + rating;

      ///
      if (revu.rating == '1') {
        oneRatings++;
      }

      ///
      if (revu.rating == '2') {
        twoRatings++;
      }

      ///
      if (revu.rating == '3') {
        threeRatings++;
      }

      ///
      if (revu.rating == '4') {
        fourRatings++;
      }

      ///
      if (revu.rating == '5') {
        fiveRatings++;
      }
    }

    if (customerReviews.data!.reviews!.isNotEmpty) {
      averageRating = averageRating / customerReviews.data!.reviews!.length;
    }
  }

  Review? review = Review(reviewPhotos: []);
  Future<bool?> addReview() async {
    addReviewLoading.value = true;
    review!.userId = customerId;
    review!.orderId = currentOrderId; // orderDetail!.orderData!.id;
    var check = await ApiServices().orderRating(review);
    addReviewLoading.value = false;
    return check;
  }

  ///
  pickPhotos() async {
    var picker = ImagePicker();
    final pickedFiles = await picker.pickMultiImage();
    for (var file in pickedFiles) {
      review!.reviewPhotos!.add(file.path);
    }
  }
}
