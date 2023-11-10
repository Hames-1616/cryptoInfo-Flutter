import 'package:flutter/material.dart';

String convertString(num x) {
  String amount = x.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},');
  String returns = "\$";
  int i = 0;
  while (i <= amount.length) {
    if (amount[i] == ".") {
      break;
    }
    returns += amount[i];
    i++;
  }
  returns += " USD";
  return returns;
}

String convert24Percent(num x) {
  String s = x.toString();
  String returns = "";
  int i = 0;
  if (s[0] == "-") {
    returns += "-";
  } else {
    returns += "+";
  }
  while (i < s.length) {
    if (s[i] == ".") {
      returns += s[i];
      returns += s[i + 1];
      break;
    } else if (s[i] == "-") {
    } else {
      returns += s[i];
    }
    i++;
  }
  returns += "%";
  return returns;
}

Color getcolor(String s) {
  if (s[0] == "-") {
    return Colors.red;
  } else {
    return Colors.green;
  }
}

String getcolors(num s) {
  String str = s.toString();
  if (str[0] == "-") {
    return "assets/images/red.png";
  } else {
    return "assets/images/green.png";
  }
}
