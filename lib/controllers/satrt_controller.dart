import 'dart:convert';
import 'dart:developer';
import 'package:derapidos/models/banners.dart';
import 'package:derapidos/models/categories.dart';
import 'package:derapidos/models/homepageproduct/homepageproducts.dart';
import 'package:derapidos/models/marketcategory.dart';
import 'package:derapidos/models/nearby_restaurants.dart';
import 'package:derapidos/models/product_detail.dart';
import 'package:derapidos/models/real_estate_models/filter_model.dart';
import 'package:derapidos/models/restaurant_detail.dart';
import 'package:derapidos/models/shipping_addresses.dart';
import 'package:derapidos/models/suggested_products.dart';
import 'package:derapidos/models/user_profile.dart';
import 'package:derapidos/services/api_services.dart';
import 'package:derapidos/user_prefs/user_prefs.dart';
import 'package:derapidos/utils/location_utils.dart';
import 'package:get/get.dart';

import '../models/ActiveOrderMarketDetail.dart';
import '../models/FilterModel.dart';
import '../models/GetCategoryModel.dart';
import '../models/RestaurantTypeModel.dart';
import '../models/banners_model.dart';
import 'address_controller.dart';

class StartController extends GetxController {
  var loading = true.obs;
  var loadingR = true.obs;
  var loadingF = true.obs;
  var pdLoading = true.obs; // For Product Detail
  var rdLoading = true.obs; // For Restaurant Detail
  var profileLoading = true.obs;
  var editProfileLoading = false.obs;
  var isVasible = false.obs;
  var address = "".obs;
  var add;
  var myIndex = 0.obs;
  String? rating;
  String? deliveryType;
  String? priceRange;
  String? categoryIdF;
  String? categoryIdName;
  String? restaurantType;
  String? derapidosType;
  String? categorytype;
  String? categorytypeid;
  String? markettype;
  String? restaurant_sub_type;
  String? marketId;
  String? userIDCheck;
  String? bannertype;
  String? radius;
  String? product_date;
  @override
  void onInit() {
    myAddress();
    //gotcallf();
    super.onInit();
  }
  gotcallf() async {
    bool? isLogin = await UserPreferences.getLoginCheck() ?? false;
    if (isLogin == false) {
      getHomeData();

    } else {
      //log('uytrtyuiolkjhgcvbnm');
      UserProfile? userProfile;
      String? data = UserPreferences.getUserData();
      if (data != null) {
        userProfile = UserProfile.fromJson(jsonDecode(data!));
      } else {}
      getHomeData1();

    }
  }
  BannersModel? banners;
  ActiveOrderMarketDetailModel? activeOrderMarketDetailModel;
  RestaurantTypeModel? restaurantTypeModel;
  var addressController = Get.put(AddressController());

  Future<Address?> myAddress() async {
    add = addressController.currentAddress;
    return add;
  }

  // FilterModel? filterModel;
  // Future searchAndFilter() async {
  //   final response=ApiServices().searchAndFilter(rating, deliveryType, priceRange,categoryIdF);
  //   homepageproduct=HomePageProduct.fromJson(response as Map<String, dynamic>);
  //   update();
  // }
  // Future<GetCategoryModel> getCategory() async {
  //   final response=ApiServices().getCategory();
  //   return GetCategoryModel.fromJson(response);
  // }
  Future getSpecialsBreakfast() async {
    var data = await ApiServices().getSpecialsBreakfast(restaurantType ?? "", categorytype ?? "");
    restaurantTypeModel = RestaurantTypeModel.fromJson(jsonDecode(data!));
  }

  Future getBanners() async {
    var data = await ApiServices().getBanners(bannertype ?? "");
    banners = BannersModel.fromJson(jsonDecode(data!));
  }

  Future<void> nextScreen() async {
    bool? isLogin = await UserPreferences.getLoginCheck() ?? false;
    if (isLogin == false) {
      print("Not Loging");
    } else {
      activeOrderMarketDetail();
    }
  }

  Future activeOrderMarketDetail() async {
    var data = await ApiServices().activeOrderMarketDetail();
    print("activeOrderMarketDetailModel//////////////////////");
    activeOrderMarketDetailModel = ActiveOrderMarketDetailModel.fromJson(jsonDecode(data!));
  }

  Categories? categories;
  Rx<MarketCategories>? _homepagecategory;

  Rx<MarketCategories>? get homepagecategory => _homepagecategory;
  Future getCategoriehome() async {
    var data = await ApiServices().getCategorieshome(categorytype ?? "");
    log("category data: $data");
    _homepagecategory = MarketCategories.fromJson(jsonDecode(data!)).obs;
    update();
  }

  Rx<HomePageProduct>? _homepageproduct;

