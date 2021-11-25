class CategoriesModel{
   late String name, image, price;
   CategoriesModel(this.name, this.image, this.price);

   CategoriesModel.fromJson(Map<dynamic, dynamic> map){
     if (map==null){
       return;
     }
     name = map['name'];
     image= map['image'];
     price= map['price'];

   }
   toJson(){
     return{
       'name': name,
       'image': image,
       'price': price,
     };

}

}