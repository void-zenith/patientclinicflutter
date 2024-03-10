import 'package:flutter/material.dart';
import "package:get/get.dart";
import 'package:patientclinicflutter/constants/const.dart';
import 'package:patientclinicflutter/views/login_view/login_view.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(fontFamily: ConstFonts.nunito),
      debugShowCheckedModeBanner: false,
      home: const LoginView(),
    );
  }
}