  Rx<HomePageProduct>? get homepageproduct => _homepageproduct;

  Future getSuggestedProducts() async {
    var data = await ApiServices().getSuggestedProducts(
        rating ?? "",
        deliveryType ?? "",
        priceRange ?? "",
        categoryIdF ?? "",
        derapidosType ?? "",
        markettype ?? "",
        restaurant_sub_type ?? "",
        userIDCheck ?? "",
        radius ?? "",
        product_date ?? ""
    );
    _homepageproduct = HomePageProduct.fromJson(jsonDecode(data!)).obs;
    update();
  }

  Future getSuggestedProductss() async {
    var data = await ApiServices().getSuggestedProductss(rating ?? "", deliveryType ?? "", priceRange ?? "",
        categorytypeid ?? "", derapidosType ?? "", markettype ?? "", restaurant_sub_type ?? "");
    _homepageproduct = HomePageProduct.fromJson(jsonDecode(data!)).obs;
    update();
  }
  // NearByRestaurants? nearByRestaurants;
  // Future getNearByRestaurants() async {
  //   var data = await ApiServices().getNearByRestaurants();
  //   nearByRestaurants = NearByRestaurants.fromJson(jsonDecode(data!));
  // }

  Future getCurrentLocation() async {
    var locationAddress = await LocationUtils.addressFromCurrentLocation();
    address.value = locationAddress!;
  }

  getHomeData() async {
    loading.value = true;
    await getProfile();
    await getBanners();
    await getSuggestedProducts();
    await getCurrentLocation();
    await getCategoriehome();
    // getCategorie();
    //await getNearByRestaurants();
    //await getCurrentLocation();

    loading.value = false;
    update();
  }

  getHomeData1() async {
    loading.value = true;
    await getProfile();
    await getBanners();
    await getSuggestedProducts();
    await getCurrentLocation();
    await nextScreen();
    await getCategoriehome();
    // getCategorie();
    //await getNearByRestaurants();
    //await getCurrentLocation();

    loading.value = false;
    update();
  }

  var cpLoading = true.obs;
  var categoryId = '';

  // Category? category;
  // List<Product>? categoryProducts = [];
  // getCategoryProducts() {
  //   categoryProducts = [];
  //   for (var product in suggestedProducts!.products!) {
  //     if (product.categoryId == categoryId) {
  //       categoryProducts!.add(product);
  //     }
  //   }
  //   cpLoading.value = false;
  // }

  ProductDetail? productDetail;
  String? currentProductId;
  String? currentSize;
  Future getProductDetail() async {
    var data = await ApiServices().getProductDetail(currentProductId);
    productDetail = ProductDetail.fromJson(jsonDecode(data!));
    if (productDetail!.detail!.productSize!.isNotEmpty) {
      currentSize = productDetail!.detail!.productSize!.first;
    }
  }

  String? restaurantIDF;
  Future addRemoveFavorite() async {
    print("good");
    var data = await ApiServices().addFavorite(restaurantIDF ?? "");
  }

  getProductDetailScreenData() async {
    pdLoading.value = true;
    await getProductDetail();
    pdLoading.value = false;
  }

  Future<bool?> addToFavorites(String? productId) async {
    var check = await ApiServices().addToFavouriteProducts(productId);
    return check;
  }

  //
  ///
  RestaurantDetails? restaurantDetails;
  String? currentRestaurantId;
  String? currentCategoryId;

  getStoreDetail() async {
    rdLoading.value = true;
    var data = await ApiServices().getRestaurantDetail(currentRestaurantId);
    restaurantDetails = RestaurantDetails.fromJson(jsonDecode(data!));
    if (restaurantDetails!.data!.categoryList!.isNotEmpty) {
      currentCategoryId = restaurantDetails!.data!.categoryList!.first.id;
    }
    rdLoading.value = false;
  }

  ///
  UserProfile? userProfile;
  UserData? userData = UserData();

  getProfile() {
    profileLoading.value = true;
    var data = UserPreferences.getUserData();
    if (data != null) {
      userProfile = UserProfile.fromJson(jsonDecode(data!));
      userData!.name = userProfile!.userData!.name;
      userData!.email = userProfile!.userData!.email;
      userData!.phone = userProfile!.userData!.phone;
      // userData!.email = userProfile!.userData!.email;
      profileLoading.value = false;
    } else {
      //userProfile = UserProfile.fromJson(jsonDecode(data!));
      userData!.name = userProfile?.userData?.name ?? "";
      userData!.email = userProfile?.userData?.email ?? "";
      userData!.phone = userProfile?.userData?.phone ?? "";
      // userData!.email = userProfile!.userData!.email;
      profileLoading.value = false;
    }
  }

  editProfile() async {
    var res = await ApiServices().editProfile(userData!);
    return res;
  }
}
