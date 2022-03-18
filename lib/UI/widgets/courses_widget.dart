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
    child: Card(
      elevation: 5.0,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Container(
        height: height * 0.35,
        width: width * 0.8,
        decoration:
            BoxDecoration(color: white, borderRadius: BorderRadius.circular(15),border: Border.all(color: blue,width: 2)),
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
              const SizedBox(height: 2,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    name + ' -- ',
                    style: GoogleFonts.abhayaLibre(color: blue, fontSize: 22,fontWeight: FontWeight.bold),
                  ),
                  Expanded(
                    child: Text(
                      instructor,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      softWrap: false,
                      style: GoogleFonts.abhayaLibre(color: blue, fontSize: 22,fontWeight: FontWeight.bold),
                    ),
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
    ),
  );
}
