import 'package:flutter/material.dart';
import 'package:flutter_application_2/utils/custom_text.dart';
import 'package:overlay_support/overlay_support.dart';

class CustomMsg {
  final String msg;
  final Color color;
  CustomMsg({required this.msg, required this.color}) {
    showSimpleNotification(
      CustomText(
          text: msg,
          size: 20,
          fontColor: Colors.white,
          weight: FontWeight.bold),
      background: color,
    );
  }
}
