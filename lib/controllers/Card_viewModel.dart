import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:landryproject/models/card_model.dart';
import 'package:landryproject/service/database/CartDatabaseHelper.dart';

class CardViewModel extends GetxController{
  ValueNotifier<bool> get loading => _loading;
  ValueNotifier<bool> _loading = ValueNotifier(false);

  List<CardModel> _cardProduct = [];
  List<CardModel> get cardPoduct => _cardProduct;
  CardController() {
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
  }

}