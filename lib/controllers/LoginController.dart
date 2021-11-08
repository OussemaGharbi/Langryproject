import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:landryproject/models/user_db.dart';
import 'package:landryproject/presentation/HomeScreen.dart';
import 'package:landryproject/presentation/Services.dart';

class LoginController extends GetxController {

  var isLoading = false.obs;
  var verId = '';
  var authStatus = ''.obs;
  var db = UserDb();

  var auth = FirebaseAuth.instance;

  verifyPhone(String phone) async {
    isLoading.value = true;
    await auth.verifyPhoneNumber(
        timeout: Duration(seconds: 50),
        phoneNumber: '+216$phone',
        verificationCompleted: (AuthCredential authCredential) {
          if (auth.currentUser != null) {
            isLoading.value = false;
            authStatus.value = "login successfully";
          }
        },
        verificationFailed: (authException) {
          Get.snackbar("sms code info", "otp code hasn't been sent!!");
        },
        codeSent: (String id,  forceResent) {
          isLoading.value = false;
          this.verId = id;
          authStatus.value = "login successfully";
        },
        codeAutoRetrievalTimeout: (String id) {
          this.verId = id;
        });
  }


  /////////
  otpVerify(String otp) async {
    isLoading.value = true;
    try {
      UserCredential userCredential = await auth.signInWithCredential(
          PhoneAuthProvider.credential(verificationId: this.verId, smsCode: otp)
      );
      if (userCredential.user != null) {
        isLoading.value = false;
        db.AddNewUser(userCredential.user.phoneNumber);

        Get.off(ServicesScreen());

      }
    } on Exception catch (e) {
      Get.snackbar("otp info", "otp code is not correct !!");
    }
  }
}