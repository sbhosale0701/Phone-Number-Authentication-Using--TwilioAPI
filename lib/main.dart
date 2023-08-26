import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:numberverify/screen/phn_auth_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Phone Auth',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.purple, // Set your desired primary color here
        // If you're using Material 3, make sure to configure colors accordingly
        // useMaterial3: true,
      ),
      home: PhoneAuthScreen(),
    );
  }
}
