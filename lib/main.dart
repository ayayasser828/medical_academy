import 'package:flutter/material.dart';
import 'package:medical_academy/app_router.dart';
import 'package:medical_academy/bussiness_logic/auth/delete_token_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'constant/global_variables.dart';
import 'helpers/dio_helper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefs =await SharedPreferences.getInstance();
  DioHelper.init();
  DeleteTokenCubit.init();
  runApp(MyApp(appRouter: AppRouter(),));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.appRouter}) : super(key: key);

  final AppRouter appRouter;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.generateRouts,
    );
  }
}
