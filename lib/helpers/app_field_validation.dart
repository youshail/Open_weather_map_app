library wc_form_validators;

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart' show FormFieldValidator;

/// Provides a set of built-in validators that can be used by form fields.
///
///
/// A validator is a function that processes a `FormField`
/// and returns an error [String] or null. A null [String] means that validation has passed.
class FieldValidator {

  static FormFieldValidator<String> equalTo(dynamic value, {required String message}) {
    return (fieldValue) {
      var valueToCompare;
      if (value is TextEditingController) {
        valueToCompare = value.text;
      } else {
        valueToCompare = value;
      }
      if (Validator.isEqualTo(fieldValue, valueToCompare)) {
        return null;
      } else {
        return message ;
      }
    };
  }


  static FormFieldValidator<String> password({
    required String errorMessage,
    int minLength = 4,
    required int maxLength,
    bool shouldContainNumber = false,
    bool shouldContainSpecialChars = false,
    bool shouldContainCapitalLetter = false,
    bool shouldContainSmallLetter = false,
    Function? reason,
    String Function()? onNumberNotPresent,
    String Function()? onSpecialCharsNotPresent,
    String Function()? onCapitalLetterNotPresent,
  }) {
    return (fieldValue) {
      var mainError = errorMessage;

      if (Validator.isPassword(
        fieldValue!,
        minLength: minLength,
        maxLength: maxLength,
        shouldContainSpecialChars: shouldContainSpecialChars,
        shouldContainCapitalLetter: shouldContainCapitalLetter,
        shouldContainSmallLetter: shouldContainSmallLetter,
        shouldContainNumber: shouldContainNumber,
        isNumberPresent: (present) {
          if (!present) mainError = onNumberNotPresent!();
        },
        isCapitalLetterPresent: (present) {
          if (!present) mainError = onCapitalLetterNotPresent!();
        },
        isSpecialCharsPresent: (present) {
          if (!present)
            mainError = onSpecialCharsNotPresent != null
                ? onSpecialCharsNotPresent()
                : "Password must contain special character";
        },
      )) {
        return null;
      } else {
        return mainError ;
      }
    };
  }

  /// Validator that requires the field have a non-empty value.
  ///
  ///
  /// ### Validate that the field is non-empty
  ///
  ///
  /// ```dart
  ///          TextFormField(
  ///              labelText: 'Required',
  ///            ),
  ///            validator: Validators.required('Field is required'),
  ///          ),
  /// ```
  ///
  static FormFieldValidator<String> required(String errorMessage) {
    return (value) {
      if (value == null) {
        value = '';
      }
      if (value.isEmpty)
        return errorMessage;
      else
        return null;
    };
  }




  /// Validator that requires the field's value to be greater than or equal to the provided number.
  ///
  ///
  /// ### Validate against a minimum of 5
  ///
  ///
  /// ```dart
  ///           TextFormField(
  ///            keyboardType: TextInputType.numberWithOptions(
  ///              decimal: true,
  ///              signed: true,
  ///            ),
  ///            decoration: InputDecoration(
  ///              labelText: 'Minimum 5',
  ///            ),
  ///            validator: Validators.min(5, 'Value less than 5 not allowed'),
  ///          ),
  /// ```
  ///
  static FormFieldValidator<String> min(double min, String errorMessage) {
    return (value) {
      if (value == null) {
        value = '';
      }
      if (value.trim().isEmpty)
        return null;
      else {
        final dValue = _toDouble(value);
        if (dValue < min)
          return errorMessage;
        else
          return null;
      }
    };
  }

  /// Validator that requires the field's value to be less than or equal to the provided number.
  ///
  ///
  /// ### Validate against a maximum of 5
  ///
  /// ``` dart
  ///           TextFormField(
  ///            keyboardType: TextInputType.numberWithOptions(
  ///              decimal: true,
  ///              signed: true,
  ///            ),
  ///            decoration: InputDecoration(
  ///              labelText: 'Maximum 5',
  ///            ),
  ///            validator: Validators.max(5, 'Value greater than 5 not allowed'),
  ///          ),
  /// ```
  ///
  static FormFieldValidator<String> max(double max, String errorMessage) {
    return (value) {
      if (value == null) {
        value = '';
      }
      if (value.trim().isEmpty)
        return null;
      else {
        final dValue = _toDouble(value);
        if (dValue > max)
          return errorMessage;
        else
          return null;
      }
    };
  }

