import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:landryproject/models/CategoriesModel.dart';
import 'package:landryproject/models/ProductModel.dart';
import 'package:landryproject/service/database/HomeService.dart';
class HomeController extends GetxController{

  int _navigatorValue = 0 ;
  get navigatorValue => _navigatorValue;
  void ChangeSelectedValue(int selectedValue){
    _navigatorValue = selectedValue;
    update();

  }

  ValueNotifier<bool> get loading => _loading;
  ValueNotifier<bool> _loading = ValueNotifier(false);

  List<CategoriesModel> get categoryModel => _categoryModel;
  List<CategoriesModel> _categoryModel = [];

  List<Product> get productModel => _productModel;
  List<Product> _productModel = [];
  List<Product> get cartModel => _cartModel;
  List<Product> _cartModel = [];
  String get categoryName => _categoryName;
  late  String _categoryName;

  set categoryName(String value) {
    _categoryName = value;
  }

  @override
  onInit(){
    super.onInit();
    print("dddddddddddddddddddddddddddddpppcpcpc");
    HomeViewModel();

  }


  HomeViewModel() {

   getCategory();
    getProducts();
  }
  ClearProducts(){
    _productModel.clear();

  }
  ClearCategory(){
  _categoryModel.clear();

}
  getCategory() async {
    ClearCategory();
    _loading.value = true;
    HomeService().getCategory().then((value) {
      print("value");
      for (int i = 0; i < value.length; i++) {

        _categoryModel.add(CategoriesModel.fromJson(value[i].data() as Map<dynamic,dynamic>));
        _loading.value = false;
      }
      update();
    });
  }

  getProducts() async {
    _loading.value = true;
    HomeService().getProducts().then((value) {
      print(value);
      print("jklaezjlzjaklejklzajeklazkjeklazjekljzale");
      for (int i = 0; i < value.length; i++) {
        String x = value[i]['categorie'];
        if(x.toLowerCase()== categoryName.toLowerCase())
          {

            _productModel.add(Product.fromJson(value[i].data()as Map<dynamic,dynamic>));
            _loading.value = false;
          }
      }
      print(_productModel.length);
      update();
    });
  }


}