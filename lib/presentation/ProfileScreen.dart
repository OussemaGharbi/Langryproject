import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:landryproject/controllers/LoginController.dart';
import 'package:landryproject/presentation/login.dart';
class ProfileView extends StatelessWidget {
  final name = TextEditingController();
  final age = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: Text('Profile Screen'),
        ),
        body: ListView(children: [
          new Column(
            children: [
              Form(
                  child: Column(
                    children: [
                      Container(
                          child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 10.0),
                              child:Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextFormField(
                                    controller: name,
                                    keyboardType: TextInputType.name,
                                    decoration:
                                    InputDecoration(labelText: 'user name'),
                                  ),

                                  TextFormField(
                                    controller: age,
                                    keyboardType: TextInputType.text,
                                    decoration:
                                    InputDecoration(labelText: 'user age'),
                                  ),
                                ],
                              )
                          )),
                      GetBuilder<LoginController>(
                        init: LoginController(),
                        builder:(controller)=> Container(
                            margin: EdgeInsets.only(top: 40, bottom: 5),
                            child: Padding(
                                padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                                child: ElevatedButton(
                                  onPressed: ()  {
                                    controller.signOut();
                                    Get.offAll(Login());

                                  },
                                  child: Container(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 15.0,
                                        horizontal: 15.0,
                                      ),
                                      child: new Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: <Widget>[
                                          Expanded(
                                              child: Text(
                                                "update",
                                                textAlign: TextAlign.center,
                                              )),
                                        ],
                                      )),
                                )
                            )),
                      ),
                    ],
                  ))
            ],
          )
        ]));
  }
}