import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import "package:http/http.dart" as http;
import 'package:patientclinicflutter/models/Patient.dart';
import 'package:patientclinicflutter/views/viewall_patient_view/viewall_patient_view.dart';
import '../../constants/const.dart';
import '../view_patient_view/view_patient_view.dart';

class ViewAllCriticalAPIController extends GetxController {
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

class ViewAllCriticalPatient extends StatelessWidget {
  ViewAllCriticalPatient({super.key});
  final ViewAllCriticalAPIController apiController =
      Get.put(ViewAllCriticalAPIController());

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
            label: "List of Patient",
            textColor: Colors.white,
            textSize: ConstSizes.largeSize,
            textWeight: FontWeight.w700),
      ),
      body: Container(
        color: const Color.fromARGB(255, 245, 245, 245),
        padding: const EdgeInsets.all(16),
        child: RefreshIndicator(
            onRefresh: () => apiController.fetchData(), // Call fetchDat,child:
            child: Obx(() {
              if (apiController.isLoading.value) {
                return const CircularProgressIndicator();
              } else if (apiController.error.value.isNotEmpty) {
                return Text(apiController.error.value);
              } else {
                return apiController.responseData.isEmpty
                    ? const Text('No data available')
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
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
                          // const CustomTextField(placeHolderText: "Search for patients..")
                        ],
                      );
              }
            })),
      ),
    );
  }
}
