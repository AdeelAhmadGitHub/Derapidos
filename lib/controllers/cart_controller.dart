import 'dart:convert';
import 'dart:developer';
import 'package:derapidos/models/cart_details.dart';
import 'package:derapidos/models/cart_item.dart';
import 'package:derapidos/models/checkout.dart';
import 'package:derapidos/models/coupons.dart';
import 'package:derapidos/models/make_checkout.dart';
import 'package:derapidos/models/product_detail.dart';
import 'package:derapidos/models/shipping_addresses.dart';
import 'package:derapidos/models/track_order.dart';
import 'package:derapidos/services/api_services.dart';
import 'package:derapidos/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/AppliedCoupon.dart';
import '../models/allCouponse.dart';

class CartController extends GetxController {
  var loading = true.obs;

  // var saLoading = true.obs;
  var trackOrderLoading = true.obs;
  var cancelLoading = false.obs;
  var couponLoading = false.obs;
  var allCouponLoading = true.obs;
  String? ordertracId;

  Rx<CartItem> cartItem = CartItem(quantity: 0, extras: []).obs;

  Future<bool?> addToCart() async {
    // dprint('cartItem ${cartItem.toJson()}');
    cartItem.value.specialInstructions = '';
    // 'Please Do fast delivery as soon as possible';
    var check = await ApiServices().addToCart(cartItem.value);
    return check;
  }

  String? productIdU;
  int quantityU=1;

  Future<bool?> updateCartProductQuantity() async {
    var check = await ApiServices()
        .updateCartProductQuantity(productIdU ?? "", quantityU);
    return check;
  }

  addExtra(int id) {
    var index =
        cartItem.value.extras!.indexWhere((extra) => extra.extrasId == id);
    if (index == -1) {
      var extra = Extra(extrasId: id, extrasQuantity: 1);
      cartItem.value.extras!.add(extra);
    } else {
      //
      cartItem.value.extras![index].extrasQuantity =
          cartItem.value.extras![index].extrasQuantity! + 1;
    }
    // cartItem.value.extras!.add(Extra(extrasId: id));
  }

  removeExtra(int id) {
    if (cartItem.value.extras!.isNotEmpty) {
      var index =
          cartItem.value.extras!.indexWhere((extra) => extra.extrasId == id);
      if (index != -1) {
        if (cartItem.value.extras![index].extrasQuantity! >= 1) {
          cartItem.value.extras![index].extrasQuantity =
              cartItem.value.extras![index].extrasQuantity! - 1;
        } else {
          cartItem.value.extras!.removeAt(index);
        }
      }
    }
  }

  var total = 0.0;

  calculateTotal(ProductDetail? productDetail) {
    total = 0.0;
    total = (double.parse(productDetail!.detail!.price!) *
            cartItem.value.quantity!) +
        double.parse(productDetail.detail!.deliveryFee!);
    for (var addedExtra in cartItem.value.extras!) {
      //
      for (var productExtra in productDetail.detail!.productExtras!) {
        //
        if (addedExtra.extrasId.toString() == productExtra.extraId) {
          //
          total = total +
              (double.parse(productExtra.price!) * addedExtra.extrasQuantity!);
        }
      }
    }
  }

  Future<bool?> checkInCart(String? marketId) async {
    var isAllowed = true;
    await getCartDetail();
    for (var detail in cartDetails!.details!) {
      if (detail.marketId == marketId) {
        isAllowed = true;
      } else {
        isAllowed = false;
      }
      break;
    }
    return isAllowed;
  }

  ///
  CartDetails? cartDetails;

  // String? currentProductId;
  Future getCartData() async {
    loading.value = true;
    await getShippingAddresses();
    await getCartDetail();
    //await getPromoCodes();
    totalForCheckOut();
    loading.value = false;
  }

  RxString? cartLength;

  Future getCartDetail() async {
    var data = await ApiServices().getCartDetails();
    cartDetails = CartDetails.fromJson(jsonDecode(data!));
    cartLength?.value = cartDetails?.details?.length.toString() ?? "0";
    // loading.value = false;
  }

  Rx<CartItem> updatedCartItem = CartItem(quantity: 0, extras: []).obs;

