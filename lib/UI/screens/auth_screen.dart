import 'package:awesome_dialog/awesome_dialog.dart';
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
              'assets/images/login.PNG',
              fit: BoxFit.fill,
              height: height,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
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
                SizedBox(
                  height: height * 0.05,
                ),
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
                        AwesomeDialog(
                            context: context,
                            dialogType: DialogType.ERROR,
                            animType: AnimType.RIGHSLIDE,
                            headerAnimationLoop: true,
                            title: 'Error',
                            desc: 'user name or password is incorrect',
                            btnOkOnPress: () {},
                            btnOkIcon: Icons.cancel,
                            btnOkColor: Colors.red)
                            .show();
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
                                    'Phone Number',
                                    style: textFieldName,
                                  ),
                                  SizedBox(
                                    height: height * 0.01,
                                  ),
                                  MyTextFormFieldWidget(
                                      controller: userName,
                                      type: TextInputType.phone,
                                      hint: 'Phone Number',
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

  final TextEditingController email = TextEditingController();

  final TextEditingController year = TextEditingController();

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
                        AwesomeDialog(
                            context: context,
                            animType: AnimType.LEFTSLIDE,
                            headerAnimationLoop: false,
                            dialogType: DialogType.SUCCES,
                            showCloseIcon: true,
                            title: 'Succes',
                            desc: 'Your request has been send',
                            btnOkOnPress: () {
                              debugPrint('OnClcik');
                            },
                            btnOkIcon: Icons.check_circle,
                            onDissmissCallback: (type) {
                              debugPrint('Dialog Dissmiss from callback $type');
                            })
                            .show();
                      }
                      if (state is RegisterError) {
                        AwesomeDialog(
                            context: context,
                            dialogType: DialogType.ERROR,
                            animType: AnimType.RIGHSLIDE,
                            headerAnimationLoop: true,
                            title: 'Error',
                            desc: 'something error please try again',
                            btnOkOnPress: () {},
                            btnOkIcon: Icons.cancel,
                            btnOkColor: Colors.red)
                            .show();
                      }
                    },
                    builder: (context, state) {
                      return Container(
                        height: height * 0.72,
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
                              child: ListView(
                                children: [
                                  Column(
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
                                        'Name in arabic',
                                        style: textFieldName,
                                      ),
                                      SizedBox(
                                        height: height * 0.01,
                                      ),
                                      MyTextFormFieldWidget(
                                          type: TextInputType.name,
                                          hint: 'Name in arabic',
                                          controller: name,
                                          icon: const Icon(
                                            Icons.person,
                                            color: Colors.grey,
                                          )),
                                      SizedBox(
                                        height: height * 0.01,
                                      ),
                                      const Text(
                                        'Phone Number',
                                        style: textFieldName,
                                      ),
                                      SizedBox(
                                        height: height * 0.01,
                                      ),
                                      MyTextFormFieldWidget(
                                          type: TextInputType.phone,
                                          hint: 'Your Phone Number',
                                          controller: phoneRegister,
                                          icon: const Icon(
                                            Icons.phone_outlined,
                                            color: Colors.grey,
                                          )),
                                      SizedBox(
                                        height: height * 0.01,
                                      ),
                                      const Text(
                                        'Year',
                                        style: textFieldName,
                                      ),
                                      SizedBox(
                                        height: height * 0.01,
                                      ),
                                      MyTextFormFieldWidget(
                                          type: TextInputType.emailAddress,
                                          hint: 'Year',
                                          controller: year,
                                          icon: const Icon(
                                            Icons.calendar_today,
                                            color: Colors.grey,
                                          )),
                                      SizedBox(
                                        height: height * 0.01,
                                      ),
                                      const Text(
                                        'Email',
                                        style: textFieldName,
                                      ),
                                      SizedBox(
                                        height: height * 0.01,
                                      ),
                                      MyTextFormFieldWidget(
                                          type: TextInputType.emailAddress,
                                          hint: 'Email',
                                          controller: email,
                                          icon: const Icon(
                                            Icons.email,
                                            color: Colors.grey,
                                          )),
                                      SizedBox(
                                        height: height * 0.01,
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
                                        height: height * 0.01,
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
                                        height: height * 0.02,
                                      ),
                                      MyButtonWidget(
                                          btnTxt: 'Register',
                                          btnWidth: width,
                                          btnHeight: height * 0.06,
                                          onPressed: () =>
                                              _validateRegister(context)),
                                    ],
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
            passwordConfirm.text.toString(),
            year.text.toString(),
            email.text.toString(),
        );
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
