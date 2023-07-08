import 'package:flutter/material.dart';

var images = 'assets/images';

class AppTheme {
  static String? fontfamily = 'DMSans';

  // static Color? appColor = const Color.fromRGBO(1, 107, 193, 1);

  // static const insideContainer = Color.fromARGB(255, 196, 208, 219);
  // static const drawerTextColor = Color.fromARGB(255, 20, 66, 143);
  // static const Color textTabular = Color.fromARGB(255, 151, 161, 182);
  // static const Color field = Color.fromARGB(255, 109, 162, 187);
  // static const Color appbar = Color.fromARGB(255, 97, 127, 183);
  // static const Color clickAbleButton = Color.fromARGB(255, 62, 93, 157);
  // static const Color insideField = Color.fromARGB(255, 242, 242, 242);
  // static const Color logoText = Color.fromARGB(255, 51, 84, 152);
  // static const Color smallText = Color.fromARGB(255, 156, 157, 158);

  // static const supportFieldColor = Color.fromARGB(255, 214, 215, 216);
  // static const offWhiteColor = Color.fromARGB(255, 245, 246, 248);
  // static const policyColor = Color.fromARGB(255, 208, 210, 213);
  static var whiteColor = Colors.white;
  // static var blackColor = Colors.black;
  // static const Color fieldColor = Color.fromARGB(255, 208, 230, 246);
  // static const Color homeBGColor = Color.fromARGB(255, 236, 237, 239);
  // static const Color homeSearchColor = Color.fromARGB(255, 250, 250, 251);

  static const MaterialColor appColor = MaterialColor(
    _colorPrimaryValue,
    <int, Color>{
      50: Color(_colorPrimaryValue),
      100: Color(_colorPrimaryValue),
      200: Color(_colorPrimaryValue),
      300: Color(_colorPrimaryValue),
      400: Color(_colorPrimaryValue),
      500: Color(_colorPrimaryValue),
      600: Color(_colorPrimaryValue),
      700: Color(_colorPrimaryValue),
      800: Color(_colorPrimaryValue),
      900: Color(_colorPrimaryValue),
    },
  );
  static const int _colorPrimaryValue = 0xff5D3EBF; // 0xFF016BC1;
}
//////////
//
/*
{
  "success":true,
  "message":"Restaurant Details",
  "data":{
    "market_details":{
      "id":31,
      "name":"KFC Burger",
      "description":"Test details",
      "address":"Lahore",
      "open_status":"Open",
      "total_reviews":"0",
      "average_rating":0,
      "distance":"",
      "logo":"http:\/\/derapidos.citizensadgrace.com\/public\/storage\/markets\/market-20221207-16064065346385.jpg",
      "banner_image":"http:\/\/derapidos.citizensadgrace.com\/public\/storage\/markets\/market-20221207-16064065346385.jpg"
      },
      "category_list":[
        {
          "id":"10",
          "name":"Burger",
          "description":"Burger"
        }
      ],
      "product_list":{
        "current_page":1,
        "data":[
          {
            "id":"48",
            "name":"Chicken Burger",
            "price":"120.00",
            "discount_price":"23.00",
            "description":"test details",
            "featured":"1",
            "deliverable":"1",
            "image":"http:\/\/derapidos.citizensadgrace.com\/public\/storage\/products\/product-20221207-16093991427956.jpg",
            "favorite":0
          }
        ],
        "first_page_url":"http:\/\/derapidos.citizensadgrace.com\/public\/api\/get_restaurant_details?page=1",
        "from":1,
        "last_page":1,
        "last_page_url":"http:\/\/derapidos.citizensadgrace.com\/"
    }
  }
}
*/
