import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.all(Radius.circular(6)),
        ),
        child: Text(
          generateCountryFlag() + ' +20',
          style: TextStyle(fontSize: 18, letterSpacing: 2.0),
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
    border: Border.all(color: Colors.lightBlue),
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

        backgroundColor: Colors.white,
        body: Form(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _BuildNumberField(),
            RaisedButton(child: Text('Next',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              )
              ,),
                color: Colors.black,

                onPressed: (){
              controller.verifyPhone(phone.text);
                  Get.to(OtpScreen());
                }
            ),
          ],

        ),
      ),


    ),
    );

  }
}
