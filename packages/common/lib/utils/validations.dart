import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Validation {
  RegExp regEmail = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
  );

  String? validateEmail(String? value, BuildContext context) {
    if (value!.isEmpty) {
      return 'Please enter email address';
    } else if (!regEmail.hasMatch(value)) {
      return 'Please enter valid email';
    }

    return null;
  }

  String? validateWithEmptyFieldEmail(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return null; // No validation error for empty field
    } else if (!regEmail.hasMatch(value)) {
      return 'Please enter a valid email';
    }

    return null;
  }

  String? validateName(String? value, BuildContext context) {
    if (value != null && value.trim().isEmpty) {
      return 'Please enter your name';
    }

    return null;
  }

  String? validateFaceBook(String value) {
    // Allowing URLs without a specified protocol
    String pattern =
        r'^(?:(?:http|https):\/\/)?(?:www.)?facebook.com\/(?:(?:\w)*#!\/)?(?:pages\/)?(?:[?\w\-]*\/)?(?:profile.php\?id=(?=\d.*))?([\w\-]*)?';
    RegExp regExp = new RegExp(pattern);

    if (value.isEmpty) {
      return null;
    } else if (!regExp.hasMatch(value)) {
      return 'Please enter a valid URL';
    }

    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    } else if (value.length < 8 || value.length > 32) {
      return 'Password must be between 8 and 32 characters long';
    } else if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'Password must contain at least one capital letter';
    } else if (!value.contains(RegExp(r'[!@#\$%^&*()]'))) {
      return 'Password must contain at least one special character';
    }
    return null;
  }

  String? validateCurrentPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your current password';
    } else if (value.length < 8 || value.length > 32) {
      return 'Password must be between 8 and 32 characters long';
    } else if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'Password must contain at least one capital letter';
    } else if (!value.contains(RegExp(r'[!@#\$%^&*()]'))) {
      return 'Password must contain at least one special character';
    }
    return null;
  }

  String? validateConfirmPassword(String? password, String? confirmPassword) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return 'Please enter a confirm password';
    } else if (password != confirmPassword) {
      return 'Passwords do not match';
    } else {
      // You can reuse the validatePassword function to check if the confirmPassword meets the same criteria.
      String? passwordValidationResult = validatePassword(confirmPassword);
      if (passwordValidationResult != null) {
        return passwordValidationResult;
      }
    }
    return null;
  }

  String? validateOTP(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter the OTP';
    } else if (value.length != 6) {
      return 'OTP must be a 6-digit code';
    } else if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      return 'OTP must consist of digits only';
    }
    return null;
  }

  String? validateEmptyFields(String? value, String validationText) {
    if ((value ?? '').isEmpty) {
      return validationText;
    }
    return null;
  }

  String? validateEmptyFieldsWithoutSpace(String? value, String validationText,
      {bool? isLengthCheck, bool? checkIsEmpty}) {
    if (checkIsEmpty == true) {
      if (value != null) {
        if (value.length > 0) {
          return validationText;
        }
      }
    } else {
      if ((value?.trim() ?? '').isEmpty) {
        return validationText;
      }
    }

    if (isLengthCheck == true) {
      if (value!.trim().length > 50) {
        return 'The title should be 50 character';
      }
    }
    return null;
  }

  String? validateForMonth(String? value) {
    var year =
        '${DateTime.now().year.toString()[2].toString()}${DateTime.now().year.toString()[3].toString()}';

    if ((value?.trim() ?? '').isEmpty) {
      return 'Please enter card expiry date';
    } else if ((value?.trim() ?? '').length < 2) {
      return "";
    } else if (int.parse(value?.split('/').first.toString().trim() ?? "") >
        12) {
      return 'Please enter valid expiry date';
    } else if (int.parse(value?.split('/').last.toString().trim() ?? "") <
        int.parse(year)) {
      return 'Please enter valid expiry date';
    }
    return null;
  }
}
