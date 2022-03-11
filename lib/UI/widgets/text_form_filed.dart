import 'package:flutter/material.dart';

import '../../constant/colors.dart';


class MyTextFormFieldWidget extends StatelessWidget {
  const MyTextFormFieldWidget({
    Key? key,
     this.controller,
    required this.type, required this.hint, this.icon, this.validation, this.onSave, this.min,
  }) : super(key: key);

  final TextEditingController? controller;
  final TextInputType type;
  final String hint;
  final Icon? icon;
  final String? Function(String?)? validation;
  final String? Function(String?)? onSave;
  final int? min;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: type,
      controller: controller,
      autofocus: false,
      cursorColor: grey,
      validator: validation,
      minLines: min,
      maxLines: null,
      onSaved: onSave,
      decoration: InputDecoration(
        hintText: hint,
        hoverColor: grey,
        focusColor: grey,
        fillColor: grey,
        contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0),borderSide: const BorderSide(color: grey)),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0),borderSide: const BorderSide(color: grey)),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0),borderSide: const BorderSide(color: grey)),
        prefixIcon: icon
      ),
    );
  }
}


class MyTextPassFormFieldWidget extends StatelessWidget {
  const MyTextPassFormFieldWidget({
    Key? key,
    required this.controller,
    required this.type, required this.hint, required this.icon, required this.suffix, this.validation, required this.isPassword,
  }) : super(key: key);

  final TextEditingController controller;
  final String? Function(String?)? validation;
  final TextInputType type;
  final String hint;
  final Icon icon;
  final IconButton suffix;
  final bool isPassword;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: type,
      controller: controller,
      autofocus: false,
      cursorColor: grey,
      validator: validation,
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: hint,
        suffixIcon: suffix,
        hoverColor: grey,
        focusColor: grey,
        fillColor: grey,
        contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0),borderSide: const BorderSide(color: grey)),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0),borderSide: const BorderSide(color: grey)),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0),borderSide: const BorderSide(color: grey)),
        prefixIcon: icon,
      ),
    );
  }
}

