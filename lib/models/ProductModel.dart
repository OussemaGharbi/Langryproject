import 'dart:ffi';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Product {
  late String name, image, id;
  late String price;
  late String categorie,  productId ;


  Product(this.id, this.name, this.image, this.price, this.categorie,this.productId);

  Product.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    id = map['id'];
    name = map['name'];
    image = map['image'];
    price = map['price'];
    categorie = map['categorie'];
    productId = map['productId'];
  }

  toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'price': price,
      'categorie': categorie,
      'productId' : productId
    };
  }
}