import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medical_academy/bussiness_logic/auth/auth_cubit.dart';

import '../../RegExp/validators.dart';
import '../../bussiness_logic/genral_cubit/genral_cubit.dart';
import '../../constant/colors.dart';
import '../../constant/strings.dart';
import '../../constant/style.dart';
import '../../data/web_service/check_internet_connection.dart';
import '../widgets/button.dart';
import '../widgets/loading_indecator.dart';
import '../widgets/text_button.dart';
import '../widgets/text_form_filed.dart';

class AuthScreen extends StatefulWidget {
  AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final TextEditingController userName = TextEditingController();

  final TextEditingController password = TextEditingController();

  Future<void> secureScreen() async {
    await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  }

  @override
  void initState() {
    secureScreen();
    super.initState();
  }

  @override
  Future<void> dispose() async {
    super.dispose();
    await FlutterWindowManager.clearFlags(FlutterWindowManager.FLAG_SECURE);
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: black,
      body: Stack(
        children: [
          Center(
            child: Image.asset(
              'assets/images/bg3.jpg',
              fit: BoxFit.fill,
              height: height,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: Text(
                    "Medical Academy",
                    style: GoogleFonts.asset(color: blue,fontSize: 30)
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyButtonWidget(
                        btnTxt: 'Login',
                        btnWidth: width * 0.8,
                        btnHeight: height * 0.06,
                        onPressed: () => login(context)),
                    SizedBox(height: height * 0.02),
                    MyButtonWidget(
                        btnTxt: 'Register',
                        btnWidth: width * 0.8,
                        btnHeight: height * 0.06,
                        onPressed: () => register(context)),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  final GlobalKey<FormState> _formKey = GlobalKey();

  void login(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(25),
          ),
        ),
        isScrollControlled: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        context: context,
        builder: (builder) {
          return BlocProvider(
            create: (context) => GeneralCubit(),
            child: BlocConsumer<GeneralCubit, GeneralState>(
              listener: (context, state) {},
              builder: (context, state) {
                return BlocProvider(
                  create: (context) => AuthCubit(),
                  child: BlocConsumer<AuthCubit, AuthState>(
                    listener: (context, state) {
                      if (state is LoadingLogin) {
                        showLoadingIndicator();
                      }
                      if (state is LoginSuccess) {
                        Navigator.pushReplacementNamed(context, home);
                      }
                      if (state is LoginError) {
                        String errorMsg = (state).message;
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(errorMsg),
                            backgroundColor: Colors.black,
                            duration: const Duration(seconds: 5),
                          ),
                        );
                        // Navigator.pushReplacementNamed(context, signIn);
                      }
                    },
                    builder: (context, state) {
                      return Container(
                        height: height * 0.55,
                        color: Colors.transparent,
                        child: Container(
                          height: height,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(25.0),
                                  topRight: Radius.circular(25.0))),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Form(
                              key: _formKey,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: height * 0.01,
                                  ),
                                  Text(
                                    "Welcome Back",
                                    style: TextStyle(
                                      color: blue,
                                      fontSize: 28,
                                    ),
                                  ),
                                  SizedBox(
                                    height: height * 0.03,
                                  ),
                                  const Text(
                                    'User Name',
                                    style: textFieldName,
                                  ),
                                  SizedBox(
                                    height: height * 0.01,
                                  ),
                                  MyTextFormFieldWidget(
                                      controller: userName,
                                      type: TextInputType.name,
                                      hint: 'user name',
                                      icon: const Icon(
                                        Icons.phone_outlined,
                                        color: Colors.grey,
                                      )),
                                  SizedBox(
                                    height: height * 0.03,
                                  ),
                                  const Text(
                                    'Password',
                                    style: textFieldName,
                                  ),
                                  SizedBox(
                                    height: height * 0.01,
                                  ),
                                  MyTextPassFormFieldWidget(
                                    isPassword:
                                        BlocProvider.of<GeneralCubit>(context)
                                            .isPassword,
                                    controller: password,
                                    type: TextInputType.visiblePassword,
                                    validation:
                                        AppValidators.validatePassWord(),
                                    hint: 'Password',
                                    suffix: IconButton(
                                      onPressed: () {
                                        BlocProvider.of<GeneralCubit>(context)
                                            .changePasswordVisibility();
                                      },
                                      icon:
                                          BlocProvider.of<GeneralCubit>(context)
                                              .suffix,
                                    ),
                                    icon: const Icon(
                                      Icons.lock_outline,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  SizedBox(
                                    height: height * 0.05,
                                  ),
                                  MyButtonWidget(
                                      btnTxt: 'Login',
                                      btnWidth: width,
                                      btnHeight: height * 0.06,
                                      onPressed: () => _validate(context)),
                                  SizedBox(
                                    height: height * 0.02,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          );
        });
  }

  Future<void> _validate(BuildContext context) async {
    if (await checkInternetConnection()) {
      //first we check if there is internet connection
      if (!_formKey.currentState!.validate()) {
        return;
      } else {
        // Navigator.pop(context);
        BlocProvider.of<AuthCubit>(context)
            .login(userName.text.toString(), password.text.toString());
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No internet connection')),
      );
      // if we have missing internet connection
      //.. we pop up a message to the user to inform them that there is missing internet connection
    }
  }

  final TextEditingController phoneRegister = TextEditingController();

  final TextEditingController name = TextEditingController();

  final TextEditingController passwordRegister = TextEditingController();

  final TextEditingController passwordConfirm = TextEditingController();

  final GlobalKey<FormState> _registerFormKey = GlobalKey();

  void register(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(25),
          ),
        ),
        isScrollControlled: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        context: context,
        builder: (builder) {
          return BlocProvider(
            create: (context) => GeneralCubit(),
            child: BlocConsumer<GeneralCubit, GeneralState>(
              listener: (context, state) {},
              builder: (context, state) {
                return BlocProvider(
                  create: (context) => AuthCubit(),
                  child: BlocConsumer<AuthCubit, AuthState>(
                    listener: (context, state) {
                      if (state is LoadingRegister) {
                        showLoadingIndicator();
                      }

                      if (state is RegisterSuccess) {
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: const Text('Request sent'),
                            backgroundColor: blue,
                            duration: const Duration(seconds: 3),
                          ),
                        );
                      }

                      if (state is RegisterError) {
                        Navigator.pop(context);
                        String errorMsg = (state).message;
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(errorMsg),
                            backgroundColor: Colors.black,
                            duration: const Duration(seconds: 3),
                          ),
                        );
                      }
                    },
                    builder: (context, state) {
                      return Container(
                        height: height * 0.7,
                        color: Colors.transparent,
                        child: Container(
                          height: height,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(25.0),
                                  topRight: Radius.circular(25.0))),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Form(
                              key: _registerFormKey,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: height * 0.01,
                                  ),
                                  Text(
                                    "Send Request to Join",
                                    style: TextStyle(
                                      color: blue,
                                      fontSize: 28,
                                    ),
                                  ),
                                  SizedBox(
                                    height: height * 0.02,
                                  ),
                                  const Text(
                                    'Phone Number',
                                    style: textFieldName,
                                  ),
                                  SizedBox(
                                    height: height * 0.01,
                                  ),
                                  MyTextFormFieldWidget(
                                      type: TextInputType.name,
                                      hint: 'Your phone number',
                                      controller: phoneRegister,
                                      icon: const Icon(
                                        Icons.phone_outlined,
                                        color: Colors.grey,
                                      )),
                                  SizedBox(
                                    height: height * 0.02,
                                  ),
                                  const Text(
                                    'Name',
                                    style: textFieldName,
                                  ),
                                  SizedBox(
                                    height: height * 0.01,
                                  ),
                                  MyTextFormFieldWidget(
                                      type: TextInputType.name,
                                      hint: 'Name',
                                      controller: name,
                                      icon: const Icon(
                                        Icons.phone_outlined,
                                        color: Colors.grey,
                                      )),
                                  SizedBox(
                                    height: height * 0.02,
                                  ),
                                  const Text(
                                    'Password',
                                    style: textFieldName,
                                  ),
                                  SizedBox(
                                    height: height * 0.01,
                                  ),
                                  MyTextPassFormFieldWidget(
                                    isPassword:
                                        BlocProvider.of<GeneralCubit>(context)
                                            .isPassword,
                                    controller: passwordRegister,
                                    type: TextInputType.visiblePassword,
                                    validation:
                                        AppValidators.validatePassWord(),
                                    hint: 'Password',
                                    suffix: IconButton(
                                      onPressed: () {
                                        BlocProvider.of<GeneralCubit>(context)
                                            .changePasswordVisibility();
                                      },
                                      icon:
                                          BlocProvider.of<GeneralCubit>(context)
                                              .suffix,
                                    ),
                                    icon: const Icon(
                                      Icons.lock_outline,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  SizedBox(
                                    height: height * 0.02,
                                  ),
                                  const Text(
                                    'Confirm Password',
                                    style: textFieldName,
                                  ),
                                  SizedBox(
                                    height: height * 0.01,
                                  ),
                                  MyTextPassFormFieldWidget(
                                    isPassword:
                                        BlocProvider.of<GeneralCubit>(context)
                                            .isPassword,
                                    controller: passwordConfirm,
                                    type: TextInputType.visiblePassword,
                                    validation:
                                        AppValidators.validatePassWord(),
                                    hint: 'Confirm Password',
                                    suffix: IconButton(
                                      onPressed: () {
                                        BlocProvider.of<GeneralCubit>(context)
                                            .changePasswordVisibility();
                                      },
                                      icon:
                                          BlocProvider.of<GeneralCubit>(context)
                                              .suffix,
                                    ),
                                    icon: const Icon(
                                      Icons.lock_outline,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  SizedBox(
                                    height: height * 0.03,
                                  ),
                                  MyButtonWidget(
                                      btnTxt: 'Register',
                                      btnWidth: width,
                                      btnHeight: height * 0.06,
                                      onPressed: () =>
                                          _validateRegister(context)),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          );
        });
  }

  Future<void> _validateRegister(BuildContext context) async {
    if (await checkInternetConnection()) {
      //first we check if there is internet connection
      if (!_registerFormKey.currentState!.validate()) {
        return;
      } else {
        // Navigator.pop(context);
        BlocProvider.of<AuthCubit>(context).register(
            name.text.toString(),
            phoneRegister.text.toString(),
            passwordRegister.text.toString(),
            passwordConfirm.text.toString());
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No internet connection')),
      );
      // if we have missing internet connection
      //.. we pop up a message to the user to inform them that there is missing internet connection
    }
  }
}
