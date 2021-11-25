import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:landryproject/constants/constants.dart';
import 'package:landryproject/controllers/HomeController.dart';
import 'package:landryproject/presentation/ProductScreen.dart';
import 'package:landryproject/presentation/cart/cart.dart';
import 'package:landryproject/widgets/custom_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {




  @override                               
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: Get.put(HomeController()),
      builder: (controller) => Container(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Constants.primaryColor,
            centerTitle:true,


          ),
          body: Container(
            margin: EdgeInsets.only(top: 100,left: 12, right: 0),


            child: Column(

              children: [
                Container(
                    margin: EdgeInsets.only(left: 12),
                    child: CustomText(text: "Services",)
                ) ,
                SizedBox(height: 20,),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(20),
                    child: ListView.separated(
                      itemCount: controller.categoryModel.length ,
                      scrollDirection: Axis.horizontal,

                      itemBuilder: (context, index) {
                        return Container(

                          child: Row(
                            children: [

                              Column(
                                children: [
                                  Container(
                                    height:MediaQuery.of(context).size.height * .2,
                                    width: MediaQuery.of(context).size.width * .3,
                                    decoration: BoxDecoration(
                                     color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(10),
                                          bottomLeft: Radius.circular(10),
                                          bottomRight: Radius.circular(10)
                                      ),


                                      boxShadow: [
                                        BoxShadow(
                                          color:Constants.kPrimaryColor.withOpacity(0.1) ,
                                           spreadRadius: 5,
                                          blurRadius: 7,
                                          offset: Offset(0, 3),


                                        )
                                      ]       ,
                                    ),

                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.network(controller.categoryModel[index].image,
                                        fit: BoxFit.fill,),
                                    ),
                                  ),
                                  SizedBox(height: 20,),
                                  CustomText(text: controller.categoryModel[index].name,)
                                ],
                              ),


                            ],
                          ),

                        );


                      }, separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        height: 12,
                        width: 20,
                      );
                    },

                    ),
                  ),
                ),

              ],
            ),
          ),
          bottomNavigationBar:  bottomNavigationBar(),
        ),
      ),
    );
  }


  Widget bottomNavigationBar() {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller)=>
      BottomNavigationBar
        (items: [
       BottomNavigationBarItem(label: "",

           icon: Icon(Icons.house_outlined)),
        BottomNavigationBarItem(label: "",

            icon: Icon(Icons.add_shopping_cart)),
      ],
      currentIndex: controller.navigatorValue ,
      selectedItemColor: Constants.primaryColor,
      onTap: (index){
          if(index==1){
            Get.to(ProductScreen());
          }
          controller.ChangeSelectedValue(index);

      },),
    );
  }
}