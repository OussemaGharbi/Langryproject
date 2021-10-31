import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,

          body: Center(
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

    );


  }
}
