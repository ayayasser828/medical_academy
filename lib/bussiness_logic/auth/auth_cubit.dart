import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../constant/end_points.dart';
import '../../constant/global_variables.dart';
import '../../data/models/login_error_model.dart';
import '../../data/models/login_model.dart';
import '../../data/models/register_error_model.dart';
import '../../data/models/register_success_model.dart';
import '../../helpers/dio_helper.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  RegisterSuccessModel registerModel = RegisterSuccessModel();
  RegisterErrorModel registerErrorModel = RegisterErrorModel();
  String? message;

  RegisterSuccessModel? register(String userName, String phone, String pass,String cPass,String year,String email,String id) {
    DioHelper.postData(url: registerURL, data: {
      'name': userName.toString(),
      'email': email.toString(),
      'password': pass.toString(),
      'device_name': id.toString(),
      'password_confirmation': cPass.toString(),
      'mobile': phone.toString(),
      'year': year.toString()
    }).then((value) {
      emit(LoadingRegister());
      print("response ${value.data}");
      if (value.statusCode! == 422) {
        //errorModel = LoginErrorModel.fromJson(value.data["message"]);
        message = value.data["message"];
        emit(RegisterError(message: message.toString()));
      } else {
        registerModel = RegisterSuccessModel.fromJson(value.data);
        emit(RegisterSuccess(registerModel));
        print(value.data.toString());
      }
    }).catchError((error) {
      print(error.toString());
      emit(RegisterError(message: error.toString()));
    });
  }

  LoginModel? loginModel;
  LoginErrorModel? errorModel;

  void login(String phone, String pass,String id) async {
    DioHelper.postData(url: loginURL, data: {
      'username': phone.toString(),
      'password': pass.toString(),
      'device_name': id.toString()
    }).then((value) {
      print("response ${value.toString()}");
      emit(LoadingLogin());
      if (value.statusCode! == 401 || value.statusCode! == 403) {
        errorModel = LoginErrorModel.fromJson(value.data);
        emit(LoginError(message: errorModel!.message!));
      }
      if (value.statusCode == 200) {
        loginModel = LoginModel.fromJson(value.data);
        emit(LoginSuccess());
        prefs.setString('token', loginModel!.token!);
        prefs.setBool("ISLOGGED", true);
        print(value.data.toString());
      }
    }).catchError((error) {
      print(error.toString());
      emit(LoginError(message: error.toString()));
    });
  }
}
