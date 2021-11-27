import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:landryproject/models/card_model.dart';
import 'package:landryproject/service/database/CartDatabaseHelper.dart';

class CardViewModel extends GetxController{

  ValueNotifier<bool> get loading => _loading;
  ValueNotifier<bool> _loading = ValueNotifier(false);
  double get totalPrice => _totalPrice;
  double _totalPrice=0.0;
  List<CardModel> _cardProduct = [];
  List<CardModel> get cardPoduct => _cardProduct;

  CardViewModel() {
    getAllProduct();
  }

  addProduct(CardModel model) async{

    var dbHelper = CardDataBaseHelper.db;
    await dbHelper.insert(model);
    update();
  }

  getAllProduct() async {
    _loading.value = true;
    var dbHelper = CardDataBaseHelper.db;
    _cardProduct = await dbHelper.getAll();
    print(_cardProduct.length);

    _loading.value = false;
    update();
    return _cardProduct;

  }
  getTotalPrice() {
    for (int i = 0; i < _cardProduct.length; i++) {
      _totalPrice += ((_cardProduct[i].price) *
          _cardProduct[i].quantity);
      print(_totalPrice);
      update();
    }
  }

}