  Future updateCartDetail(int? quantity, Details? details) async {
    loading.value = true;
    updatedCartItem.value.productId = details!.productId;
    updatedCartItem.value.quantity = quantity;
    updatedCartItem.value.deliveryCharges =
        double.parse(details.deliveryCharges!);
    updatedCartItem.value.size = details.size;
    updatedCartItem.value.specialInstructions = details.specialInstructions;
    for (var extra in details.productExtras!) {
      updatedCartItem.value.extras!.add(Extra(
        extrasId: extra.id,
        extrasQuantity: int.parse(extra.quantity!),
      ));
    }

    var cartId = details.cartId;
    var data =
        await ApiServices().updateCartProduct(cartId!, updatedCartItem.value);
    // cartDetails = CartDetails.fromJson(jsonDecode(data!));
    await getCartDetail();
    totalForCheckOut();
    loading.value = false;
  }

  var checkoutTotal = 0.0;
  var itemTotal = 0.0;
  var discount = 0.0;
  var tax = 0.0;
  var deliveryCharges = 0.0; // 5.0;
  var paymentMethod = 1;
  var paymentMethodType = "Cash on Delivery";

  ///
  resetParams() {
    checkoutTotal = 0.0;
    itemTotal = 0.0;
    discount = 0.0;
    tax = 0.0;
    deliveryCharges = 0.0;
  }

  totalForCheckOut() {
    resetParams();
    var productPrice = 0.0;
    // var productNetPrice = 0.0;
    var extrasPrice = 0.0;
    for (var detail in cartDetails!.details!) {
      for (var extra in detail.productExtras!) {
        extrasPrice = extrasPrice +
            (double.parse(extra.price!) * int.parse(extra.quantity!));
        // productPrice = productPrice + extrasPrice;
      }
      print(
          'productPrice = $productPrice + (${detail.productPrice!} * ${detail.quantity!})');
      productPrice = //productPrice +
          (double.parse(detail.productPrice!) * int.parse(detail.quantity!));
      discount = discount + double.parse(detail.productDiscountPrice!);
      tax = double.parse(detail.marketTaxPercentage!);
      // tax = tax + double.parse(detail.marketTaxPercentage!);
      // productPrice = productPrice +
      //     (double.parse(detail.productPrice!) * int.parse(detail.quantity!));
      // productTotal = productTotal + double.parse(detail.productPrice!);
      // itemTotal = itemTotal + double.parse(detail.productPrice!);
      print('itemTotal = $itemTotal + ($productPrice + $extrasPrice)');
      itemTotal = itemTotal + (productPrice + extrasPrice);
    }
    // for (var detail in cartDetails!.details!) {
    // deliveryCharges = deliveryCharges + double.parse(detail.productPrice!);
    // }
    if (cartDetails!.details!.isNotEmpty) {
      deliveryCharges =
          double.parse(cartDetails!.details!.first.deliveryCharges!);
    }
    tax = (tax / 100) * itemTotal;
    // var taxAmount = (tax / 100) * itemTotal;
    print('In totalForCheckOut fun >> deliveryCharges = $deliveryCharges, '
        'itemTotal = $itemTotal, '
        'taxAmount = $tax, '
        // 'taxAmount = $taxAmount, '
        'discount = $discount, ');
    checkoutTotal = itemTotal + deliveryCharges + tax - discount;
    // checkoutTotal = itemTotal + deliveryCharges + taxAmount - discount;
    print('In totalForCheckOut fun >> checkoutTotal = $checkoutTotal, '
        ' '
        ' '
        '  '); // checkoutTotal = checkoutTotal - discount;
    // checkoutTotal = checkoutTotal + tax;
  }

  ///
  ShippingAddresses? shippingAddresses;
  Address? currentAddress;

  getShippingAddresses() async {
    var data = await ApiServices().getShippingAddresses();
    shippingAddresses = ShippingAddresses.fromJson(jsonDecode(data!));
    // currentAddress = shippingAddresses!.addresses!.isNotEmpty
    //     ? shippingAddresses!.addresses!
    //         .firstWhere((address) => address.activeStatus == '1', orElse: () {
    //         return currentAddress!;
    //       })
    //     : null;
    for (var address in shippingAddresses!.addresses!) {
      if (address.activeStatus == '1') {
        currentAddress = address;
        break;
      }
    }
  }

