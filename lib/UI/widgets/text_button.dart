
import 'package:flutter/material.dart';

import '../../constant/colors.dart';
import '../../constant/style.dart';


class MyButtonWidget extends StatelessWidget {
  const MyButtonWidget({
    Key? key,
    required this.btnTxt,
    required this.btnWidth,
    required this.btnHeight,
    required this.onPressed,
  }) : super(key: key);

  final String btnTxt;
  final double btnWidth;
  final double btnHeight;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: btnWidth,
        height: btnHeight,
        decoration: BoxDecoration(
          gradient: buttonGradient,
          borderRadius: BorderRadius.circular(10)
        ),
        child: Center(child: Text(btnTxt,style: buttonText,),),
      ),
    );
  }
}
