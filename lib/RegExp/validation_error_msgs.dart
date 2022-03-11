class ValidationErrorMsgs {
  // names
  // static const String fNameErrorMsgReq = "من فضلك أدخل الاسم الاول";
  // static const String fNameErrorMsgLength =
  //     "من فضلك يجب أن يكون الاسم الاول 3 حروف أو أكثر";
  // static const String fNameErrorMsgRGX = "من فضلك أدخل الاسم الاول بشكل صحيح";
  //
  // static const String mNameErrorMsgReq = 'من فضلك أدخل الاسم الأب';
  // static const String mNameErrorMsgLength =
  //     "من فضلك يجب أن يكون اسم الأب 3 حروف أو أكثر";
  // static const String mNameErrorMsgRGX = "من فضلك أدخل الاسم الأب بشكل صحيح";

  static const String NameErrorMsgReq = 'من فضلك أدخل اسم الشخص';
  static const String NameErrorMsgLength =
      'من فضلك يجب أن يكون اسم الشخص 3 حروف أو أكثر';
  static const String NameErrorMsgRGX = 'يجب ان يكون الاسم احرف فقط';

  static const String userNameErrorMsgReq = 'من فضلك أدخل اسم المستخدم';
  static const String userNameErrorMsgLength =
      'من فضلك يجب أن يكون اسم المستخدم 3 حروف او ارقام او اكثر';
  static const String userNameErrorMsgRGX =
      'من فضلك أدخل اسم المستخدم بشكل صحيح';

  // passwords
  static const String passwordErrorMsgReq = 'من فضلك أدخل كلمة المرور';
  static const String passwordErrorMsgLength =
      'من فضلك يجب أن تكون كلمة المرور 8 حروف أوأرقام أو أكثر';
  static const String rPassWordValidateError =
      "الرجاء التأكد من  تطابق كلمة المرور";
  // static const String passwordErrorMsgRGX = 'من فضلك أدخل اسم المستخدم بشكل صحيح';

  // emails
  static const String emailErrorMsgReq = 'من فضلك أدخل البريد الالكتروني';
  static const String emailErrorMsgLength =
      'من فضلك يجب أن لا يتعدي البريد الالكتروني 50 حرف';
  static const String emailErrorMsgRGX =
      'من فضلك أدخل البريد الالكتروني بشكل صحيح';
  static const String rEMailValidateError =
      "الرجاء التأكد من  تطابق البريد الإلكتروني";

  // mobile
  static const String mobileErrorMsgReq = 'رجاء ملء بيانات المحمول بشكل صحيح';
  static const String mobileErrorMsgRGX = 'رجاء ملء بيانات المحمول بشكل صحيح';
  static const String rMobileValidateError =
      "الرجاء التأكد من  تطابق رقم المحمول";

  // mobile
  static const String numberErrorMsgReq = 'رجاء ملء الرقم بشكل صحيح';
  static const String numberErrorMsgReqForPositive = 'ارقام صحيحة فقط';
  static const String numberErrorMsgRGX = 'رجاء ملء الرقم بشكل صحيح';

  // titlesOrLabels
  static const String titlesOrLabels = 'يجب ملئ الحقل';

  static const String nIDErrorMsgRGX = 'من فضلك ادخل رقم البطاقة بشكل سليم';
  static const String passPorErrorMsgRGX =
      'من فضلك ادخل رقم جواز السفر بشكل سليم';

  static const String addressErrorMsgLength =
      'لا يمكن ان يكون العنوان اقل من 10 احرف';
  static const String addressErrorMsg =
      'من فضلك أدخل العنوان';
  static const String addressDOB =
      'من فضلك أدخل تاريخ الميلاد';
  static const String pinCode =
      "من فضلك ادخل كود التاكيد";
  static const String ignoredIdentify = "يرجى التأكد من رقم تحقيق الهوية";

  // static const String emptyFieldErrorMsg = "لا يمكنك ترك الحقل فارغ";

  static const String emptyMsgTitleErrorMsg = "من فضلك أدخل عنوان الرسالة";
  static const String emptyMsgBodyErrorMsg = "من فضلك أدخل الرسالة";

  static const String maxLengthErrorMsg = 'لقد تجاوزت الحد الاقصى لعدد الأحرف';
  static String getMaxLengthErrorMsg(int s) {
    return 'الحد الأقصى $s حرف';
  }

  static const String minPasswordCharacters =
      "   كلمة المرور يجب ان تكون 6 احرف على الاقل";
  static const String minNameCharacters =
      "  يجب ان يكون الاسم 3 احرف على الأقل";
  static const String weekPassword = "   كلمة المرور ضعيفة";
  static const String briefErrorMsgLength = "لا يمكنك ترك الحقل فارغ";
}
