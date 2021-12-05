import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:landryproject/controllers/Card_viewModel.dart';

class SummaryScreen extends StatelessWidget {
  const SummaryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body:
            SafeArea(
              child: GetBuilder<CardViewModel>(
                builder:(controller)=>
                Container(
                  height: 350,
                  padding: EdgeInsets.all(30.0),
                  child: ListView.separated
                    (
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.cardPoduct.length,
                      itemBuilder: (context,index)=>
                          Container(

                            child: Column(

                              children: [

                                Container(
                                  height: 150,
                                    width: 140,
                                    child: Image.network(controller.cardPoduct[index].image,
                                    fit: BoxFit.fill,),
                                ),
                                SizedBox(height: 10,),
                                Text("${controller.cardPoduct[index].name}"),
                                SizedBox(height: 10,),
                                Text("${controller.cardPoduct[index].price} x ${controller.cardPoduct[index].quantity}"),



                              ],
                            ),

                          ),


                              separatorBuilder: (context,index){
                              return SizedBox(width: 10.0,);
                    }
                    ),
                ),
              ),
            ),





    );
  }
}
