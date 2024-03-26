import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:patientclinicflutter/components/customElevatedButton.dart';
import 'package:patientclinicflutter/constants/const.dart';
import 'package:patientclinicflutter/components/customTextField.dart';
import 'package:patientclinicflutter/controllers/user_controller.dart';
import 'package:patientclinicflutter/views/login_view/login_view.dart';

class RegisterView extends StatelessWidget {
  RegisterView({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _fullnameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(ConstAssets.loginbgImage), fit: BoxFit.fill),
        ),
        padding:
            const EdgeInsets.only(top: 80, left: 16, right: 16, bottom: 16),
        child: Column(children: [
          Expanded(
              flex: 2,
              child: SingleChildScrollView(
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
                ),
              )),
          Expanded(
              flex: 3,
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
                      textFieldController: _fullnameController,
                      placeHolderText: ConstString.nameHint,
                    ),
                    14.heightBox,
                    CustomTextField(
                      textFieldController: _passwordController,
                      placeHolderText: ConstString.passwordHint,
                    ),
                    24.heightBox,
                    CustomElevatedButton(
                      onPressed: () async {
                        bool isRegistered = await UserController.registerUser(
                            _fullnameController.text,
                            _emailController.text,
                            _passwordController.text);
                        if (isRegistered) {
                          // ignore: use_build_context_synchronously
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text("Registered Successfully"),
                          ));
                          // Navigate to login screen or perform desired action
                          Get.to(() => LoginView());
                        } else {
                          // ignore: use_build_context_synchronously
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text("Register Unsuccessful"),
                          ));
                          // Show error message or handle unsuccessful registration
                        }
                      },
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
                            Get.to(() => LoginView());
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
                )),
              ))
        ]),
      ),
    );
  }
}
