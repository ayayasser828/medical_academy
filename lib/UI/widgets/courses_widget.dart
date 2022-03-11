import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medical_academy/constant/colors.dart';
import 'package:medical_academy/constant/strings.dart';

Widget coursesWidget(BuildContext context, String name, String description,
    String session, String instructor, String image,int id,String price) {
  var width = MediaQuery.of(context).size.width;
  var height = MediaQuery.of(context).size.height;
  return InkWell(
    onTap: () => Navigator.pushNamed(context, course,arguments: id),
    child: Container(
      height: height * 0.35,
      width: width * 0.8,
      decoration:
          BoxDecoration(color: white, borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: height * 0.2,
              width: width * 0.85,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
              ),
              child: Image.network(
                image,
                fit: BoxFit.fill,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  name + ' -- ',
                  style: GoogleFonts.pacifico(color: blue, fontSize: 22),
                ),
                Text(
                  instructor,
                  style: GoogleFonts.pacifico(color: blue, fontSize: 22),
                ),
              ],
            ),
            Expanded(
              child: Text(
                description,
                style: const TextStyle(color: Colors.grey, fontSize: 16),
              ),
            ),
            Expanded(
              child: RichText(
                text: TextSpan(
                  text: 'Sessions : ',
                  style: const TextStyle(color: Colors.grey, fontSize: 16),
                  children: <TextSpan>[
                    TextSpan(
                      text: session,
                      style: TextStyle(color: blue),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: RichText(
                text: TextSpan(
                  text: 'Price : ',
                  style: const TextStyle(color: Colors.grey, fontSize: 16),
                  children: <TextSpan>[
                    TextSpan(
                      text: price,
                      style: TextStyle(color: blue),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}