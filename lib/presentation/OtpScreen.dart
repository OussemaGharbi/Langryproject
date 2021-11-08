import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:landryproject/constants/constants.dart';
import 'package:landryproject/controllers/LoginController.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpScreen extends StatelessWidget {
final otp = TextEditingController();
 String otpCode = '' ;
 LoginController controller = Get.find();


void showProgressIndicator(BuildContext context) {
  AlertDialog alertDialog = AlertDialog(
    backgroundColor: Colors.transparent,
    elevation: 0,
    content: Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
      ),
    ),
  );

  showDialog(
    barrierColor: Colors.white.withOpacity(0),
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return alertDialog;
    },
  );
}



  @override
  Widget build(BuildContext context) {
    return Scaffold(


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
    child:  Center(
            child: PinCodeTextField(

              controller: otp,
              length: 6,
              obscureText: false,
        appContext: context,
        autoFocus: true,
        cursorColor: Colors.black,
        keyboardType: TextInputType.number,
        animationType: AnimationType.scale,
        pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(5),
        fieldHeight: 50,
        fieldWidth: 40,
        borderWidth: 1,

            ), onChanged: (String value) {
                print(value);
            },
              onCompleted: (submitedCode) {
                otp.text = submitedCode;
                print("Completed");
                print(otp.text);
                controller.otpVerify(otp.text);
              },

        ),
          ),
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
