import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:patientclinicflutter/components/customElevatedButton.dart';
import 'package:patientclinicflutter/constants/const.dart';
import 'package:patientclinicflutter/components/customTextField.dart';
import 'package:patientclinicflutter/models/User.dart';
import 'package:patientclinicflutter/views/home_view/home_view.dart';
import 'package:patientclinicflutter/views/register_view/register_view.dart';

import '../../controllers/user_controller.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
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
                    label: ConstString.welcomeText,
                    textColor: ConstColors.textColor,
                    textSize: ConstSizes.regularSize,
                    textWeight: FontWeight.w600,
                  )
                ],
              )),
          Expanded(
              flex: 2,
              child: SingleChildScrollView(
                child: Form(
                    child: Column(
                  children: [
                    CustomTextField(
                      textFieldController: _emailController,
                      placeHolderText: ConstString.emailHint,
                    ),
                    14.heightBox,
                    CustomTextField(
                      textFieldController: _passwordController,
                      placeHolderText: ConstString.passwordHint,
                    ),
                    24.heightBox,
                    Align(
                        alignment: Alignment.centerRight,
                        child: TextStyles.regular(
                          label: ConstString.forgotPWLabel,
                          textColor: ConstColors.textColor,
                          textSize: ConstSizes.smallSize,
                          textWeight: FontWeight.w400,
                        )),
                    24.heightBox,
                    CustomElevatedButton(
                      onPressed: () async {
                        bool loggedIn = await UserController.loginUser(
                            _emailController.text, _passwordController.text);
                        if (loggedIn) {
                          // ignore: use_build_context_synchronously
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text("Login Successful"),
                          ));
                          Get.to(() => HomeView());
                        } else {
                          // ignore: use_build_context_synchronously
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text("Login Unsuccessful"),
                          ));
                        }
                      },
                      buttonTextColor: Colors.white,
                      buttonColor: ConstColors.priamryColor,
                      buttonLabel: ConstString.login,
                    ),
                    24.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextStyles.regular(
                          label: ConstString.noAccountLabel,
                          textColor: ConstColors.textColor,
                          textSize: ConstSizes.smallSize,
                          textWeight: FontWeight.w400,
                        ),
                        6.widthBox,
                        GestureDetector(
                          onTap: () {
                            Get.to(() => RegisterView());
                          },
                          child: TextStyles.regular(
                            label: ConstString.signupnow,
                            textColor: ConstColors.textColor,
                            textSize: ConstSizes.smallSize,
                            textWeight: FontWeight.w700,
                          ),
                        )
                      ],
                    )
                  ],
                )),
              ))
        ]),
      ),
    );
  }
}
