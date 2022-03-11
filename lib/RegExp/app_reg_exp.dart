class AppRegExp {
  static nameRegExp() {
    return RegExp(
      "(([\\u0621-\\u064A]|[a-zA-Z]){1,})+(([\\u0621-\\u064A ]|[a-zA-Z ])+)*\$",
      caseSensitive: false,
      multiLine: false,
    );
  }

  static userRegExp() {
    return RegExp(
      "(.*[^ ].*){1,}",
      caseSensitive: false,
      multiLine: false,
    );
  }

  static titleOrLabelsExp() {
    return RegExp(
      "(.*[^ ].*){1,}",
      caseSensitive: false,
      multiLine: false,
    );
  }

  static emailRegExp() {
    return RegExp(
      "^\$|^[A-z0-9][A-z0-9._%+-]+@[A-z0-9.-]+\.[A-z]{2,}\$",
      caseSensitive: false,
      multiLine: false,
    );
  }

  static numberRegExp() {
    return RegExp(
      "[0-9]",
      caseSensitive: false,
      multiLine: false,
    );
  }

  static positiveNumberRegExp() {
    return RegExp(
      "^[0-9]",
      caseSensitive: false,
      multiLine: false,
    );
  }

  static mobileRegExp() {
    return RegExp(
      "(01)${numberRegExp()}{9}",
      caseSensitive: false,
      multiLine: false,
    );
  }

  static idRegExp() {
    return RegExp(
      "^[0-9]{14}\$",
      caseSensitive: false,
      multiLine: false,
    );
  }

  static passPorRegEXP() {
    return RegExp(
      "^(?!^0+\$)[a-zA-Z0-9]{3,20}\$",
      caseSensitive: false,
      multiLine: false,
    );
  }

  static onlyArabicAllowed() {
    return RegExp(
      "^[\\u0621-\\u064A\\u0660-\\u0669 ]+\$",
      caseSensitive: false,
      multiLine: false,
    );
  }

  static onlyEngAllowed() {
    return RegExp(
      "^[A-Za-z0-9- ]*\$",
      caseSensitive: false,
      multiLine: false,
    );
  }
}
