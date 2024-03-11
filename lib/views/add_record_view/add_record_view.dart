import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:patientclinicflutter/views/add_record_view/add_record_form.dart';

import '../../components/customElevatedButton.dart';
import '../../components/customTextField.dart';
import '../../constants/const.dart';
import '../home_view/home_view.dart';
import '../register_view/register_view.dart';

class AddRecordView extends StatelessWidget {
  const AddRecordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white, size: 18),
          backgroundColor: ConstColors.priamryColor,
          centerTitle: true,
          title: TextStyles.regular(
              label: "Add Record",
              textColor: Colors.white,
              textSize: ConstSizes.largeSize,
              textWeight: FontWeight.w700),
        ),
        body: AddRecordForm());
  }
}
