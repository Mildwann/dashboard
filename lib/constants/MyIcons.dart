// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

class Myicons {
  static const NewIcon = Icons.difference_outlined;
  static const ProvisioningIcon = Icons.edit_calendar_outlined;
  static const BillingIcon = Icons.description_outlined;
  static const CompleteIcon = Icons.description_outlined;
}

BoxDecoration primaryBorder(
    {double? radius, Color? color, Color? colorBorder}) {
  return BoxDecoration(
    border: Border.all(
        width: 1.0, color: colorBorder ?? Color.fromARGB(255, 226, 225, 225)),
    color: color ?? Colors.white,
    borderRadius: BorderRadius.all(Radius.circular(radius ?? 20.0)),
  );
}
