class CardModel {
  late  String name, image;
  late  int  quantity;
  late int price;


  CardModel({
    this.name="",
    this.image="https://cdn.futura-sciences.com/buildsv6/images/mediumoriginal/c/9/f/c9f186c730_82925_googlelogo.jpg",
    this.quantity=1,
    this.price=0 });

  CardModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }

    name = map['name'];
    image = map['image'];
    quantity = map['quantity'];
    price = map['price'];
  }

  toJson() {
    return {
      'name': name,
      'image': image,
      'quantity': quantity,
      'price': price,
    };
  }
}
