import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:landryproject/presentation/login.dart';

class LoginController extends GetxController{
  var authState = ''.obs;
  String  verificationID = '' ;
  var auth= FirebaseAuth.instance;
  verifyPhone(String phone)async {
    await auth.verifyPhoneNumber(phoneNumber: phone,
      verificationCompleted: (PhoneAuthCredential credential) async {

        await auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
      Get.snackbar("error", "problem with send code");
       

        // Handle other errors
      },

      codeSent: (String verificationId,[int ? forceResent]) async {
        this.verificationID = verificationId;
        authState.value="login success";
        Get.snackbar("error", "problem with ent");

      },
      timeout: const Duration(seconds: 60),
      codeAutoRetrievalTimeout: (id) {
      this.verificationID = id ;
        // Auto-resolution timed out...
      },
    );
  }

  verifyOTP(String otp)async{
try{
  var credential = await auth.signInWithCredential(PhoneAuthProvider.credential(verificationId: this.verificationID, smsCode: otp));
  if (credential.user!=null){
    print('otp verified');
    Get.to(Login());
  }
}
catch(error){
  print(error);
}

  }

}