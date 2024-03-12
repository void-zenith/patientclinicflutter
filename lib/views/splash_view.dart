import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:patientclinicflutter/components/customTextField.dart';
import 'package:patientclinicflutter/constants/const.dart';
import 'package:patientclinicflutter/views/login_view/login_view.dart';
import 'package:patientclinicflutter/views/register_view/register_view.dart';

import '../components/customElevatedButton.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(ConstAssets.bgImage), fit: BoxFit.fill),
        ),
        padding:
            const EdgeInsets.only(top: 80, left: 16, right: 16, bottom: 16),
        child: Column(children: [
          Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(ConstAssets.logo),
                ],
              )),
          Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomElevatedButton(
                    onPressed: () {
                      Get.to(() => LoginView());
                    },
                    buttonTextColor: Colors.white,
                    buttonColor: ConstColors.priamryColor,
                    buttonLabel: ConstString.login,
                  ),
                  24.heightBox,
                  CustomElevatedButton(
                    onPressed: () {
                      Get.to(() => RegisterView());
                    },
                    buttonTextColor: Colors.white,
                    buttonColor: ConstColors.redColor,
                    buttonLabel: ConstString.signup,
                  ),
                  24.heightBox,
                ],
              ))
        ]),
      ),
    );
  }
}
