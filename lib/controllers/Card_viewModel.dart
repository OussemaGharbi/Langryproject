import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:landryproject/models/card_model.dart';
import 'package:landryproject/service/database/CartDatabaseHelper.dart';
import 'package:sqflite/sqflite.dart';

class CardViewModel extends GetxController{

  ValueNotifier<bool> get loading => _loading;
  ValueNotifier<bool> _loading = ValueNotifier(false);
  double get totalPrice => _totalPrice;
  set totalPrice (double p){
   _totalPrice = p;
  }


  double _totalPrice=0.0;
  var dbHelper = CardDataBaseHelper.db;

  List<CardModel> _cardProduct = <CardModel>[].obs;
  List<CardModel> get cardPoduct => _cardProduct;

  CardViewModel() {
    getAllProduct();
    getTotalPrice();
  }


  getAllProduct() async {
    _loading.value = true;
    var dbHelper = CardDataBaseHelper.db;
    _cardProduct = await dbHelper.getAll();
    print(_cardProduct.length);
    _loading.value = false;
    getTotalPrice();
    update();

  }
  getTotalPrice() {
    _totalPrice =0;
    for (int i = 0; i < _cardProduct.length; i++) {
      _totalPrice += ((double.parse(_cardProduct[i].price)) *
          _cardProduct[i].quantity);
      print(_totalPrice);
    }
    update();

  }
  addProduct(CardModel model) async{
    if(_cardProduct.length==0){
      model.price=model.price;
      await dbHelper.insert(model);
      _cardProduct.add(model);
      _totalPrice += ((double.parse(model.price)) *
          model.quantity);

    }else{
      for (int i=0; i<_cardProduct.length;i++){
        if(_cardProduct[i].productId==model.productId){
          return;
        }
      }

      await dbHelper.insert(model);
      _cardProduct.add(model);
      _totalPrice += ((double.parse(model.price)) *
          model.quantity);
    }

    update();

  }
  InscreaseQuantity(String id) async {
    for(int i =0; i<cardPoduct.length;i++){
      if (_cardProduct[i].productId==id)
        {
          _cardProduct[i].quantity ++;
          _totalPrice += ((double.parse(_cardProduct[i].price)));
          await dbHelper.updateProduct(_cardProduct[i]);
          print("cart quantity${_cardProduct[i].quantity}");
          print("cart price${_cardProduct[i].price}");
        }



    }


    update();
  }
  deletelement(String id)async{
    for(int i =0; i<cardPoduct.length;i++){
      if (_cardProduct[i].productId==id){
        await dbHelper.deleteProduct(_cardProduct[i]);

      }

    }

    update();

  }
  DecreaseQuantity(int index)async {
    if(_cardProduct[index].quantity<=1){
      print(_cardProduct[index].quantity);
      return;
    }else{
      _cardProduct[index].quantity --;
    }

    _totalPrice -= ((double.parse(_cardProduct[index].price)));
    update();
   await  dbHelper.updateProduct(_cardProduct[index]);

  }
  resetAll()async {
    _cardProduct.clear();
await dbHelper.deleteAllRows();  }

}