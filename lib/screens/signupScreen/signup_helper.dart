import 'package:ra7alah/utils/translation_key.dart';


class SignupHelper {
  SignupHelper._privateConstructor();

  static final SignupHelper instance = SignupHelper._privateConstructor();

  String? validateName(String? name) => validateEmptyField(name);

  String? validateEmail(String? email) {
    if (email != null) {
      if (email.isNotEmpty) {
        final notValid = isEmailNotValid(email);
        if (notValid) {
          return invalidEmail;
        }
      }
    }
    return null;
  }

  String? validateEmptyField(String? firName) {
    if (firName == null) {
      return requiredFiled;
    } else if (firName.isEmpty) {
      return requiredFiled;
    } else {
      return null;
    }
  }

  String? validatePassword(String? password) {
    if (password != null) {
      if (password.isNotEmpty) {
        final notValid = isPasswordNotValid(password);
        if (notValid) {
          return invalidPassword;
        }
      }
    }
    return null;
  }

  bool isPasswordNotValid(String password) {
    return !RegExp(
            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
        .hasMatch(password);
  }

  bool isEmailNotValid(String email) {
    return !RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }
}
