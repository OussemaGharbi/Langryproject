import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:landryproject/constants/constants.dart';
import 'package:landryproject/controllers/LoginController.dart';
import 'package:landryproject/presentation/OtpScreen.dart';



class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);
  LoginController controller = Get.find();

  late String ? _phonenumber;
  final GlobalKey<FormState> _formkey = new GlobalKey<FormState>();
  final phone = TextEditingController();

  String generateCountryFlag() {
    String countryCode = 'tn';

    String flag = countryCode.toUpperCase().replaceAllMapped(RegExp(r'[A-Z]'),
            (match) => String.fromCharCode(match.group(0)!.codeUnitAt(0) + 127397));

    return flag;
  }


  Widget _BuildNumberField(){
    return Row(
      children: [
      Expanded(
      flex: 1,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 16),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.all(Radius.circular(6)),
        ),
        child: Text(
          generateCountryFlag() + ' +216',
          style: TextStyle(fontSize: 15, letterSpacing: 1.0),
        ),
      ),
    ),
    SizedBox(
    width: 16,
    ),
    Expanded(
    flex: 3,
    child: Container(
    width: double.infinity,
    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 2),
    decoration: BoxDecoration(
    border: Border.all(color: Colors.black),
    borderRadius: BorderRadius.all(Radius.circular(6)),
    ),
    child: TextFormField(
      controller: phone,
        keyboardType: TextInputType.phone,

        decoration: InputDecoration(


            labelText: 'Phone Number..'
        ),
        validator: (String ? value){
          if(value!.isEmpty){
            return "Phone number is required";
          }
          if(value.length != 8){
            return "Phone number must have 8 degits";
          }
        },
        onSaved: (String ? value){
          this._phonenumber= value ;

        }
    ),
    ),
    ),
],
    );

  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(

        child: Scaffold(


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
                        Text("login",
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
                    width: double.infinity,

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40.0),
                        topRight: Radius.circular(40.0),
                      ),
                      color: Colors.white
                    ),
                    padding: EdgeInsets.all(20.0),
                    child: Form(
                      key: _formkey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _BuildNumberField(),
                          SizedBox(height:12.0),
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: RaisedButton(child: Text('Next',

                                  style: TextStyle(

                                    fontSize: 16,
                                    color: Colors.white,
                                  )
                                  ,),
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
                                    color: Constants.primaryColor,

                                    onPressed: (){
                                      if (_formkey.currentState!.validate()) {
                                        controller.verifyPhone(phone.text);
                                        Get.to(OtpScreen());
                                      }
                                    }
                                ),
                              ),
                            ],
                          ),

                        ],

                      ),
                    ) ,

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
