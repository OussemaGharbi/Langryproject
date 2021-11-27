import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:landryproject/models/CategoriesModel.dart';

class CategoriesViewModel extends GetxController{
  ValueNotifier<bool>  get loading=> _loading;
  ValueNotifier<bool>  _loading = ValueNotifier(false);
  List<CategoriesModel> _categoriesmodel=[];
  List<CategoriesModel> get categoriesmodel => _categoriesmodel;

  final CollectionReference _collectionReference = FirebaseFirestore.instance.collection("categories");
  CategoriesViewModel(){
    getCategory();
  }
  getCategory() async{
    _loading.value = true;
     await _collectionReference.get().then((value) {
      for(int i = 0; i<value.docs.length; i++){
        _categoriesmodel.add(CategoriesModel.fromJson(value.docs[i].data() as Map<dynamic,dynamic>));
        print(_categoriesmodel.length);
        _loading.value=false;
      }
      update();
    });

  }

}