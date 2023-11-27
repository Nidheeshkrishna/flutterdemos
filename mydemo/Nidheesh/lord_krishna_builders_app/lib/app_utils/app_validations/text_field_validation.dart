import 'dart:developer' as dev;

import 'package:flutter/foundation.dart';

bool fieldsValidation({required validationKey}) {
  final isValid = validationKey.currentState!.validate();
  if (!isValid) {
    return false;
  }
  validationKey.currentState!.save();
  return isValid;
}

String? messageSetter(String text, String type) {
  switch (type) {
    case "Merchant Name":
      return validateName(text);

    case "Merchant Address":
      return validateAddress(text);
    case "Pan Card":
      return validatePanCard(text);
    case "Aadhaar Number":
      return validateAadharNumber(text);
    case "Email":
      return validateEmail(text);
    case "City":
      return validateCity(text);
    case "Pin Code":
      return validatePincode(text);

    case "Partner Email":
      return validateEmail(text);
    case "Organization Name":
      return validateAddress(text);

    case "Mobile Number":
      return validateMobile(text);

    case "Shop Name":
      return validateshopName(text);

    case "Shop Address":
      return validateAddress(text);
    case "Website":
      return validateWebsite(text);

    case "Contact Person Name":
      return validateName(text);

    case "Contact Number":
      return validateMobile(text);
    case "Contact Email":
      return validateEmail(text);
    case "State/City":
      return validateCity(text);

    case "Gst Number":
      return validateGSTNumber(text);
    case "Gst Number ":
      return textValidationGstEmpty(text, type);
    case "Cin":
      return textValidCin(text);
    case "Cin ":
      return textValidEmptyCin(text);
    case "Upload ID Proof":
      return textValidId(text, type);
    case "Shop Register Number":
      return textValidId(text, type);
    case "Shop Register Number ":
      return textValidEmptySrnNo(text, type);
    default:
      return textValidation(text, type);
  }
}

void printer(String value) {
  if (kDebugMode) {
    dev.log(value);
  }
}

String? textValidation(String value, String type) {
  if (value.trim().isEmpty) {
    return 'Please enter some text';
  }
  return null;
}

String? textValidationGstEmpty(String value, String type) {
  if (value.trim().isNotEmpty) {
    if (value.trim().isEmpty) {
      return 'Please enter Valid Gst';
    }
    if (value.trim().isNotEmpty &&
        !RegExp(r'^[0-9]{2}[A-Z]{5}[0-9]{4}[A-Z]{1}[1-9A-Z]{1}[Z]{1}[0-9A-Z]{1}$')
            .hasMatch(value)) {
      return 'Please enter a valid GST Number.';
    }
    return null;
  }

  return null;
}

String? textValidId(String value, String type) {
  if (value.trim().isNotEmpty) {
    if (value.trim().isEmpty) {
      return 'Please enter some text';
    }
  }

  return null;
}

String? textValidSrnNo(String value, String type) {
  if (value.trim().isEmpty) {
    return 'Please enter Shop Register Number';
  }

  return null;
}

String? textValidEmptySrnNo(String value, String type) {
  if (value.trim().isNotEmpty) {
    if (value.trim().isEmpty) {
      return 'Please enter Shop Register Number';
    }
  }

  return null;
}

String? textValidCin(String value) {
  if (value.trim().isEmpty) {
    return 'Please enter Cin';
  }
  if (!RegExp(
    r'^[A-Z]{1}\d{5}[A-Z]{2}\d{4}[A-Z]{3}\d{6}$',
  ).hasMatch(value.trim())) {
    return 'Please enter a Valid Cin';
  }
  return null;
}

String? textValidEmptyCin(String value) {
  if (value.trim().isNotEmpty) {
    if (value.trim().isEmpty) {
      return 'Please enter Cin';
    }

    if (!RegExp(
      r'^[A-Z]{1}\d{5}[A-Z]{2}\d{4}[A-Z]{3}\d{6}$',
    ).hasMatch(value.trim())) {
      return 'Please enter a Valid Cin';
    }
  }
  return null;
}

String? validateAddress(String value) {
  if (value.trim().isEmpty) {
    return 'Please enter Address';
  }
  // if (value.trim().length < 4) {
  //   return 'Organization Name must be at least 10 characters in length.';
  // }
  // Return null if the entered username is valid
  return null;
}

String? validateText(String value, String text) {
  if (value.trim().isEmpty) {
    return 'Please Enter a$text';
  }
  // Check if the entered name has the right format
  // if (!RegExp(r'^[a-zA-Z0-9]+$').hasMatch(value)) {
  //   return 'Please enter a valid district.';
  // }
  // Return null if the entered name is valid
  return null;
}

String? validatePlace(String value) {
  if (value.trim().isEmpty) {
    return 'Please Enter a Place.';
  }
  // Check if the entered name has the right format
  // if (!RegExp(r'^[a-zA-Z0-9]+$').hasMatch(value)) {
  //   return 'Please enter a valid district.';
  // }
  // Return null if the entered name is valid
  return null;
}

String? validateContactName(String value) {
  if (value.trim().isEmpty) {
    return 'Please enter contact name.';
  }

  /// Check if the entered name has the right format
  if (!RegExp(r'^[a-zA-Z ]+$').hasMatch(value.trim())) {
    return 'Please enter a valid name.';
  }

  /// Return null if the entered name is valid
  return null;
}

