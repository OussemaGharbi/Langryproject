class CardModel {
  late  String name, image, productId;
  late  int  quantity;
  late String price;


  CardModel({
    this.name="",
    this.image="",
    this.quantity=1,
    this.price="",
    this.productId=""
  });

  CardModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }

    name = map['name'];
    image = map['image'];
    quantity = map['quantity'];
    price = map['price'];
    productId = map['productId'];
  }

  toJson() {
    return {
      'name': name,
      'image': image,
      'quantity': quantity,
      'price': price,
      'productId': productId,
    };
  }
}