  /// Validator that requires the field's value pass an email validation test.
  ///
  /// This validator uses Regex of HTML5 email validator.
  ///
  /// ```dart
  /// RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
  /// ```
  ///
  ///
  /// ### Validate that the field matches a valid email pattern
  ///
  /// ```dart
  ///           TextFormField(
  ///            decoration: InputDecoration(
  ///              labelText: 'Email',
  ///            ),
  ///            validator: Validators.email('Invalid email address'),
  ///          ),
  /// ```
  ///
  static FormFieldValidator<String> email(String errorMessage) {
    return (value) {
      if (value == null) {
        value = '';
      }
      if (value.isEmpty)
        return null;
      else {
        final emailRegex = RegExp(
            r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
        if (emailRegex.hasMatch(value))
          return null;
        else
          return errorMessage;
      }
    };
  }

  /// Validator that requires the length of the field's value to be greater than or equal
  /// to the provided minimum length.
  ///
  ///
  /// ### Validate that the field has a minimum of 5 characters
  ///
  /// ```dart
  ///           TextFormField(
  ///            decoration: InputDecoration(
  ///              labelText: 'Minimum length 5',
  ///            ),
  ///            validator: Validators.minLength(5, 'Characters are less than 5'),
  ///          ),
  /// ```
  ///
  static FormFieldValidator<String> minLength(
      int minLength, String errorMessage) {
    return (value) {
      if (value == null) {
        value = '';
      }
      if (value.isEmpty) return null;

      if (value.length < minLength)
        return errorMessage;
      else
        return null;
    };
  }

  /// Validator that requires the length of the field's value to be less than or equal
  /// to the provided maximum length.
  ///
  ///
  /// ### Validate that the field has maximum of 5 characters
  ///
  /// ```dart
  ///           TextFormField(
  ///            decoration: InputDecoration(
  ///              labelText: 'Maximum length 5',
  ///            ),
  ///            validator: Validators.maxLength(5, 'Characters are greater than 5'),
  ///          ),
  /// ```
  ///
  static FormFieldValidator<String> maxLength(
      int maxLength, String errorMessage) {
    return (value) {
      if (value == null) {
        value = '';
      }
      if (value.isEmpty) return null;

      if (value.length > maxLength)
        return errorMessage;
      else
        return null;
    };
  }

  /// Validator that requires the field's value to match a regex pattern.
  ///
  ///
  /// Note that if a Regexp is provided, the Regexp is used as is to test the values.
  ///
  ///
  /// ### Validate that the field only contains alphabets
  ///
  /// ```dart
  ///           TextFormField(
  ///            decoration: InputDecoration(
  ///              labelText: 'Pattern r"^[A-Za-z]+\$"',
  ///            ),
  ///            validator: Validators.patternString(
  ///                r"^[A-Za-z]+$", 'Only alphabets are allowed'),
  ///          ),
  /// ```
  ///
  static FormFieldValidator<String> patternString(
      String pattern, String errorMessage) {
    return patternRegExp(RegExp(pattern), errorMessage);
  }

  /// Validator that requires the field's value to match a regex pattern.
  ///
  ///
  /// Note that if a Regexp is provided, the Regexp is used as is to test the values.
  ///
  ///
  /// ### Validate that the field only contains alphabets
  ///
  /// ```dart
  ///           TextFormField(
  ///            decoration: InputDecoration(
  ///              labelText: 'Pattern r"^[A-Za-z]+\$"',
  ///            ),
  ///            validator: Validators.patternRegExp(
  ///                RegExp(r"^[A-Za-z]+$"), 'Only alphabets are allowed'),
  ///          ),
  /// ```
  ///
  static FormFieldValidator<String> patternRegExp(
      RegExp pattern, String errorMessage) {
    return (value) {
      if (value == null) {
        value = '';
      }
      if (value.isEmpty) return null;

      if (pattern.hasMatch(value))
        return null;
      else
        return errorMessage;
    };
  }

  /// Compose multiple validators into a single validator.
  ///
  /// ### Validate that the field is non-empty and has character length between 5 and 10
  ///
  /// ```dart
  ///           TextFormField(
  ///            decoration: InputDecoration(
  ///              labelText: 'Compose',
  ///            ),
  ///            validator: Validators.compose([
  ///              Validators.required('Compose is required'),
  ///              Validators.minLength(5, 'Characters cannot be less than 5'),
  ///              Validators.maxLength(10, 'Characters cannot be greater than 10'),
  ///            ]),
  ///          ),
  /// ```
  ///
  static FormFieldValidator<String> compose(
      List<FormFieldValidator<String>> validators) {
    return (value) {
      for (final validator in validators) {
        final result = validator(value);
        if (result != null) return result;
      }
      return null;
    };
  }

  // -------------------- private functions ---------------------- //

  static double _toDouble(String value) {
    value = value.replaceAll(' ', '').replaceAll(',', '');
    return double.parse(value);
  }
}




/// A Validator.
/// A Validator.
class Validator {
  static bool isRequired(String value, {bool allowEmptySpaces = true}) {
    if (value == null || value.isEmpty) {
      return false;
    } else {
      if (!allowEmptySpaces) {
        // Check if the string is not only made of empty spaces
        if (RegExp(r"\s").hasMatch(value)) {
          return false;
        }
      }
      return true; // passed
    }
  }





