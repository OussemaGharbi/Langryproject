import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:landryproject/controllers/LoginController.dart';
import 'package:landryproject/presentation/ProfileScreen.dart';
import 'package:landryproject/presentation/login.dart';



class HomeScreen extends StatelessWidget {

  final LoginController loginController = Get.find();
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(loginController.authStatus()),
              TextButton(
                  onPressed: () {
                    Get.to(ProfileView());
                  },
                  child: Icon(Icons.person_add_alt, size: 50,))
            ],
          )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()async{
          await auth.signOut();
          if(auth.currentUser == null) {
            Get.to(Login());
          }
        },
        child: Icon(Icons.logout),
      ),
    );
  }
}