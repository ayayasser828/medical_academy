
import 'package:flutter/material.dart';
import 'package:medical_academy/constant/colors.dart';

Widget sessions(BuildContext context,String name,int index){
  var width = MediaQuery.of(context).size.width;
  var height = MediaQuery.of(context).size.height;
  return SizedBox(
    width: width*0.8,
    height: height*0.12,
    child: Card(
      elevation: 2.0,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: width*0.25,
            height: height*0.12,
            decoration: BoxDecoration(
              gradient: buttonGradient,
              borderRadius: BorderRadius.circular(15)
            ),
            child: Center(child: Text(index.toString(),style: TextStyle(
              color: white,
              fontSize: 50
            ),)),
          ),
          SizedBox(width: width*0.03,),
          Padding(
            padding: const EdgeInsets.only(bottom: 15.0),
            child: Text(
              name,
              style: TextStyle(color: blue,fontSize: 28,fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(width: width*0.2,),
          Icon(Icons.arrow_forward_ios,color: blue,size: 40,)
        ],
      ),
    ),
  );
}