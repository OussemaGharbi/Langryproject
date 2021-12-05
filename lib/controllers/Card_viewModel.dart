import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:landryproject/models/card_model.dart';
import 'package:landryproject/service/database/CartDatabaseHelper.dart';

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
      model.quantity +=1;
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
      model.quantity +=1;

      await dbHelper.insert(model);
      _cardProduct.add(model);
      _totalPrice += ((double.parse(model.price)) *
          model.quantity);
    }

    update();

  }
  InscreaseQuantity(int index) async {
    _cardProduct[index].quantity ++;
    _totalPrice += ((double.parse(_cardProduct[index].price)));
    await dbHelper.updateProduct(_cardProduct[index]);

    update();
  }
  deletelement(int index)async{
    await dbHelper.deleteProduct(_cardProduct[index]);
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

}