  ///
  Coupons? coupons;
  Coupon? currentCoupon;
  AllCouponsModel? allCouponsModel;

  getAllCoupons() async {
    allCouponLoading.value = true;
    var data = await ApiServices().getAllCoupons();
    allCouponsModel = AllCouponsModel.fromJson(jsonDecode(data!));
    // print("this is coupons $coupons.");
    // if (coupons!.couponsList!.isNotEmpty) {
    //   currentCoupon = coupons!.couponsList!.first;
    // }
    print("good");
    allCouponLoading.value = false;
  }

  String? code;

  ///
  ///
  AppliedCoupon? appliedCoupon;

  applyCouponCode() async {
    couponLoading.value = true;
    var check = await ApiServices().applyCouponCode(
      "${currentCoupon?.code ?? code}",
      checkoutTotal.toString(),
    );
    appliedCoupon = AppliedCoupon.fromJson(jsonDecode(check!));
    print("udsfi");
    couponLoading.value = false;
  }

  ///
  MakeCheckout? makeCheckout;

  // var isCheckOutReady = false;
  List<Items>? items = [];
  var coLoading = false.obs;
  Checkout? checkout;

  Future<bool?> checkOutNow(BuildContext context) async {
    coLoading.value = true;
    for (var product in cartDetails!.details!) {
      List<Extras>? extrasList = [];
      for (var extra in product.productExtras!) {
        Extras extras = Extras(
          extrasId: (extra.id),
          extrasPrice: double.parse(extra.price ?? '0.0').toInt(),
          extrasQuantity: int.parse(extra.quantity ?? '0'),
        );
        extrasList.add(extras);
      }
      Items item = Items(
        productId: int.parse(product.productId!),
        // 1,
        productQuantity: int.parse(product.quantity!),
        // 1,
        productPrice: double.parse(product.productPrice!),
        // 11,
        productSize: product.size,
        // 'Small',
        productSpecialInstructions: product.specialInstructions,
        // '',
        extras: extrasList,
      );
      items!.add(item);
      // break;
    }
    if (currentAddress == null) {
      showSnackBar(context, "Add your Address");
      await Future.delayed(const Duration(seconds: 1));
      return false;
    }
    makeCheckout = MakeCheckout(
      marketId: cartDetails!.details!.first.marketId,
      // '29', // Missing
      shippingAddressId: currentAddress!.id!.toString(),
      paymentMethodType: paymentMethodType,
      itemTotal: itemTotal.toString(),
      discount: discount.toString(),
      taxes: tax.toString(),
      deliveryCharges: deliveryCharges.toString(),
      orderTotal: checkoutTotal.toString(),
      promoCode: '',
      items: items,
    );
    var itemss =
        jsonEncode(makeCheckout!.items!.map((e) => e.toJson()).toList());
    dprint('itemss$itemss');
    dprint('@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@');
    // return false;
    var res = await ApiServices().checkOut(makeCheckout!);
    // if (checkout.success!) {
    if (res != null) {
      checkout = Checkout.fromJson(jsonDecode(res));
      orderId = checkout!.data!.orderId.toString();
      coLoading.value = true;
      return true;
    } else {
      coLoading.value = true;
      return false;
    }
  }

  Future<bool?> removeItem(String? productId) async {
    return await ApiServices().removeProductFromCart(productId!);
  }

  String? orderId;
  TrackOrder? orderTracking;

  Future trackOrder() async {
    // orderId = "21";
    //dprint("$orderId");
    var data = await ApiServices().trackOrder(ordertracId ?? "");
    orderTracking = TrackOrder.fromJson(jsonDecode(data!));
    //log('order track data: $orderTracking');
    trackOrderLoading.value = false;
  }

  ///
  Future<bool?> cancelOrder() async {
    cancelLoading.value = true;
    var check = await ApiServices().cancelOrder("$orderId");
    cancelLoading.value = false;
    return check;
  }
}
