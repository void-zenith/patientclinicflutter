import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:patientclinicflutter/components/customElevatedButton.dart';

import '../../constants/const.dart';
import '../splash_view.dart';

class ViewPatient extends StatelessWidget {
  const ViewPatient({super.key});

  void onSelected(BuildContext context, int item) {
    switch (item) {
      case 0:
        Get.to(() => const SplashScreen());
        break;
      case 1:
        Get.to(() => const SplashScreen());
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white, size: 18),
        backgroundColor: ConstColors.priamryColor,
        centerTitle: true,
        title: TextStyles.regular(
            label: "View Patient",
            textColor: Colors.white,
            textSize: ConstSizes.extraLarge,
            textWeight: FontWeight.w700),
        actions: [
          PopupMenuButton<int>(
              iconColor: Colors.white,
              icon: const Icon(Icons.settings),
              onSelected: (item) => onSelected(context, item),
              itemBuilder: (context) => [
                    const PopupMenuItem<int>(
                        value: 0, child: Text("View Profile")),
                    const PopupMenuItem<int>(value: 1, child: Text("Logout"))
                  ])
        ],
      ),
      body: SingleChildScrollView(
          child: Container(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextStyles.regular(
                label: "Zenith Rajbhandari",
                textColor: ConstColors.priamryColor,
                textSize: ConstSizes.doubleLarge,
                textWeight: FontWeight.w700),
            14.heightBox,
            Container(
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 234, 234, 234),
                    borderRadius: BorderRadius.circular(10)),
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextStyles.regular(
                            label: "Email: ",
                            textColor: ConstColors.textColor,
                            textSize: ConstSizes.smallSize,
                            textWeight: FontWeight.w500),
                        TextStyles.regular(
                            label: "zenithrajbhandari@gmail.com",
                            textColor: ConstColors.textColor,
                            textSize: ConstSizes.smallSize,
                            textWeight: FontWeight.w500),
                      ],
                    ),
                    3.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextStyles.regular(
                            label: "Phone Number: ",
                            textColor: ConstColors.textColor,
                            textSize: ConstSizes.smallSize,
                            textWeight: FontWeight.w500),
                        TextStyles.regular(
                            label: "+1 4161113333",
                            textColor: ConstColors.textColor,
                            textSize: ConstSizes.smallSize,
                            textWeight: FontWeight.w500),
                      ],
                    ),
                    3.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextStyles.regular(
                            label: "Address: ",
                            textColor: ConstColors.textColor,
                            textSize: ConstSizes.smallSize,
                            textWeight: FontWeight.w500),
                        TextStyles.regular(
                            label: "15 Road, Scarbrough",
                            textColor: ConstColors.textColor,
                            textSize: ConstSizes.smallSize,
                            textWeight: FontWeight.w500)
                      ],
                    ),
                    3.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextStyles.regular(
                            label: "Gender: ",
                            textColor: ConstColors.textColor,
                            textSize: ConstSizes.smallSize,
                            textWeight: FontWeight.w500),
                        TextStyles.regular(
                            label: "Male",
                            textColor: ConstColors.textColor,
                            textSize: ConstSizes.smallSize,
                            textWeight: FontWeight.w500)
                      ],
                    ),
                    3.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextStyles.regular(
                            label: "Date of Birth: ",
                            textColor: ConstColors.textColor,
                            textSize: ConstSizes.smallSize,
                            textWeight: FontWeight.w500),
                        TextStyles.regular(
                            label: "2024-12-12",
                            textColor: ConstColors.textColor,
                            textSize: ConstSizes.smallSize,
                            textWeight: FontWeight.w500)
                      ],
                    ),
                  ],
                )),
            14.heightBox,
            Row(
              children: [
                Expanded(
                  child: CustomElevatedButton(
                    buttonColor: ConstColors.priamryColor,
                    onPressed: () {},
                    buttonTextColor: Colors.white,
                    buttonLabel: "Edit Profile",
                  ),
                ),
                14.widthBox,
                Expanded(
                  child: CustomElevatedButton(
                    buttonColor: ConstColors.redColor,
                    onPressed: () {},
                    buttonTextColor: Colors.white,
                    buttonLabel: "Delete Profile",
                  ),
                ),
              ],
            ),
            14.heightBox,
            TextStyles.regular(
                label: "Medical Records",
                textColor: ConstColors.priamryColor,
                textSize: ConstSizes.doubleLarge,
                textWeight: FontWeight.w700),
          ],
        )),
      )),
    );
  }
}
