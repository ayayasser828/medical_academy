
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:medical_academy/constant/strings.dart';

import '../../controls/control_flow.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      Navigator.push(context, MaterialPageRoute(builder: (_) => const ControlFlow()));
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xff231f20),
      body: Center(
        child: Image.asset(
          'assets/images/bg.jpeg',
          fit: BoxFit.fill,
          //height: height,
        ),
      ),
    );
  }
}
