import 'package:flutter/material.dart';
class CardWidget extends StatelessWidget {




  final String mName;
  final String mCardImage;
  const CardWidget({Key? key, required this.mName, required this.mCardImage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height - size.height/1.2,
      width: size.width - size.width/1.3,

      decoration: BoxDecoration(
        color: Colors.white,


        borderRadius: BorderRadius.circular(12.0),
        image: DecorationImage(
          image: NetworkImage(mCardImage),


        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 10,
            blurRadius: 5,
            offset: Offset(0, 7), // changes position of shadow
          ),
        ],

      ),

    );
  }
}

