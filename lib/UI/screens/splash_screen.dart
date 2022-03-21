import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_academy/bussiness_logic/auth/delete_token_cubit.dart';
import 'package:medical_academy/constant/global_variables.dart';
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
    print(prefs.getString('token'));
    Timer(const Duration(seconds: 3), () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (_) => BlocProvider(
                    create: (context) => DeleteTokenCubit(),
                    child: const ControlFlow(),
                  )),
            (Route<dynamic> route) => false,
      );
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
