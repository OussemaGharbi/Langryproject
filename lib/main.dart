import 'package:flutter/material.dart';

// Import the firebase_core plugin
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:landryproject/controllers/Card_viewModel.dart';
import 'package:landryproject/helper/binding.dart';
import 'package:landryproject/models/CategoriesViewModel.dart';
import 'package:landryproject/presentation/Home.dart';
import 'package:landryproject/presentation/HomeScreen.dart';
import 'package:landryproject/presentation/Services.dart';
import 'package:landryproject/presentation/ServicesCategories.dart';
import 'package:landryproject/presentation/cart/cart.dart';
import 'package:landryproject/presentation/login.dart';
import'package:landryproject/controllers/LoginController.dart';
import 'package:landryproject/presentation/splashscreen.dart';

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
    } catch(e) {
      setState(() {
        _error = true;
      });
    }
  }
  @override
  void initState() {
    initializeFlutterFire();
    super.initState();
  }


final loginController = Get.put(LoginController());
  final Categories = Get.put(CategoriesViewModel());


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: Binding(),

      home: HomeScreen(),
    );
  }
}