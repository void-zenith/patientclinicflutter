import 'package:flutter/material.dart';
import 'package:patientclinicflutter/constants/colors.dart';

class CustomTextField extends StatefulWidget {
  final String placeHolderText;
  final TextEditingController? textFieldController;
  const CustomTextField(
      {super.key, required this.placeHolderText, this.textFieldController});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.all(14),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ConstColors.redColor),
            borderRadius: BorderRadius.circular(14),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide:
                const BorderSide(color: Color.fromARGB(255, 182, 181, 181)),
            borderRadius: BorderRadius.circular(14),
          ),
          border: const OutlineInputBorder(),
          hintText: widget.placeHolderText),
    );
  }
}
