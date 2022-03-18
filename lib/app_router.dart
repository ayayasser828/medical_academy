import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_academy/UI/screens/auth_screen.dart';
import 'package:medical_academy/UI/screens/course_details_screen.dart';
import 'package:medical_academy/UI/screens/home_screen.dart';
import 'package:medical_academy/UI/screens/session_screen.dart';
import 'package:medical_academy/bussiness_logic/auth/delete_token_cubit.dart';
import 'package:medical_academy/bussiness_logic/courses/courses_cubit.dart';
import 'package:medical_academy/bussiness_logic/send_request_cubit.dart';
import 'package:medical_academy/constant/strings.dart';

import 'UI/screens/splash_screen.dart';

class AppRouter {
  Route? generateRouts(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case auth:
        return MaterialPageRoute(builder: (_) => AuthScreen());
      case home:
        return MaterialPageRoute(builder: (_) =>
            MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => CoursesCubit(),
                ),
                BlocProvider(
                  create: (context) => DeleteTokenCubit(),
                ),
              ],
              child: const HomeScreen(),
            ));
      case course:
        final id = settings.arguments;
        return MaterialPageRoute(builder: (_) =>
            MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => CoursesCubit(),
                ),
                BlocProvider(
                  create: (context) => SendRequestCubit(),
                ),
              ],
              child: CourseDetailsScreen(id: id),
            ));
    }
  }
}