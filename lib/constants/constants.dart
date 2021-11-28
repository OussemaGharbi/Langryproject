import 'package:flutter/material.dart';
final String tableCard = 'card';
final String columnName = 'name';
final String columnQuantity= "quantity";
final String columnImage = 'image';
final String columnPrice = 'price';
final String columnProductId = 'productId';

class Constants {
  static final Color primaryColor = Color(0xFF9FC2CC);
  //  static final Color primaryColor = Color.fromRGBO(86, 215, 188, 1);
  static final Color scaffoldBackgroundColor = Color.fromRGBO(245, 247, 249, 1);
  static final kPrimaryColor = Color(0xFF9FC2CC);
  static final kPrimaryLightColor = Color(0xFFFFECDF);
}
const kTileHeight = 50.0;
const inProgressColor = Colors.black87;
const todoColor = Color(0xffd1d2d7);

enum Pages {
  DeliveryTime,
  AddAddress,
  Summary,
}
