import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:landryproject/constants/constants.dart';
import 'package:landryproject/controllers/Card_viewModel.dart';

import 'package:landryproject/presentation/checkout/locationTest.dart';



class CartScreen extends StatelessWidget {




  @override
  Widget build(BuildContext context) {

    dynamic y = Get.arguments.length;//index
    dynamic x = Get.arguments;//index


    Get.put(CardViewModel());
    // dynamic z = Cart.cardPoduct;



    return GetBuilder<CardViewModel>(
      init: CardViewModel() ,
      builder:(controller)=>   Scaffold(
        body: controller.cardPoduct.length ==0 ? Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: SvgPicture.asset('assets/images/cartempty.svg', width: 200,height: 200,)),
            Text('Cart is empty',
              textAlign: TextAlign.center,),
          ],
        ) :Column(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(20),
                child: ListView.separated(
                  itemCount: controller.cardPoduct.length,

                  itemBuilder: (context, index) {
                    return Dismissible(
                      key: UniqueKey(),
                      direction: DismissDirection.horizontal,
                      onDismissed: (direction) {
                        if (direction == DismissDirection.endToStart) {
                          controller.totalPrice -= double.parse(controller.cardPoduct[index].price) ;

                          controller.deletelement(index);
                         controller.cardPoduct.removeAt(index);

                          Get.snackbar('context', 'Mail has beed deleted!');
                        }
                      },
                      background:  Container(
                        alignment: Alignment.centerRight,
                        padding: EdgeInsets.only(right: 20.0),
                        color: Colors.redAccent,
                        child: Icon(Icons.delete, color: Colors.white),
                      ),

                      child: Container(
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
                                  Text("${controller.cardPoduct[index].price} Dt",style: TextStyle(
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
                                            controller.InscreaseQuantity(index);


                                          },
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Text('${controller.cardPoduct[index].quantity.toString()}',style: TextStyle(

                                        ),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        IconButton(
                                          icon: new Icon(Icons.remove_circle_outline_outlined),
                                          onPressed: (){
                                            controller.DecreaseQuantity(index);


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
                GetBuilder<CardViewModel>(
                  init: Get.put(CardViewModel()),
                  builder: (controller)=> Text("${controller.totalPrice.toStringAsFixed(2)}", style: TextStyle(
                    fontSize: 22,
                    color: Colors.green,

                  ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(15.0),
                  width: 150,
                  height: 90,

                  child: ElevatedButton(

                    child: Text('Check out'),

                    style: ElevatedButton.styleFrom(
                      primary: Constants.primaryColor,
                      shadowColor: Colors.black,

                    ),

                    onPressed: () {
                      Get.to(GetLocation());

                    },

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