import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:landryproject/controllers/Card_viewModel.dart';
import 'package:landryproject/presentation/Home.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: GetBuilder<CardViewModel>(

          builder:(controller)=> Column(
            children: [
              SvgPicture.network("https://firebasestorage.googleapis.com/v0/b/landryapp-69637.appspot.com/o/undraw_order_confirmed_re_g0if.svg?alt=media&token=b879548c-7456-4044-b3dc-bdc7fed47f3b"),

              ElevatedButton(onPressed: (){
                controller.resetAll();
                
                Get.offAll(HomeScreen());


              },
                  child: Text('Go home')
              ),
            ],
          ),
        )
      ),
    );
  }
}
