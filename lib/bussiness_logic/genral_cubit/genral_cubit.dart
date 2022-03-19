import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../constant/colors.dart';


part 'genral_state.dart';

class GeneralCubit extends Cubit<GeneralState> {
  GeneralCubit() : super(GeneralInitial());

  static GeneralCubit get(context) => BlocProvider.of(context);

  bool pressed = false ;
  Icon favIcon = const Icon(Icons.favorite_outline ,color: Colors.grey,) ;

  void pressedFavorite (){
    pressed  = !pressed;
    favIcon = pressed ? Icon(Icons.favorite ,color: pink,) :Icon(Icons.favorite_outline ,color: Colors.grey,) ;
    emit(Pressed());
  }
  Icon suffix = const Icon(
    Icons.visibility_outlined,
    color: Colors.grey,
  );
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix = isPassword
        ? const Icon(
      Icons.visibility_outlined,
      color: Colors.grey,
    )
        : const Icon(
      Icons.visibility_off_outlined,
      color: Colors.grey,
    );
    emit(PasswordVisibility());
  }
  String dropDownValue = 'first year';

  void dropDown(String v) {
    dropDownValue = v;
    emit(DropDownMenu());
  }
}
