import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:patientclinicflutter/components/customTextField.dart';
import 'package:patientclinicflutter/constants/const.dart';
import 'package:patientclinicflutter/views/add_patient_view/add_patient_view.dart';
import 'package:patientclinicflutter/views/splash_view.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

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

  final List<String> items = [
    "zenith rajbhandari",
    "abhiyan bhattarai",
    "item 1"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ConstColors.priamryColor,
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: TextStyles.regular(
            label: "Welcome User",
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
          color: const Color.fromARGB(255, 245, 245, 245),
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: Container(
                          decoration: BoxDecoration(
                              color: ConstColors.lightPrimaryColor,
                              borderRadius: BorderRadius.circular(8)),
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            children: [
                              TextStyles.regular(
                                  label: "Total number of Patients:",
                                  textColor: ConstColors.textColor,
                                  textSize: ConstSizes.smallSize,
                                  textWeight: FontWeight.w500,
                                  alignment: TextAlign.center),
                              TextStyles.regular(
                                  label: "10",
                                  textColor: ConstColors.textColor,
                                  textSize: ConstSizes.extraLarge,
                                  textWeight: FontWeight.w600)
                            ],
                          ))),
                  14.widthBox,
                  Expanded(
                      child: Container(
                          decoration: BoxDecoration(
                              color: ConstColors.lightPrimaryColor,
                              borderRadius: BorderRadius.circular(8)),
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            children: [
                              TextStyles.regular(
                                  label: "Total Critical Patients:",
                                  textColor: ConstColors.textColor,
                                  textSize: ConstSizes.smallSize,
                                  textWeight: FontWeight.w500,
                                  alignment: TextAlign.center),
                              TextStyles.regular(
                                  label: "10",
                                  textColor: ConstColors.textColor,
                                  textSize: ConstSizes.extraLarge,
                                  textWeight: FontWeight.w600)
                            ],
                          ))),
                ],
              ),
              14.heightBox,
              Align(
                alignment: Alignment.centerLeft,
                child: TextStyles.regular(
                    label: "List of Patients",
                    textSize: ConstSizes.extraLarge,
                    textWeight: FontWeight.w700,
                    alignment: TextAlign.left),
              ),
              14.heightBox,
              Expanded(
                child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.only(bottom: 14),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: ListTile(
                        title: TextStyles.regular(
                            label: items[index],
                            textColor: ConstColors.textColor,
                            textSize: ConstSizes.regularSize,
                            textWeight: FontWeight.w600),
                        leading: CircleAvatar(
                            backgroundColor: ConstColors.lightPrimaryColor,
                            child: TextStyles.regular(
                                label: "${index + 1}",
                                textColor: ConstColors.textColor,
                                textSize: ConstSizes.smallSize,
                                textWeight: FontWeight.w600)),
                        trailing: const Icon(
                          Icons.arrow_forward_ios,
                          size: 14,
                        ),
                        onTap: () {
                          // Add your onTap functionality here
                        },
                      ),
                    );
                  },
                ),
              )
              // const CustomTextField(placeHolderText: "Search for patients..")
            ],
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => const AddPatientView());
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
