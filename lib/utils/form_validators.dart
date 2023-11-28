import 'package:flutter/material.dart';

class FormValidators {
  static String? Function(String?, BuildContext context) emailValidateFunction =
      (String? value, BuildContext context) {
    if (value!.isEmpty) {
      return 'Empty email';
    } else if (RegExp(
          r"^[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-zA-Z0-9][a-zA-Z0-9-]{0,253}\.)*[a-zA-Z0-9][a-zA-Z0-9-]{0,253}\.[a-zA-Z0-9]{2,}$",
        ).stringMatch(value.toLowerCase()) !=
        value.toLowerCase()) {
      return 'Invalid email';
    }
    //else if ( ) {
    //  return AppLocalizations.of(context)!.noUserWithSuchEmail;
    // }
    else {
      return null;
    }
  };
}
