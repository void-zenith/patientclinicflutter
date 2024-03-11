import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/customElevatedButton.dart';
import '../../components/customTextField.dart';
import '../../constants/const.dart';
import '../home_view/home_view.dart';
import '../register_view/register_view.dart';
import 'add_patient_form.dart';

class AddPatientView extends StatelessWidget {
  const AddPatientView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white, size: 18),
          backgroundColor: ConstColors.priamryColor,
          centerTitle: true,
          title: TextStyles.regular(
              label: "Add Patient",
              textColor: Colors.white,
              textSize: ConstSizes.largeSize,
              textWeight: FontWeight.w700),
        ),
        body: AddPatientForm());
  }
}
