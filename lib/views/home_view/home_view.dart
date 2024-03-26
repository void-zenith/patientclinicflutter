import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import "package:http/http.dart" as http;
import 'package:patientclinicflutter/constants/const.dart';
import 'package:patientclinicflutter/models/Patient.dart';
import 'package:patientclinicflutter/views/add_patient_view/add_patient_view.dart';
import 'package:patientclinicflutter/views/splash_view.dart';
import 'package:patientclinicflutter/views/view_patient_view/view_patient_view.dart';
import 'package:patientclinicflutter/views/viewall_patient_view/viewall_critical_patient_view.dart';
import 'package:patientclinicflutter/views/viewall_patient_view/viewall_patient_view.dart';

class ApiController extends GetxController {
  var responseData = <Patient>[].obs;
  var isLoading = false.obs;
  static const String baseUrl = 'http://127.0.0.1:4000';
  var error = ''.obs;
  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  Future<void> fetchData() async {
    isLoading.value = true;
    try {
      var response = await http
          .get(Uri.parse('$baseUrl/patient'), headers: <String, String>{
        'Content-Type': 'application/json',
      });
      if (response.statusCode == 200) {
        var parsedData = json.decode(response.body) as List<dynamic>;
        responseData.value =
            parsedData.map((json) => Patient.fromJson(json)).toList();
      } else {
        error.value = 'Failed to load data';
      }
    } catch (e) {
      error.value = 'Error: $e';
    } finally {
      isLoading.value = false;
    }
  }
}

class HomeView extends StatelessWidget {
  HomeView({super.key});
  final ApiController apiController = Get.put(ApiController());

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
        child: RefreshIndicator(
            onRefresh: () => apiController.fetchData(), // Call fetchDat,child:
            child: Obx(() {
              if (apiController.isLoading.value) {
                return CircularProgressIndicator();
              } else if (apiController.error.value.isNotEmpty) {
                return Text(apiController.error.value);
              } else {
                return apiController.responseData.isEmpty
                    ? Text('No data available')
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                  child: Container(
                                      decoration: BoxDecoration(
                                          color: ConstColors.lightPrimaryColor,
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      padding: const EdgeInsets.all(12),
                                      child: Column(
                                        children: [
                                          TextStyles.regular(
                                              label:
                                                  "Total number of Patients:",
                                              textColor: ConstColors.textColor,
                                              textSize: ConstSizes.smallSize,
                                              textWeight: FontWeight.w500,
                                              alignment: TextAlign.center),
                                          TextStyles.regular(
                                              label: apiController
                                                  .responseData.length
                                                  .toString(),
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
                                          borderRadius:
                                              BorderRadius.circular(8)),
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
                                              label: apiController
                                                  .responseData.length
                                                  .toString(),
                                              textColor: ConstColors.textColor,
                                              textSize: ConstSizes.extraLarge,
                                              textWeight: FontWeight.w600)
                                        ],
                                      ))),
                            ],
                          ),
                          14.heightBox,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              TextStyles.regular(
                                  label: "List of Patients",
                                  textSize: ConstSizes.extraLarge,
                                  textWeight: FontWeight.w700,
                                  alignment: TextAlign.left),
                              GestureDetector(
                                onTap: () {
                                  Get.to(() => ViewAllPatient());
                                },
                                child: TextStyles.regular(
                                    label: "View all",
                                    textSize: ConstSizes.extraSmallSize,
                                    textWeight: FontWeight.w400,
                                    alignment: TextAlign.right),
                              )
                            ],
                          ),
                          14.heightBox,
                          Expanded(
                            child: ListView.builder(
                              itemCount: apiController.responseData.length,
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
                                        label: apiController
                                            .responseData[index].fullName,
                                        textColor: ConstColors.textColor,
                                        textSize: ConstSizes.regularSize,
                                        textWeight: FontWeight.w600),
                                    leading: CircleAvatar(
                                        backgroundColor:
                                            ConstColors.lightPrimaryColor,
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
                                      Get.to(() => ViewPatient(
                                          userId: apiController
                                              .responseData[index].id!));
                                    },
                                  ),
                                );
                              },
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              TextStyles.regular(
                                  label: "List of Critical Patients",
                                  textSize: ConstSizes.extraLarge,
                                  textWeight: FontWeight.w700,
                                  alignment: TextAlign.left),
                              GestureDetector(
                                onTap: () {
                                  Get.to(() => ViewAllCriticalPatient());
                                },
                                child: TextStyles.regular(
                                    label: "View all",
                                    textSize: ConstSizes.extraSmallSize,
                                    textWeight: FontWeight.w400,
                                    alignment: TextAlign.right),
                              )
                            ],
                          ),
                          14.heightBox,
                          Expanded(
                            child: ListView.builder(
                              itemCount: apiController.responseData.length,
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
                                        label: apiController
                                            .responseData[index].fullName,
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
                                      Get.to(() => ViewPatient(
                                            userId: apiController
                                                .responseData[index].id!,
                                          ));
                                    },
                                  ),
                                );
                              },
                            ),
                          )
                          // const CustomTextField(placeHolderText: "Search for patients..")
                        ],
                      );
              }
            })),
      ),
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
