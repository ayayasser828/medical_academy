


import 'package:flutter/material.dart';

import '../../constant/colors.dart';


Widget defaultButton({
  double width = double.infinity,
  double height = double.minPositive,

  Color background = Colors.blue,
  bool isUpperCase = true,
  double radius = 3.0,
  required final Function()? function,
  required String text,
}) =>
    Container(
      width: width,
      height: height,
      child: TextButton(
        onPressed: function,
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: background,
      ),
    );

Widget bookingButton(
    context, {
      required String btnName,
      required Function? bookingPressed(),
      Color color = Colors.white,
    }) {
  return Container(
    width: MediaQuery.of(context).size.width * 0.4,
    height: MediaQuery.of(context).size.height * 0.05,
    decoration: BoxDecoration(
        color: textColor,
        borderRadius: const BorderRadius.only(
          bottomRight: Radius.circular(25),
          bottomLeft: Radius.circular(25),
          topRight:  Radius.circular(25),
          topLeft: Radius.circular(25),
        )),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextButton(
          onPressed: bookingPressed,
          child: Row(
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                btnName,
                style: TextStyle(
                    color: color,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
              Icon(
                Icons.arrow_forward_ios_outlined,
                size: 11,
                color: color,
              )
            ],
          ),
        )
      ],
    ),
  );
}

