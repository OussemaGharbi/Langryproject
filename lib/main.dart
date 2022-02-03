import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

// Import the firebase_core plugin
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:landryproject/controllers/networkManagement/GetXNetworkManager.dart';
import 'package:landryproject/helper/binding.dart';
import 'package:landryproject/models/CategoriesViewModel.dart';
import 'package:landryproject/presentation/HomeScreen.dart';

import'package:landryproject/controllers/LoginController.dart';
import 'package:landryproject/presentation/cart/Success.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  _AppState createState() => _AppState();
}

class _AppState extends State<MyApp> {

  bool _initialized = false;
  bool _error = false;
  void initializeFlutterFire() async {
    try {
      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    } catch (e) {
      setState(() {
        _error = true;
      });
    }
  }
  @override
  void initState() {
    initializeFlutterFire();
  /*  Future.delayed(Duration(seconds: 2),(){
    Get.to(Home()
    );
    });*/
    super.initState();
  }


final loginController = Get.put(LoginController());
  final Categories = Get.put(CategoriesViewModel());



  @override
  Widget build(BuildContext context) {
    final GetXNetworkManager _networkManager = Get.put(GetXNetworkManager());

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: Binding(),


      home: Home(),
    );
  }
}