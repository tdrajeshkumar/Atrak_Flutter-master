import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

enum TYPES { text, email, phno, float, number, date }

class FormUtils {
  static validate(
      {@required String value, @required TYPES type, String defaultValue}) {

    if (value.isEmpty) {
      if (defaultValue != null) {
        return null;
      } else {
        return "This Field Should not be empty";
      }
    } else {
      switch (type) {
        case TYPES.number:
          try {
            int.parse(value);
            return null;
          } catch (error) {
            return "Invalid Data Type.";
          }
          break;
        case TYPES.email:
          return _emailValidate(value);
          break;
        case TYPES.phno:
          return _phnoValidate(value);
          break;
        case TYPES.float:
          try {
            double.parse(value);
            return null;
          } catch (error) {
            return "Invalid DataType";
          }
          break;
        case TYPES.date:
          try {} catch (error) {
            return "Invalid DataType";
          }
          break;
        default:
          return null;
      }
    }
  }

  static _emailValidate(String email) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = new RegExp(p);

    if (regExp.hasMatch(email)) {
      return null;
    } else {
      return "Invalid Email Id";
    }
  }

  static _phnoValidate(String phno) {
    try {
      int.parse(phno);
      if (phno.length != 10) {
        return "phone number should be 10 digits";
      }
    } catch (error) {
      return "Invalid Phno format";
    }

    return null;
  }

  static getDouble(String value) {
    return (value == null || value.isEmpty) ? null : double.parse(value);
  }

  static getInt(String value) {
    return (value == null || value.isEmpty) ? null : int.parse(value);
  }

  static hideKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }
}
