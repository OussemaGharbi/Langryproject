
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:landryproject/constants/constants.dart';
import 'package:landryproject/presentation/ServicesCategories.dart';

class ServicesScreen extends StatefulWidget {
  const ServicesScreen({Key? key}) : super(key: key);

  @override
  _ServicesScreenState createState() => _ServicesScreenState();
}
Widget _buildCategory(){

  return Padding(

    padding: const EdgeInsets.all(2.0),
    child: Column(

      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),


            child:Container(

              width: 300,

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
                    color: Colors.cyan.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],

              ),

              child: Row(
                children: [
                  Image.asset("assets/images/laundry-machine.png",
            alignment: Alignment.topLeft,
            height: 150,
            width: 150,
             ),
                  Text("Publicité ..")
                ],
              ),
            ),
          ),

        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Services',
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
              ),
              ),


            ],
          ),
        ),
        SizedBox(height: 7,),

        Container(
          height: 200,
          width:double.infinity,
          decoration: BoxDecoration(

            color: Colors.white,

            boxShadow: [

            ],

          ),

          child: ListView(
            scrollDirection: Axis.horizontal,

            shrinkWrap: true,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  Column(


                    children: [
                      Card(
                        child: new InkWell(
                          onTap: (){
                            Get.to(ServicesCategories());

                          },

                          borderRadius: BorderRadius.circular(12),

                          child: Image.asset('assets/images/laundry-machine.png',


                            height: 150.0,
                            width: 150,),
                        )


                      ),
                      SizedBox(height: 2.0,),
                      Text('Ironing'),


                    ],
                  ),
                  SizedBox(width: 9.0,),

                  Column(


                    children: [
                      Card(
                          child: new InkWell(
                            onTap: (){

                            },

                            borderRadius: BorderRadius.circular(12),

                            child: Image.asset('assets/images/ironing.png',


                              height: 150.0,
                              width: 150,),
                          ),



                      ),
                      SizedBox(height: 2.0,),
                      Text('Ironing')


                    ],
                  ),
                  SizedBox(width: 9.0,),
                  Column(


                    children: [
                      Card(
                          child: new InkWell(
                            onTap: (){

                            },

                            borderRadius: BorderRadius.circular(12),

                            child: Image.asset('assets/images/laundry-machine.png',


                              height: 150.0,
                              width: 150,),
                          )


                      ),
                      SizedBox(height: 2.0,),
                      Text('Ironing')


                    ],
                  ),
                ],
              ),



            ],
          ),
        ),

      ],
    ),
  );
}



class _ServicesScreenState extends State<ServicesScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Center(child: Icon(Icons.home)),
          backgroundColor: Constants.primaryColor,
        ),
        body: Container(


            child:_buildCategory(),
        ),

      ),
    );
  }
}
