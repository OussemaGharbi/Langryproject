import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class InternetConnectivity extends StatelessWidget {
  const InternetConnectivity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      alignment: Alignment.center,
      child: Lottie.asset("assets/noInternet.json"),
    );
  }
}