String? validateDistrict(String value) {
  if (value.trim().isEmpty) {
    return 'Please enter the State.';
  }
  // Check if the entered name has the right format
  if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
    return 'Please enter a valid District.';
  }
  // Return null if the entered name is valid
  return null;
}

String? validateEmail(String value) {
  if (!RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
      .hasMatch(value.trim())) {
    return 'Please enter a valid email address.';
  }

  return null;
}

String? validateGSTNumber(String value) {
  if (value.trim().isEmpty) {
    return 'Please enter the GST Number.';
  }
  // Check if the entered name has the right format

  if (value.trim().isNotEmpty &&
      !RegExp(r'^[0-9]{2}[A-Z]{5}[0-9]{4}[A-Z]{1}[1-9A-Z]{1}[Z]{1}[0-9A-Z]{1}$')
          .hasMatch(value)) {
    return 'Please enter a valid GST Number.';
  }

  // Return null if the entered name is valid
  return null;
}

String? validatePanCard(String value) {
  if (value.trim().isEmpty) {
    return 'Please Enter Valid Pancard Number';
  }
  // Check if the entered name has the right format

  if (value.trim().isNotEmpty &&
      !RegExp(r'^[A-Z]{5}[0-9]{4}[A-Z]{1}$').hasMatch(value.trim())) {
    return 'Please Enter Valid Pancard Number.';
  }

  // Return null if the entered name is valid
  return null;
}

//Pattern pattern = Pattern.compile("[A-Z]{5}[0-9]{4}[A-Z]{1}");
String? validateMobile(String value) {
  String patttern = r'(^(?:[+0]9)?[0-9]{10,10}$)';
  RegExp regExp = RegExp(patttern);
  if (value.isEmpty) {
    return 'Please enter mobile number';
  } else if (!regExp.hasMatch(value)) {
    return 'Please enter valid mobile number';
  }
  return null;
}

String? validatePincode(String value) {
  if (value.trim().isEmpty) {
    return 'Please enter Pin Code';
  }
  if (!RegExp(r'^[1-9][0-9]{5}$', caseSensitive: false)
      .hasMatch(value.trim())) {
    return 'Please enter a valid Pin Code.';
  }

  return null;

  /// Check if the entered name has the right format

  ///Return null if the entered name is valid
}

String? validateName(String value) {
  if (value.trim().isEmpty) {
    return 'Please enter the name.';
  } else if (value.trim().length > 20) {
    return 'Max Length is 20';
  } else if (value.trim().length < 3) {
    return 'Minimum Length is 3';
  }
  if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value.trim())) {
    return 'Please enter a valid name.';
  }

  return null;

  /// Check if the entered name has the right format

  ///Return null if the entered name is valid
}

String? validateshopName(String value) {
  if (value.trim().isEmpty) {
    return 'Please enter the name.';
  } else if (value.trim().length > 20) {
    return 'Max Length is 20';
  } else if (value.trim().length < 3) {
    return 'Minimum Length is 3';
  }
  if (!RegExp(r"^[a-zA-Z0-9\s&@#%^+{}'-]+$").hasMatch(value.trim())) {
    return 'Please enter a valid name.';
  }

  return null;

  /// Check if the entered name has the right format

  ///Return null if the entered name is valid
}

String? validateNickName(String value) {
  if (value.trim().isEmpty) {
    return null;
  }
  // Check if the entered name has the right format
  // if (!RegExp(r'^[a-zA-Z0-9]+$').hasMatch(value)) {
  //   return 'Please enter a valid district.';
  // }
  // Return null if the entered name is valid
  return null;
}

String? validatePassword(String value) {
  RegExp regex =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{4,}$');
  if (value.isEmpty) {
    return ("Password is required");
  } else if (value.length <= 6) {
    return ("Password Must be more than 6 characters");
  } else if (!regex.hasMatch(value)) {
    return ("Password contain upper,lower,digit and Special character");
  }
  return null;
}

String? validatePassword1(String value) {
  if (value.trim().isEmpty) {
    return 'Please Enter password.';
  } else {}
  return null;
}

String? validatePasswordConfirm(String value) {
  if (value.trim().isEmpty) {
    return 'Please Enter ConfirmPassword.';
  } else {}
  return null;
}

String? validateCity(String value) {
  if (value.trim().isEmpty) {
    return "Please Enter  City";
  } else if (!RegExp(r'^[a-zA-Z]*$').hasMatch(value.trim())) {
    return 'Enter a valid City';
  }

  return null;
}

String? validateWebsite(String value) {
  String pattern =
      r'(http|https)://[\w-]+(\.[\w-]+)+([\w.,@?^=%&amp;:/~+#-]*[\w@?^=%&amp;/~+#-])?';
  RegExp regExp = RegExp(pattern);
  if (value.isEmpty) {
    return null;
  } else if (!regExp.hasMatch(value)) {
    return 'Please enter valid webSite';
  }
  return null;
}

String? validateAadharNumber(String aadharNumber) {
  if (!RegExp(r'^[2-9]{1}[0-9]{11}$').hasMatch(aadharNumber.trim())) {
    return "Invalid Aadhar Number";
  } else {
    return null;
  }
}

String? validateUsername(String value) {
  if (value.trim().isEmpty) {
    return 'Please enter the User ID.';
  }
  if (value.trim().length < 4) {
    return 'Username must be at least 4 characters in length.';
  }
  // Return null if the entered username is valid
  return null;
}

extension PanCardValidator on String {
  bool isValidPanCardNo() {
    return RegExp(r'^[A-Z]{5}[0-9]{4}[A-Z]{1}$').hasMatch(this);
  }
}
