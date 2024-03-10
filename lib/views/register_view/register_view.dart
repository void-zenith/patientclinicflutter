import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:patientclinicflutter/components/customElevatedButton.dart';
import 'package:patientclinicflutter/constants/const.dart';
import 'package:patientclinicflutter/components/customTextField.dart';
import 'package:patientclinicflutter/views/login_view/login_view.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(ConstAssets.loginbgImage), fit: BoxFit.fill),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(children: [
          Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(ConstAssets.logo),
                  14.heightBox,
                  TextStyles.regular(
                    label: ConstString.registerText,
                    textColor: ConstColors.textColor,
                    textSize: ConstSizes.regularSize,
                    textWeight: FontWeight.w600,
                  )
                ],
              )),
          Expanded(
              flex: 3,
              child: Form(
                  child: Column(
                children: [
                  CustomTextField(
                    placeHolderText: ConstString.emailHint,
                  ),
                  14.heightBox,
                  CustomTextField(
                    placeHolderText: ConstString.nameHint,
                  ),
                  14.heightBox,
                  CustomTextField(
                    placeHolderText: ConstString.passwordHint,
                  ),
                  24.heightBox,
                  CustomElevatedButton(
                    onPressed: () {},
                    buttonTextColor: Colors.white,
                    buttonColor: ConstColors.priamryColor,
                    buttonLabel: ConstString.signup,
                  ),
                  24.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextStyles.regular(
                        label: ConstString.haveAccountLabel,
                        textColor: ConstColors.textColor,
                        textSize: ConstSizes.smallSize,
                        textWeight: FontWeight.w400,
                      ),
                      6.widthBox,
                      GestureDetector(
                        onTap: () {
                          Get.to(() => const LoginView());
                        },
                        child: TextStyles.regular(
                          label: ConstString.loginNow,
                          textColor: ConstColors.textColor,
                          textSize: ConstSizes.smallSize,
                          textWeight: FontWeight.w700,
                        ),
                      )
                    ],
                  )
                ],
              )))
        ]),
      ),
    );
  }
}
