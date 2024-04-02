import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:patientclinicflutter/components/customElevatedButton.dart';
import 'package:patientclinicflutter/models/Record.dart';
import 'package:patientclinicflutter/views/add_record_view/add_record_view.dart';

import '../../constants/const.dart';
import '../add_patient_view/add_patient_view.dart';
import '../splash_view.dart';

class ViewRecord extends StatelessWidget {
  final String userId;
  ViewRecord({super.key, required this.userId});
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

  final List<Record> items = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white, size: 18),
        backgroundColor: ConstColors.priamryColor,
        centerTitle: true,
        title: TextStyles.regular(
            label: "View Record",
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
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextStyles.regular(
                label: "Record Of",
                textColor: ConstColors.textColor,
                textSize: ConstSizes.smallSize,
                textWeight: FontWeight.w400),
            TextStyles.regular(
                label: "Zenith Rajbhandari",
                textColor: ConstColors.priamryColor,
                textSize: ConstSizes.doubleLarge,
                textWeight: FontWeight.w700),
            8.heightBox,
            TextStyles.regular(
                label: "Recorded On",
                textColor: ConstColors.textColor,
                textSize: ConstSizes.smallSize,
                textWeight: FontWeight.w400),
            TextStyles.regular(
                label: "2024-12-12 at 17:00 AM",
                textColor: ConstColors.priamryColor,
                textSize: ConstSizes.regularSize,
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
                            label: "Systolic Blood Pressure: ",
                            textColor: ConstColors.textColor,
                            textSize: ConstSizes.smallSize,
                            textWeight: FontWeight.w500),
                        TextStyles.regular(
                            label: "120",
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
                            label: "Diastolic Blood Pressure: ",
                            textColor: ConstColors.textColor,
                            textSize: ConstSizes.smallSize,
                            textWeight: FontWeight.w500),
                        TextStyles.regular(
                            label: "120",
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
                            label: "Respiratory Rate: ",
                            textColor: ConstColors.textColor,
                            textSize: ConstSizes.smallSize,
                            textWeight: FontWeight.w500),
                        TextStyles.regular(
                            label: "90",
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
                            label: "Heartbeat Rate(bpm): ",
                            textColor: ConstColors.textColor,
                            textSize: ConstSizes.smallSize,
                            textWeight: FontWeight.w500),
                        TextStyles.regular(
                            label: "80bpm",
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
                            label: "Blood Oxygen Level: ",
                            textColor: ConstColors.textColor,
                            textSize: ConstSizes.smallSize,
                            textWeight: FontWeight.w500),
                        TextStyles.regular(
                            label: "190",
                            textColor: ConstColors.textColor,
                            textSize: ConstSizes.smallSize,
                            textWeight: FontWeight.w500)
                      ],
                    ),
                  ],
                )),
            14.heightBox,
            TextStyles.regular(
                label: "Summary:",
                textColor: ConstColors.textColor,
                textSize: ConstSizes.smallSize,
                textWeight: FontWeight.w400),
            TextStyles.regular(
                label:
                    "The patient presented with symptoms consistent with acute bronchitis, including cough, fever, and chest discomfort. Physical examination revealed mild wheezing and increased respiratory rate.",
                textColor: ConstColors.textColor,
                textSize: ConstSizes.regularSize,
                textWeight: FontWeight.w400),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => AddRecordView(userId: userId));
          // Add your onPressed functionality here
        },
        backgroundColor: ConstColors.priamryColor,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
