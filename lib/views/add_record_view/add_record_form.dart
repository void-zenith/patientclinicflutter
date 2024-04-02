import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:patientclinicflutter/controllers/record_controller.dart';

import '../../components/customElevatedButton.dart';
import '../../components/customTextField.dart';
import '../../constants/const.dart';
import '../home_view/home_view.dart';

class AddRecordForm extends StatefulWidget {
  final String userId;
  const AddRecordForm({Key? key, required this.userId}) : super(key: key);
  @override
  _AddRecordState createState() => _AddRecordState();
}

class _AddRecordState extends State<AddRecordForm> {
  late String _userId;

  @override
  void initState() {
    super.initState();
    _userId = widget.userId;
  }

  final TextEditingController _systolicBlood = TextEditingController();
  final TextEditingController _diastolicBlood = TextEditingController();
  final TextEditingController _respiratoryRate = TextEditingController();
  final TextEditingController _heartbeatRate = TextEditingController();
  final TextEditingController _bloodOxygenlevel = TextEditingController();

  DateTime selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    print(_userId);
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
                Align(
                  alignment: Alignment.centerLeft,
                  child: TextStyles.regular(
                    label: "Zenith Rajbhandari",
                    textSize: ConstSizes.largeSize,
                    textColor: ConstColors.priamryColor,
                    textWeight: FontWeight.w500,
                  ),
                ),
                14.heightBox,
                Align(
                  alignment: Alignment.centerLeft,
                  child: TextStyles.regular(
                    label: "Time Now:",
                    textSize: ConstSizes.smallSize,
                    textColor: ConstColors.priamryColor,
                    textWeight: FontWeight.w500,
                  ),
                ),
                8.heightBox,
                Align(
                  alignment: Alignment.centerLeft,
                  child: TextStyles.regular(
                    label: selectedDate.toLocal().toString(),
                    textSize: ConstSizes.largeSize,
                    textColor: ConstColors.priamryColor,
                    textWeight: FontWeight.w500,
                  ),
                ),
                14.heightBox,
                Align(
                  alignment: Alignment.centerLeft,
                  child: TextStyles.regular(
                    label: "Record Title",
                    textSize: ConstSizes.smallSize,
                    textColor: ConstColors.priamryColor,
                    textWeight: FontWeight.w500,
                  ),
                ),
                8.heightBox,
                CustomTextField(
                  textFieldController: _systolicBlood,
                  placeHolderText: ConstString.enterRecord,
                ),
                14.heightBox,
                Align(
                  alignment: Alignment.centerLeft,
                  child: TextStyles.regular(
                    label: "Systolic Blood Pressure",
                    textSize: ConstSizes.smallSize,
                    textColor: ConstColors.priamryColor,
                    textWeight: FontWeight.w500,
                  ),
                ),
                8.heightBox,
                CustomTextField(
                  textFieldController: _systolicBlood,
                  placeHolderText: ConstString.systolicHint,
                ),
                14.heightBox,
                Align(
                  alignment: Alignment.centerLeft,
                  child: TextStyles.regular(
                    label: "Diastolic Blood Pressure",
                    textSize: ConstSizes.smallSize,
                    textColor: ConstColors.priamryColor,
                    textWeight: FontWeight.w500,
                  ),
                ),
                8.heightBox,
                CustomTextField(
                  textFieldController: _diastolicBlood,
                  placeHolderText: ConstString.diastolicHint,
                ),
                24.heightBox,
                Align(
                  alignment: Alignment.centerLeft,
                  child: TextStyles.regular(
                    label: "Respiratory Rate:",
                    textSize: ConstSizes.smallSize,
                    textColor: ConstColors.priamryColor,
                    textWeight: FontWeight.w500,
                  ),
                ),
                8.heightBox,
                CustomTextField(
                  textFieldController: _respiratoryRate,
                  placeHolderText: ConstString.respiratoryHint,
                ),
                24.heightBox,
                Align(
                  alignment: Alignment.centerLeft,
                  child: TextStyles.regular(
                    label: "Heartbeat Rate:",
                    textSize: ConstSizes.smallSize,
                    textColor: ConstColors.priamryColor,
                    textWeight: FontWeight.w500,
                  ),
                ),
                8.heightBox,
                CustomTextField(
                  textFieldController: _heartbeatRate,
                  placeHolderText: ConstString.heartBeatHint,
                ),
                24.heightBox,
                Align(
                  alignment: Alignment.centerLeft,
                  child: TextStyles.regular(
                    label: "Blood Oxygen Level:",
                    textSize: ConstSizes.smallSize,
                    textColor: ConstColors.priamryColor,
                    textWeight: FontWeight.w500,
                  ),
                ),
                8.heightBox,
                CustomTextField(
                  textFieldController: _bloodOxygenlevel,
                  placeHolderText: ConstString.bloodOxygenHint,
                ),
                24.heightBox,
                Align(
                  alignment: Alignment.centerLeft,
                  child: TextStyles.regular(
                    label: "Record Summary",
                    textSize: ConstSizes.smallSize,
                    textColor: ConstColors.priamryColor,
                    textWeight: FontWeight.w500,
                  ),
                ),
                8.heightBox,
                CustomTextField(
                  textFieldController: _systolicBlood,
                  placeHolderText: ConstString.enterSummary,
                ),
                24.heightBox,
                CustomElevatedButton(
                  onPressed: () async {
                    Get.to(() => HomeView());
                  },
                  buttonTextColor: Colors.white,
                  buttonColor: ConstColors.priamryColor,
                  buttonLabel: ConstString.addRecord,
                ),
              ],
            )),
          )),
    );
  }
}
