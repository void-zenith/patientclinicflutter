import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/customElevatedButton.dart';
import '../../components/customTextField.dart';
import '../../constants/const.dart';
import '../home_view/home_view.dart';

class AddPatientForm extends StatefulWidget {
  @override
  _AddPatientState createState() => _AddPatientState();
}

class _AddPatientState extends State<AddPatientForm> {
  String? _gender;
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Form(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: TextStyles.regular(
                    label: "Patient's Full Name:",
                    textSize: ConstSizes.smallSize,
                    textColor: ConstColors.priamryColor,
                    textWeight: FontWeight.w500,
                  ),
                ),
                8.heightBox,
                CustomTextField(
                  placeHolderText: ConstString.patientNameHint,
                ),
                14.heightBox,
                Align(
                  alignment: Alignment.centerLeft,
                  child: TextStyles.regular(
                    label: "Patient's Email:",
                    textSize: ConstSizes.smallSize,
                    textColor: ConstColors.priamryColor,
                    textWeight: FontWeight.w500,
                  ),
                ),
                8.heightBox,
                CustomTextField(
                  placeHolderText: ConstString.patientEmail,
                ),
                14.heightBox,
                Align(
                  alignment: Alignment.centerLeft,
                  child: TextStyles.regular(
                    label: "Patient's Address:",
                    textSize: ConstSizes.smallSize,
                    textColor: ConstColors.priamryColor,
                    textWeight: FontWeight.w500,
                  ),
                ),
                8.heightBox,
                CustomTextField(
                  placeHolderText: ConstString.patientAddress,
                ),
                14.heightBox,
                Align(
                  alignment: Alignment.centerLeft,
                  child: TextStyles.regular(
                    label: "Patient's Number:",
                    textSize: ConstSizes.smallSize,
                    textColor: ConstColors.priamryColor,
                    textWeight: FontWeight.w500,
                  ),
                ),
                8.heightBox,
                CustomTextField(
                  placeHolderText: ConstString.patientNumber,
                ),
                24.heightBox,
                Align(
                  alignment: Alignment.centerLeft,
                  child: TextStyles.regular(
                    label: "Patient's Gender:",
                    textSize: ConstSizes.smallSize,
                    textColor: ConstColors.priamryColor,
                    textWeight: FontWeight.w500,
                  ),
                ),
                8.heightBox,
                RadioListTile<String>(
                  title: Text('Male'),
                  value: 'Male',
                  groupValue: _gender,
                  onChanged: (value) {
                    setState(() {
                      _gender = value;
                    });
                  },
                ),
                RadioListTile<String>(
                  title: Text('Female'),
                  value: 'Female',
                  groupValue: _gender,
                  onChanged: (value) {
                    setState(() {
                      _gender = value;
                    });
                  },
                ),
                RadioListTile<String>(
                  title: Text('Other'),
                  value: 'Other',
                  groupValue: _gender,
                  onChanged: (value) {
                    setState(() {
                      _gender = value;
                    });
                  },
                ),
                24.heightBox,
                Align(
                  alignment: Alignment.centerLeft,
                  child: TextStyles.regular(
                    label: "Patient's Date of Birth:",
                    textSize: ConstSizes.smallSize,
                    textColor: ConstColors.priamryColor,
                    textWeight: FontWeight.w500,
                  ),
                ),
                8.heightBox,
                Row(
                  children: [
                    TextStyles.regular(
                        label: "${selectedDate.toLocal()}".split(' ')[0],
                        textSize: ConstSizes.regularSize,
                        textWeight: FontWeight.bold,
                        textColor: ConstColors.textColor),
                    48.widthBox,
                    ElevatedButton(
                      onPressed: () => _selectDate(context),
                      child: TextStyles.regular(
                          label: "Select Date",
                          textSize: ConstSizes.regularSize,
                          textWeight: FontWeight.bold,
                          textColor: ConstColors.textColor),
                    ),
                  ],
                ),
                24.heightBox,
                CustomElevatedButton(
                  onPressed: () {
                    Get.to(() => HomeView());
                  },
                  buttonTextColor: Colors.white,
                  buttonColor: ConstColors.priamryColor,
                  buttonLabel: ConstString.addPatient,
                ),
              ],
            )),
          )),
    );
  }
}
