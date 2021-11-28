import 'dart:ui';

import 'package:get/get.dart';
import 'package:landryproject/constants/constants.dart';
import 'package:landryproject/presentation/Home.dart';
import 'package:landryproject/presentation/HomeScreen.dart';

class CheckoutController extends GetxController{
  int get index => _index ;
  int _index = 0;
  Pages get pages =>_pages;
  Pages _pages = Pages.DeliveryTime;

  void changeIndex(int i){
    _index = i ;
    if(_index==1){
      _pages = Pages.AddAddress;
    }else if(_index ==2){
      _pages = Pages.Summary;
    }else if(_index==3){
      Get.to(HomeScreen());

    }
    update();
  }

  Color getColor(int i) {
    if (i == _index) {
      return inProgressColor;
    } else if (i < _index) {
      return Constants.kPrimaryColor;
    } else {
      return todoColor;
    }
  }



}