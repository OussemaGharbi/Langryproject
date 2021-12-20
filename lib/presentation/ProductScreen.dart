import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:landryproject/constants/constants.dart';
import 'package:landryproject/controllers/Card_viewModel.dart';
import 'package:landryproject/controllers/HomeController.dart';
import 'package:landryproject/models/ProductModel.dart';
import 'package:landryproject/models/card_model.dart';
import 'package:landryproject/presentation/cart/cart.dart';



class ProductScreen extends StatelessWidget {

  late List<Product>? ProductToCart;
  late CardViewModel? cardViewModel = new CardViewModel();
  late List<dynamic> cardlist =[].obs;







  @override
  Widget build(BuildContext context) {

    return GetBuilder<HomeController>(
        init: Get.put(HomeController()),
    builder: (controller)=>
       Container(
        child: Scaffold(
          appBar: AppBar(

            backgroundColor: Constants.kPrimaryColor,
            title: Column(

              children: [
                Text(
                  "Services",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          body: Column(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 20, right:20),
                  child: ListView.separated(
                    itemCount: controller.productModel.length ,

                    itemBuilder: (context, index) {
                      return Container(
                        height: 140,

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            Container(
                              child: Image.network(controller.productModel[index].image,
                                fit: BoxFit.fill,),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(left: 30),
                              child: Column(
                                children: [
                                  Text(controller.productModel[index].name,style: TextStyle(
                                    fontSize: 21,
                                  ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text("${controller.productModel[index].price} Dt",style: TextStyle(
                                    color: Colors.cyan,
                                  ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    height: 40,
                                    child: Row(

                                      children: [
                                        RaisedButton.icon(

                                          onPressed: () {
                                            cardViewModel!.getAllProduct();
                                            cardlist.add(

                                            [controller
                                                  .productModel[index].name,
                                        controller
                                                  .productModel[index].price
                                                  .toString(),


                                              controller
                                                  .productModel[index].image]
                                            );
                                            CardViewModel x= Get.put(CardViewModel());
                                            x.InscreaseQuantity(controller.productModel[index].productId);

                                            x.addProduct(CardModel(name: controller.productModel[index].name, price:controller.productModel[index].price.toString(), image :controller.productModel[index].image, productId: controller.productModel[index].productId, quantity: 1));
                                            x.getAllProduct();
                                            Get.snackbar("Added to Card", "Successfully");




                                          },
                                          elevation: 2.0,
                                          shape: new RoundedRectangleBorder(
                                            borderRadius: new BorderRadius.circular(5.0),
                                          ),
                                          color:Constants.primaryColor,
                                          icon: Icon(Icons.add_shopping_cart),
                                          label: Text("Add to Cart",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w900,
                                            ),
                                          ),
                                        )

                                      ],
                                    ),
                                  )
                                ],

                              ),
                            ),

                          ],
                        ),

                      );


                    }, separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: 12,
                    );
                  },

                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [


                  FloatingActionButton(
                        backgroundColor: Colors.black,



                        onPressed: () {

                          Get.to(CartScreen(), arguments: cardlist);



                        },
                        child: Icon(Icons.shopping_cart),

                      ),

                ],

              ),
            ],
          ),
        ),
      ),
    );

  }

}

