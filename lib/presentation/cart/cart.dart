import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:landryproject/models/ProductModel.dart';
import 'package:landryproject/models/card_model.dart';



class CartScreen extends StatelessWidget {
   final String productName =CardModel().name;
   final String productImage =CardModel().image;
   final int? productPrice =CardModel().price;




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(20),
              child: ListView.separated(
                itemCount: 1 ,

                itemBuilder: (context, index) {
                  return Container(
                    height: 140,

                    child: Row(
                      children: [

                        Container(height: 100,
                          width: 100,

                          child: Image.network(productImage,
                          fit: BoxFit.fill,),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: Column(
                            children: [
                              Text(productName,style: TextStyle(
                                fontSize: 21,
                              ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text("${productPrice.toString()} Dt",style: TextStyle(
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


                  onPressed: () {},
                  icon: Icon(Icons.save),
                  label: Text("Save"),
                ),
              ),
            ],

          ),
        ],
      ),
    );
  }
}
