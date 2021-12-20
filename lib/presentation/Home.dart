import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:landryproject/constants/constants.dart';
import 'package:landryproject/controllers/Card_viewModel.dart';
import 'package:landryproject/controllers/HomeController.dart';
import 'package:landryproject/models/ProductModel.dart';
import 'package:landryproject/presentation/ProductScreen.dart';
import 'package:landryproject/presentation/ProfileScreen.dart';
import 'package:landryproject/presentation/cart/cart.dart';
import 'package:landryproject/widgets/custom_text.dart';
import 'package:landryproject/presentation/widgets/style.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedFoodCard = 0;


  @override
  Widget build(BuildContext context) {
    final productcontroller = Get.put(ProductScreen());


    return GetBuilder<HomeController>(
      init: Get.put(HomeController()),
      builder: (controller) => Container(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Constants.primaryColor,
            centerTitle:true,


          ),
          body: Container(


            child: Column(

              children: [

                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(20),
                    child: ListView(
                      children: [


                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: PrimaryText(
                              text: 'Categories',
                              fontWeight: FontWeight.w700,
                              size: 22),
                        ),

                        SizedBox(
                          height: 240,
                          child: GetBuilder<HomeController>(
                            init: HomeController(),
                            builder:(controller)=> ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: controller.categoryModel.length ,
                              itemBuilder: (context, index) => Padding(
                                padding: EdgeInsets.only(left: index == 0 ? 25 : 0),
                                child: foodCategoryCard(
                                    controller.categoryModel[index].image,
                                    controller.categoryModel[index].name,
                                    index),
                              ),
                            ),
                          ),
                        ),

                      ],
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
    final Cart = Get.put(CardViewModel());
    dynamic z = Cart.cardPoduct;
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller)=>
      BottomNavigationBar
        (items: [
       BottomNavigationBarItem(label: "",

           icon: Icon(Icons.house_outlined)),
        BottomNavigationBarItem(label: "",

            icon: Icon(Icons.add_shopping_cart)),
        BottomNavigationBarItem(label: "",

            icon: Icon(Icons.person)),
      ],
      currentIndex: controller.navigatorValue ,
      selectedItemColor: Constants.primaryColor,
      onTap: (index){
          if(index==1){
            CardViewModel c =Get.put(CardViewModel());
            c.update();
            print('updated');
            Get.to(CartScreen(), arguments: z);
          }
          if(index ==0){
            Get.to(HomeScreen());

          }
          if(index==2){
            Get.to(ProfileView());
          }

          controller.ChangeSelectedValue(index);

      },),
    );
  }

  Widget foodCategoryCard(String imagePath, String name, int index) {
    HomeController x;
    return GetBuilder<HomeController>(
      init:HomeController(),
      builder:(controller)=> GestureDetector(
        onTap: () => {
        x = Get.put(HomeController()),
          x.categoryName = controller.categoryModel[index].name,
         print( x.categoryName),



              selectedFoodCard = index,
          x.ClearProducts(),
          x.HomeViewModel(),

          Get.to(ProductScreen()),

        },

        child: Container(
          margin: EdgeInsets.only(right: 20, top: 20, bottom: 20),
          padding: EdgeInsets.symmetric(vertical: 25, horizontal: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color:
              selectedFoodCard == index ? AppColors.primary : AppColors.white,
              boxShadow: [
                BoxShadow(
                  color: AppColors.lighterGray,
                  blurRadius: 15,
                )
              ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.network(imagePath, width: 40),
              PrimaryText(text: name, fontWeight: FontWeight.w800, size: 16),
              RawMaterialButton(
                  onPressed: null,
                  fillColor: selectedFoodCard == index
                      ? AppColors.white
                      : AppColors.tertiary,
                  shape: CircleBorder(),
                  child: Icon(Icons.chevron_right_rounded,
                      size: 20,
                      color: selectedFoodCard == index
                          ? AppColors.black
                          : AppColors.white))
            ],
          ),
        ),
      ),
    );
  }
}


