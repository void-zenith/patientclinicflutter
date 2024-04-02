import 'dart:convert';

import "package:http/http.dart" as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:patientclinicflutter/components/customElevatedButton.dart';
import 'package:patientclinicflutter/models/Patient.dart';
import 'package:patientclinicflutter/models/Record.dart';
import 'package:patientclinicflutter/views/add_record_view/add_record_view.dart';
import 'package:patientclinicflutter/views/record_view/record_view.dart';

import '../../constants/const.dart';
import '../add_patient_view/add_patient_view.dart';
import '../splash_view.dart';

class ViewPatientApiController extends GetxController {
  var patient = Patient(
    fullName: '',
    email: '',
    address: '',
    number: '',
    gender: '',
    dob: '',
  ).obs;
  var isLoading = false.obs;
  static const String baseUrl = 'http://127.0.0.1:4000';
  var error = ''.obs;
  Future<void> fetchData(String userId) async {
    isLoading.value = true;
    try {
      var response = await http
          .get(Uri.parse('$baseUrl/patient/$userId'), headers: <String, String>{
        'Content-Type': 'application/json',
      });
      if (response.statusCode == 200) {
        var patientData = Patient.fromJson(json.decode(response.body));
        patient.value = patientData;
        isLoading.value = false;
      } else {
        isLoading.value = false;
        error.value = 'Failed to load data';
      }
    } catch (e) {
      error.value = 'Error: $e';
    } finally {
      isLoading.value = false;
    }
  }
}

class ViewPatient extends StatelessWidget {
  final String userId;
  final ViewPatientApiController apiController =
      Get.put(ViewPatientApiController());
  ViewPatient({super.key, required this.userId}) {
    apiController.fetchData(userId);
  }
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

  final List<Record> items = [
    Record(),
  ];
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
      body: Container(
          padding: const EdgeInsets.all(16),
          child: RefreshIndicator(
            onRefresh: () => apiController.fetchData(userId),
            child: Obx(() {
              var patient = apiController.patient.value;
              if (apiController.isLoading.value) {
                return CircularProgressIndicator();
              } else if (apiController.error.value.isNotEmpty) {
                return Text(apiController.error.value);
              } else {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextStyles.regular(
                        label: patient.fullName,
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
                                    label: patient.email,
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
                                    label: patient.number,
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
                                    label: patient.address,
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
                                    label: patient.gender,
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
                                    label: patient.dob,
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
                                // title: TextStyles.regular(
                                //     label: items[index].date.toString(),
                                //     textColor: ConstColors.textColor,
                                //     textSize: ConstSizes.regularSize,
                                //     textWeight: FontWeight.w600),
                                title: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextStyles.regular(
                                        label: items[index].date.toString(),
                                        textColor: ConstColors.textColor,
                                        textSize: ConstSizes.regularSize,
                                        textWeight: FontWeight.w600),
                                    TextStyles.regular(
                                        label: items[index].doneBy.toString(),
                                        textColor: ConstColors.textColor,
                                        textSize: ConstSizes.regularSize,
                                        textWeight: FontWeight.w600),
                                    if (true)
                                      TextStyles.regular(
                                          label: "Critical".toString(),
                                          textColor: ConstColors.textColor,
                                          textSize: ConstSizes.regularSize,
                                          textWeight: FontWeight.w600),
                                  ],
                                ),
                                trailing: const Icon(
                                  Icons.arrow_forward_ios,
                                  size: 14,
                                ),
                                onTap: () {
                                  Get.to(() => ViewRecord(userId: userId));
                                },
                              ),
                            );
                          }),
                    )
                  ],
                );
              }
            }),
          )),
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
