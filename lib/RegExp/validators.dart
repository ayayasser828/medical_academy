// import 'package:legalx/widgets/components/AppTextFields/app_text_fields.dart';

import 'package:queen_validators/queen_validators.dart';

import 'app_reg_exp.dart';
import 'validation_error_msgs.dart';

class AppValidators {
  static String? Function(String?) validateName({
    bool isRequired = true,
    int? uniqueMaxCount,
  }) {
    List<TextValidationRule> validatorsList = [
      const IsRequired(ValidationErrorMsgs.NameErrorMsgReq),
      const MinLength(1, ValidationErrorMsgs.NameErrorMsgLength),
      MaxLength(uniqueMaxCount ?? 75,
          ValidationErrorMsgs.getMaxLengthErrorMsg(uniqueMaxCount ?? 75)),
    ];

    if (!isRequired) {
      validatorsList = [
        MaxLength(uniqueMaxCount ?? 75, ValidationErrorMsgs.maxLengthErrorMsg),
      ];
    }
    validatorsList.add(RegExpRule(
        AppRegExp.userRegExp(), ValidationErrorMsgs.NameErrorMsgRGX));
    return qValidator(validatorsList);
  }
  //
  // static String? Function(String?) validateTitlesOrLabels(
  //     {bool isRequired = true, int? uniqueMaxCount, Lang? labelLang}) {
  //   List<TextValidationRule> validatorsList = [
  //     MaxLength(uniqueMaxCount ?? 150, ValidationErrorMsgs.maxLengthErrorMsg),
  //   ];
  //   if (isRequired) {
  //     validatorsList.addAll([
  //       IsRequired(ValidationErrorMsgs.titlesOrLabels),
  //       MinLength(1, ValidationErrorMsgs.titlesOrLabels),
  //       RegExpRule(
  //           AppRegExp.titleOrLabelsExp(), ValidationErrorMsgs.titlesOrLabels),
  //     ]);
  //   }
  //
  //   if (labelLang != null) {
  //     RegExpRule? regLang = _getRegExpLang(labelLang);
  //     if (regLang != null) validatorsList.add(regLang);
  //   }
  //   return qValidator(validatorsList);
  // }

  // static RegExpRule? _getRegExpLang(Lang lang) {
  //   switch (lang) {
  //     case Lang.ARABIC:
  //       {
  //         return RegExpRule(AppRegExp.onlyArabicAllowed(), 'اللغة العربية فقط');
  //         // statements;
  //       }
  //
  //     case Lang.ENGLISH:
  //       {
  //         return RegExpRule(
  //             AppRegExp.onlyEngAllowed(), 'اللغة الانجليزية فقط'); //statements;
  //       }
  //
  //     default:
  //       {
  //         return null; //statements;
  //       }
  //   }
  // }

  static String? Function(String?) validateUserName() {
    return qValidator([
      const IsRequired(ValidationErrorMsgs.userNameErrorMsgReq),
      const MinLength(1, ValidationErrorMsgs.userNameErrorMsgLength),
      const MaxLength(50, ValidationErrorMsgs.maxLengthErrorMsg),
      RegExpRule(
          AppRegExp.titleOrLabelsExp(), ValidationErrorMsgs.userNameErrorMsgRGX)
    ]);
  }

  static String? Function(String?) validatePassWord() {
    return qValidator([
      const IsRequired(ValidationErrorMsgs.passwordErrorMsgReq),
      const MinLength(6, ValidationErrorMsgs.passwordErrorMsgLength),
      const MaxLength(50, ValidationErrorMsgs.maxLengthErrorMsg),
    ]);
  }

  static String? Function(String?) validateRPassWord(String password) {
    return qValidator([
      const IsRequired(ValidationErrorMsgs.passwordErrorMsgReq),
      Match(password, ValidationErrorMsgs.rPassWordValidateError),
    ]);
  }

