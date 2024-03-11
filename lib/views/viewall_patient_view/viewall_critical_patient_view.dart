import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/const.dart';
import '../view_patient_view/view_patient_view.dart';

class ViewAllCriticalPatient extends StatelessWidget {
  ViewAllCriticalPatient({super.key});

  final List<String> items = [
    "zenith rajbhandari",
    "abhiyan bhattarai",
    "item 1"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white, size: 18),
        backgroundColor: ConstColors.priamryColor,
        centerTitle: true,
        title: TextStyles.regular(
            label: "List of Critical Patient",
            textColor: Colors.white,
            textSize: ConstSizes.largeSize,
            textWeight: FontWeight.w700),
      ),
      body: Container(
          padding: const EdgeInsets.all(16),
          child: Expanded(
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
                        backgroundColor: ConstColors.redColor,
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
                      Get.to(() => ViewPatient());
                    },
                  ),
                );
              },
            ),
          )),
    );
  }
}
