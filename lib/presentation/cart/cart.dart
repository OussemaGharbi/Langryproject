import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:landryproject/controllers/Card_viewModel.dart';
import 'package:landryproject/models/ProductModel.dart';
import 'package:landryproject/models/card_model.dart';
import 'package:landryproject/presentation/ProductScreen.dart';



class CartScreen extends StatelessWidget {




  @override
  Widget build(BuildContext context) {
    dynamic y = Get.arguments.length;//index
    dynamic x = Get.arguments;//index


    final Cart = Get.put(CardViewModel());
    dynamic z = Cart.cardPoduct;
    int length = Cart.cardPoduct.length;




    return GetBuilder<CardViewModel>(
      init: CardViewModel(),
      builder:(controller)=> Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(20),
                child: ListView.separated(
                  itemCount: controller.cardPoduct.length,

                  itemBuilder: (context, index) {
                    return Container(
                      height: 140,

                      child: Row(
                        children: [

                          Container(height: 100,
                            width: 100,

                            child: Image.network(controller.cardPoduct[index].image,
                              fit: BoxFit.fill,),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(left: 30),
                            child: Column(
                              children: [
                                Text("${controller.cardPoduct[index].name}",style: TextStyle(
                                  fontSize: 21,
                                ),

                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text("${z[index].price} Dt",style: TextStyle(
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
                                      IconButton(
                                        icon: new Icon(Icons.add_circle_outline),
                                        onPressed: (){


                                        },
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text('1',style: TextStyle(

                                      ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      IconButton(
                                        icon: new Icon(Icons.remove_circle_outline_outlined),
                                        onPressed: (){


                                        },
                                      ),
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Text("Total", style: TextStyle(
                  fontSize: 22,
                  color: Colors.black,

                ),
                ),
                Text("200 DT", style: TextStyle(
                  fontSize: 22,
                  color: Colors.green,

                ),
                ),
                Container(
                  padding: EdgeInsets.all(15.0),
                  width: 130,
                  height: 90,
                  child: FloatingActionButton.extended(
                    backgroundColor: Colors.green,


                    onPressed: () {
                      Get.off(ProductScreen());

                    },
                    icon: Icon(Icons.save),
                    label: Text("Save"),
                  ),
                ),
              ],

            ),
          ],
        ),
      ),
    );
  }
}