  static String? Function(String?) validateEmail({bool isRequired = true}) {
    return qValidator([
      if (isRequired) const IsRequired(ValidationErrorMsgs.emailErrorMsgReq),

      RegExpRule(AppRegExp.emailRegExp(), ValidationErrorMsgs.emailErrorMsgRGX),
      // MinLength(1, AppStrings.passwordErrorMsgLength),
      const MaxLength(50, ValidationErrorMsgs.emailErrorMsgLength),
    ]);
  }

  static String? Function(String?) validateREmail(String email) {
    return (String? v) {
      if (v!.toLowerCase() != email.toLowerCase()) {
        return ValidationErrorMsgs.rEMailValidateError;
      } else {
        return null;
      }
    };
  }

  static String? Function(String?) validateNumber() {
    return qValidator([
      const IsRequired(ValidationErrorMsgs.numberErrorMsgReq),
      const MaxLength(4, ValidationErrorMsgs.numberErrorMsgReq),
      RegExpRule(
          AppRegExp.numberRegExp(), ValidationErrorMsgs.numberErrorMsgReq),
      RegExpRule(AppRegExp.positiveNumberRegExp(),
          ValidationErrorMsgs.numberErrorMsgReqForPositive),
    ]);
  }

  static String? Function(String?) validatePhone({bool isRequired = true}) {
    List<TextValidationRule> validatorsList = [
      const MaxLength(20, ValidationErrorMsgs.maxLengthErrorMsg),
      RegExpRule(AppRegExp.positiveNumberRegExp(),
          ValidationErrorMsgs.numberErrorMsgReqForPositive),
    ];
    if (isRequired) {
      validatorsList.add(
        const IsRequired(ValidationErrorMsgs.mobileErrorMsgReq),
      );
    }

    return qValidator(validatorsList);
  }

  static String? Function(String?) validateRPhone(String phone) {
    return qValidator([
      Match(phone, ValidationErrorMsgs.rMobileValidateError),
    ]);
  }

  static String? Function(String?) validateNID() {
    return qValidator([
      RegExpRule(AppRegExp.idRegExp(), ValidationErrorMsgs.nIDErrorMsgRGX),
    ]);
  }

  static String? Function(String?) validatePassPor() {
    return qValidator([
      RegExpRule(
          AppRegExp.passPorRegEXP(), ValidationErrorMsgs.passPorErrorMsgRGX),
    ]);
  }

  static String? Function(String?) validateAddress(
      {bool isRequired = true, int? maxCount}) {
    return qValidator([
      if (isRequired) const IsRequired(ValidationErrorMsgs.addressErrorMsg),
      const MinLength(10, ValidationErrorMsgs.addressErrorMsgLength),
      const MaxLength(200, ValidationErrorMsgs.addressErrorMsgLength),
    ]);
    // return qValidator([
    //   MaxLength(200, ValidationErrorMsgs.maxLengthErrorMsg),
    // ]);
  }
  static String? Function(String?) validateDOB(
      {bool isRequired = true, int? maxCount}) {
    return qValidator([
      if (isRequired) const IsRequired(ValidationErrorMsgs.addressDOB),
    ]);

  }
  static String? Function(String?) validatePinField(
      {bool isRequired = true, int? maxCount}) {
    return qValidator([
      if (isRequired) const IsRequired(ValidationErrorMsgs.pinCode),
    ]);

  }


  static String? Function(String?) validateLongMsg(
      {bool isRequired = true, int? maxCount}) {
    List<TextValidationRule> validatorsList = [
      IsRequired(ValidationErrorMsgs.briefErrorMsgLength),
      MaxLength(maxCount ?? 300, ValidationErrorMsgs.maxLengthErrorMsg),
    ];
    if (!isRequired) {
      validatorsList = [
        MaxLength(maxCount ?? 300, ValidationErrorMsgs.maxLengthErrorMsg),
      ];
    }

    return qValidator(validatorsList);
  }
}
