import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:landryproject/constants/constants.dart';
import 'package:landryproject/models/CategoriesViewModel.dart';
import 'package:landryproject/widgets/cardwidget.dart';

import 'login.dart';
class ServicesCategories extends StatefulWidget {
  const ServicesCategories({Key? key}) : super(key: key);

  @override
  _ServicesCategoriesState createState() => _ServicesCategoriesState();
}

class _ServicesCategoriesState extends State<ServicesCategories> {
  int x =0;
  int x1 =0;
  int x2 =0;
  int somme=0;




  @override
  Widget build(BuildContext context) {


  Size size = MediaQuery.of(context).size;
    return GetBuilder<CategoriesViewModel>(
      init: CategoriesViewModel(),

      builder: (controller)=> controller.loading.value ? Center(child: CircularProgressIndicator()) :Scaffold(


        backgroundColor: Constants.primaryColor,
        body: Container(
          child:Stack(

            children: [
              Positioned(
                right: 0.0,
                top: -20.0,
                child: Opacity(
                  opacity: 0.3,

                  child: Image.asset("assets/images/washing_machine_illustration.png"),

                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal:15.0,
                      vertical: 16.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap:(){ Get.back();
                          },
                          child: Icon(
                            FlutterIcons.keyboard_backspace_mdi,
                            color:Colors.white,

                          ),
                        ),
                        SizedBox(height: 20,),
                        Text("Choose",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                            color: Colors.white,
                          ),)
                      ],
                    ),

                  ) ,
                  SizedBox(height: 30.0,),
                  Expanded(child: Container(
                    width: size.height - (size.height/5),

                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40.0),
                          topRight: Radius.circular(40.0),
                        ),
                        color: Colors.white
                    ),
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                          children: [

                                  CardWidget(mName: 'oussema',mCardImage: controller.categoriesmodel[0].image,),
                            IconButton(
                              icon: new Icon(Icons.remove_circle_outline_outlined),
                              onPressed: (){
                                setState( () {
                                  if (x>0){
                                    x -=1;
                                    somme -=1;

                                  }
                                });

                              },
                            ),
                            Text('$x'),
                            IconButton(
                              icon: new Icon(Icons.add_circle_outline),
                              onPressed: (){
                                setState( () {
                                  x +=1;
                                  somme+=1;
                                });

                              },
                            ),




                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                          children: [

                            CardWidget(mName: 'oussema',mCardImage: controller.categoriesmodel[0].image,),
                            IconButton(
                              icon: new Icon(Icons.remove_circle_outline_outlined),
                              onPressed: (){
                                setState( () {
                                  if (x1>0){
                                    x1 -=1;
                                    somme-=1;


                                  }
                                });

                              },
                            ),
                            Text('$x1'),
                            IconButton(
                              icon: new Icon(Icons.add_circle_outline),
                              onPressed: (){
                                setState( () {
                                  x1 +=1;
                                  somme+=1;

                                });

                              },
                            ),




                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                          children: [

                            CardWidget(mName: 'oussema',mCardImage: controller.categoriesmodel[0].image,),
                            IconButton(
                              icon: new Icon(Icons.remove_circle_outline_outlined),
                              onPressed: (){
                                setState( () {
                                  if (x2>0){
                                    x2 -=1;
                                    somme-=1;


                                  }
                                });

                              },
                            ),
                            Text('$x2'),
                            IconButton(
                              icon: new Icon(Icons.add_circle_outline),
                              onPressed: (){
                                setState( () {
                                  x2 +=1;
                                  somme+=1;

                                });

                              },
                            ),





                          ],
                        ),
                        Row(
                          children: [
                            Text("Total : $somme"),

                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex:1,

                              child: RaisedButton(
                                child: Text("Validate",),

                                color: Constants.primaryColor,
                                onPressed: () {
                                  Get.to(Login());
                                },
                              ),
                            ),
                          ],
                        ),

                      ],

                    ),


                  ),
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
