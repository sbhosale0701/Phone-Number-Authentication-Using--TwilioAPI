import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:twilio_flutter/twilio_flutter.dart';

class PhoneAuthController extends GetxController {
  TextEditingController phoneController = TextEditingController();
  TextEditingController codeController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isCodeSent = false;

  TwilioFlutter? twilioFlutter; // Declare as nullable

  var sentOTP;

  void showInvisibleWidgets() {
    isCodeSent = true;
    update();
  }

  void sendSMS() async {
    twilioFlutter = TwilioFlutter(
      accountSid: 'AC4de479d2d859af48d0e9f2e3b8554d22',
      authToken: '6a14121ee0de3c6590ab6cdeb56a804f',
      twilioNumber: '+12722256143',
    );

    var rnd = Random();
    var digits = rnd.nextInt(900000) + 100000;
    sentOTP = digits;

    // Print the OTP
    print(sentOTP);

    try {
      await twilioFlutter!.sendSMS(
        toNumber: phoneController.text,
        messageBody: 'Hello, your OTP is $digits',
      );
      showInvisibleWidgets(); // Assuming you want to show the widgets after sending
    } catch (e) {
      print('SMS sending failed: $e');
    }
  }

  void verifyOTP() {
    if (sentOTP.toString() == codeController.text) {
      Fluttertoast.showToast(
        msg: "OTP Verified Successfully!",
        backgroundColor: Colors.green,
      );
    } else {
      Fluttertoast.showToast(
        msg: "OTP didn't match!",
        backgroundColor: Colors.red,
      );
    }
  }
}
