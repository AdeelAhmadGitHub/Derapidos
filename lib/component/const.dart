import 'package:flutter/material.dart';

const String kMyCoins = "10";
final otpController = TextEditingController();

const kMainColor = Color(0xFF034AD7);
const kMainGradient = LinearGradient(
  begin: Alignment.center,
  end: Alignment(-0.2, -0.5),
  stops: [0.0, 0.5, 0.5, 1],
  colors: [
    Colors.orangeAccent,
    Colors.orangeAccent,
    Colors.black,
    Colors.black,
  ],
  tileMode: TileMode.repeated,
);