  static bool isEmail(String email) {
    if (!isRequired(email)) return false;

    // final emailRegex = RegExp(
    // r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");

    // RegExp(r'(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])');

    final emailRegex = RegExp(
        r"^((([a-zA-Z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-zA-Z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-zA-Z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-zA-Z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-zA-Z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-zA-Z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-zA-Z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-zA-Z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-zA-Z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))$");
    if (emailRegex.hasMatch(email))
      return true;
    else
      return false;
  }

  /// Todo: Implement reason for failure
  /// For Validated passwords strings
  static bool isPassword(
      String password, {
        int minLength = 4,
        required int maxLength,
        bool shouldContainNumber = false,
        bool shouldContainSpecialChars = false,
        bool shouldContainCapitalLetter = false,
        bool shouldContainSmallLetter = false,
        Function? reason,
        void Function(bool)? isNumberPresent,
        void Function(bool)? isSpecialCharsPresent,
        void Function(bool)? isCapitalLetterPresent,
        void Function(bool)? isSmallLetterPresent,
        void Function()? isMaxLengthFailed,
        void Function()? isMinLengthFailed,
      }) {
    if (password == null) {
      return false;
    }
    if (password.trim().length == 0) {
      return false;
    }

    if (password.length < minLength) {
      if (isMinLengthFailed != null) isMinLengthFailed();
      return false;
    }

    if (maxLength != null) {
      if (password.length > maxLength) {
        if (isMaxLengthFailed != null) isMaxLengthFailed();
        return false;
      }
    }

    if (shouldContainNumber) {
      final numberRegex = RegExp(r"[0-9]+");
      if (!numberRegex.hasMatch(password)) {
        if (isNumberPresent != null) isNumberPresent(false);
        return false;
      } else if (isNumberPresent != null) isNumberPresent(true);
    }

    if (shouldContainCapitalLetter) {
      final capitalRegex = RegExp(r"[A-Z]+");
      if (!capitalRegex.hasMatch(password)) {
        if (isCapitalLetterPresent != null) isCapitalLetterPresent(false);
        return false;
      } else if (isCapitalLetterPresent != null) isCapitalLetterPresent(true);
    }

    if (shouldContainSmallLetter) {
      final smallLetterRegex = RegExp(r"[a-z]+");
      if (!smallLetterRegex.hasMatch(password)) {
        if (isSmallLetterPresent != null) isSmallLetterPresent(false);
        return false;
      } else if (isSmallLetterPresent != null) isSmallLetterPresent(true);
    }

    if (shouldContainSpecialChars) {
//      final numberRegex = RegExp(r'(?=.*?[#?!@$%^&*-])');
      final specialRegex = RegExp(r"[\'^£$%!&*()}{@#~?><>,.|=_+¬-]");
      if (!specialRegex.hasMatch(password)) {
        if (isSpecialCharsPresent != null) isSpecialCharsPresent(false);
        return false;
      } else if (isSpecialCharsPresent != null) isSpecialCharsPresent(true);
    }

    return true;
  }

  static bool isEqualTo(dynamic value, dynamic valueToCompare) {
    if (value == valueToCompare)
      return true;
    else
      return false;
  }

  static isNumber(String value, {bool allowSymbols = true}) {
    if (value == null) return false;

    var numericRegEx = RegExp(r"^[+-]?([0-9]*[.])?[0-9]+$");
    var numericNoSymbolsRegExp = RegExp(r"^[0-9]+$");

    if (allowSymbols) {
      return numericRegEx.hasMatch(value);
    } else
      return numericNoSymbolsRegExp.hasMatch(value);
  }

  static bool minLength(String value, int minLength) {
    if (value.isEmpty) return false;
    if (value.length >= minLength)
      return true;
    else
      return false;
  }

  static bool maxLength(String value, int maxLength) {
    if (value.isEmpty) return false;
    if (value.length <= maxLength)
      return true;
    else
      return false;
  }

  static bool maxValue(double value, double maxValue) {
    if (value < maxValue) return true;
    return false;
  }

  static bool minValue(double value, double minValue) {
    if (value > minValue) return true;
    return false;
  }

  static bool isUppercase(String value) {
    if (value == null) return false;
    return value.compareTo(value.toUpperCase()) == 0;
  }

  static bool isLowercase(String value) {
    if (value == null) return false;
    return value.compareTo(value.toLowerCase()) == 0;
  }

  static bool isAlphaNumeric(String value) {
    if (value == null) return false;
    var alphaNumRegExp = RegExp(r"^[0-9A-Z]+$", caseSensitive: false);
    return alphaNumRegExp.hasMatch(value);
  }

  static bool isAlpha(String value) {
    if (value == null) return false;
    var alphaRegExp = RegExp(r"^[A-Z]+$", caseSensitive: false);
    return alphaRegExp.hasMatch(value);
  }

/*static bool _isUrl(String url) {
    return false;
  }

  // Todo: Add Date Validations also
  _isDate() {

  }

  _isDateGreater() {

  }*/

}
