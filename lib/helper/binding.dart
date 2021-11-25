import 'package:get/get.dart';
import 'package:landryproject/controllers/Card_viewModel.dart';
import 'package:landryproject/controllers/HomeController.dart';
import 'package:landryproject/models/CategoriesViewModel.dart';

class Binding extends Bindings{


  @override
  void dependencies() {
    Get.lazyPut(() => CategoriesViewModel());
    Get.lazyPut(() => CardViewModel());
    Get.lazyPut(() => HomeController());

  }

}